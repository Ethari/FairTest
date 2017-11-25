<?php

class Tests_Model extends CI_Model {

    public function getTests($teacher_id){
        $sql = "SELECT t.*, COUNT(tq.question_id) AS number_of_questions
                FROM test t left JOIN tests_questions tq ON t.id = tq.test_id 
                GROUP BY t.id";
        $query = $this->db->query($sql);

        ChromePhp::log($sql);
        return $query->result_array();
    }

    public function getAvailableQuestions($id){
        $sql = "SELECT * FROM question WHERE id NOT IN (SELECT question_id FROM tests_questions WHERE test_id = ".$id.") ";
        $query = $this->db->query($sql);
        ChromePhp::log($sql);
        ChromePhp::log($query->result_array());

        return $query->result_array();
    }

    public function getTest($id){
        $sql = "SELECT * FROM test WHERE id = " . $id;
        $query = $this->db->query($sql);
        return $query->result_array()[0];
    }

    public function createTest($owner = 1){
        $test = array(
            'topic' => '',
            'owner' => $owner
        );
        $this->db->insert('test', $test);
        $id = $this->db->insert_id();

        $sql_update =  "UPDATE test
                        SET name = 'new_test_".$id."', topic = 'new_topic_".$id."' 
                        WHERE id = " . $id;

        ChromePhp::log($sql_update);

        $this->db->query($sql_update);

        return $id;
    }

    public function deleteTest($id){
        $this->db->where('id', $id);
        $this->db->delete('test');

        $this->db->where('test_id', $id);
        $this->db->delete('tests_questions');
    }

    public function getTestQuestions($id){
        $sql = "SELECT tq.*, q.type FROM tests_questions tq JOIN question q ON q.id = tq.question_id WHERE tq.test_id = " . $id;
        $query = $this->db->query($sql);
        return $query->result_array();

    }

    public function deleteQuestionFromTest($data){
        $this->db->where('question_id', $data['question_id']);
        $this->db->where('test_id', $data['test_id']);
        $this->db->delete('tests_questions');
    }

    public function addQuestionToTest($data){
        $this->db->insert('tests_questions', $data);
        $id = $this->db->insert_id();
        return $id;
    }

    public function updateTestParams($test_id, $params){
        $sql = "UPDATE test SET name = '" . $params['name'] . "', topic = '" . $params['topic'] . "' WHERE id = " . $test_id;

        ChromePhp::log($sql);
        $this->db->query($sql);
    }

    public function scheduleTest($test_params){
        $test_data = array(
            'test_id' => $test_params['test_id'],
            'start_time' => $this->parseWickedDate($test_params['start_time'], $test_params['start_date']),
            'test_time' => $test_params['test_time'],
            'end_time' => $this->parseWickedDate($test_params['end_time'], $test_params['start_date']),
            'result_presentation_type' => $test_params['result_presentation_type']
        );

        if($test_params['result_presentation_type'] == "specify_time"){
            $test_data['result_date'] = $this->parseWickedDate($test_params['result_hour'], $test_params['result_date']);
        }

        $group_ids = $this->getGroupIds($test_params);

        ChromePhp::log($test_data);
        ChromePhp::log($group_ids);


        $this->db->insert('test_schedule', $test_data);
        $scheduled_test_id = $this->db->insert_id();

        foreach($group_ids as $group_id){
            $test_group = array(
                'scheduled_test_id' => $scheduled_test_id,
                'group_id' => $group_id
            );
            $this->db->insert('test_schedule_group  ', $test_group);
        }


        ChromePhp::log($test_data);
        ChromePhp::log($group_ids);
    }

    private function getGroupIds($test_params){
        $matches = array();
        foreach($test_params as $key=>$value){
            if(preg_match("/(group)[_]\d+/", $key, $match)){
                $matches[] = $match;
            }
        }
        $group_ids = array();
        foreach($matches as $match){
            $group_ids[] = explode('_', $match[0])[1];
        }

        return $group_ids;
    }

    private function parseWickedDate($hour, $date){
        $datetime = $date . " " . $hour;
        ChromePhp::log($datetime);
        $date = DateTime::createFromFormat("d/m/Y H:i", $datetime);
        return($date->format('Y-m-d H:i:s'));


    }

    public function getScheduledTests ($teacher_id){
        $sql = "SELECT ts.*, t.*
                FROM test_schedule ts
                LEFT JOIN test t ON t.id  = ts.test_id 
                WHERE ts.end_time >= NOW()
                ORDER BY ts.start_time ASC";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function getStudentsScheduledTests(){
        $student_id = $this->session->userdata('id');
        if($student_id != null){
            $sql = "SELECT ts.*, t.topic, gt.id AS 'scheduled_id', gt.time_started, gt.ended
                FROM test_schedule ts
                JOIN test_schedule_group tsg ON tsg.scheduled_test_id  = ts.id 
                JOIN groups_students  gs ON gs.group_id = tsg.group_id
                JOIN test t ON t.id = ts.test_id
                LEFT JOIN generated_test gt ON gt.scheduled_test_id = tsg.scheduled_test_id 
                WHERE (ts.end_time >= NOW() AND gs.student_id = ".$student_id.")
                ORDER BY ts.start_time ASC";
            $query = $this->db->query($sql);
            $result = $query->result_array();

            ChromePhp::log($result);

            $now = date("Y-m-d H:i:s");
            foreach($result as $key => $test){
                $result[$key]['start_time'] = date("F jS Y H:i", strtotime($test['start_time']));
                $result[$key]['end_time'] = date("F jS Y H:i", strtotime($test['end_time']));

                if($test['result_presentation_type'] == 'end_of_exam'){
                    $result[$key]['result_presentation_type'] = "End of exam";
                } else if($test['result_presentation_type'] == 'specify_time'){
                    $result[$key]['result_presentation_type'] = date("F jS Y H:i", strtotime($test['result_date']));
                } else  if($test['result_presentation_type'] == 'manual'){
                    $result[$key]['result_presentation_type'] = "Teacher confirmation";
                }

                if($test['scheduled_id']){
                    $time_left = $test['test_time'] * 60 - (time() - $test['time_started']);
                    if($time_left <= 0 || $test['ended'] == true){
                        $result[$key]['exam_over'] = true;
                    }
                }

                if($now >= $test['start_time'] &&  $now < $test['end_time']){
                    $result[$key]['exam_started'] = true;
                } else{
                    $result[$key]['exam_started'] = false;
                }
            }
        } else{
            $result = array('error' => 'not_logged_in');
        }

        return $result;
    }

    public function constructExam($params){

        $old_id = $this->isTestGenerated($params);
        if($old_id != false){
            ChromePhp::log("OLD ID: " . $old_id);
            return $old_id;
        }

        $test_id = $params['test_id'];
        $scheduled_test_id = $params['scheduled_test_id'];
        $student_id = $params['student_id'];

        $random_questions = $this->randomQuestionList($test_id);
        $random_exam = serialize($random_questions);

        $test = array(
            'scheduled_test_id' => $scheduled_test_id,
            'student_id' => $student_id,
            'random_test' => $random_exam,
            'time_started' => time()
        );

        $this->db->insert('generated_test', $test);
        $id = $this->db->insert_id();

        return $id;

        ChromePhp::log($random_questions);
        ChromePhp::log($random_exam);

    }

    private function isTestGenerated($params){
        $sql = "SELECT * FROM generated_test gt 
                WHERE (gt.scheduled_test_id = " .$params['scheduled_test_id'].
                " AND gt.student_id = " . $params['student_id'] . ")";
        $query = $this->db->query($sql);
        if ($query->num_rows() > 0) {
            $result = $query->result_array();
            $test_id = $result[0]['id'];

            return $test_id;
        } else{
            return false;
        }

    }

    private function randomQuestionList($test_id){
        $random_questions = $this->randomQuestionOrder($test_id);
        $random_question_answers = $this->randomQuestionAnswers($random_questions);
        return $random_question_answers;
    }

    private function randomQuestionAnswers($questions){
        foreach($questions as $key => $question){
            switch($question['type']){
                case 'true_false':
                    $sql = "SELECT * 
                            FROM true_false_question tfq 
                            WHERE(tfq.question_id = ".$question['question_id'].")
                            ORDER BY RAND()";
                    $query = $this->db->query($sql);
                    $tf_question = $query->result_array();
                    $questions[$key]['answers'] = $tf_question;
                    break;
                case 'multiple_choice':
                    $sql = "SELECT * 
                            FROM multiple_choice_question mcq 
                            WHERE(mcq.question_id = ".$question['question_id'].")
                            ORDER BY RAND()";
                    $query = $this->db->query($sql);
                    $mc_question = $query->result_array();
                    $questions[$key]['answers'] = $mc_question;
                    break;
                case 'open_question':
                    break;

            }
        }

        return $questions;

    }

    private function randomQuestionOrder($test_id){
        $sql = "SELECT ts.question_id, q.description, qt.page AS 'type', tq.correct_answer_points, tq.incorrect_answer_points, tq.automatic_eval FROM 
                tests_questions ts 
                JOIN question q ON q.id = ts.question_id
                JOIN question_types qt ON qt.id = q.type
                JOIN tests_questions tq ON tq.question_id = q.id  
                WHERE (ts.test_id = ".$test_id." AND tq.test_id = ".$test_id.") 
                ORDER BY RAND()";
        $query = $this->db->query($sql);
        $questions = $query->result_array();

        return $questions;
    }

    public function getGeneratedQuestionContent($question_id, $test_id){
        $sql = "SELECT ts.* 
                FROM generated_test ts 
                JOIN test_schedule t ON ts.scheduled_test_id = t.id
                WHERE ts.id = ".$test_id;
        $query = $this->db->query($sql);
        $test = $query->result_array()[0];
        $all_questions = unserialize($test['random_test']);
        ChromePhp::log($all_questions);
        $student_id = $this->session->userdata('id');
        $new_question = null;
        foreach($all_questions as $q_key => $question){
            if($question['question_id'] != $question_id){
                continue;
            }
            else{
                $new_question = $question;
                if(isset($question['answers'])){
                    foreach($question['answers'] as $key => $answer){
                        $sql = "SELECT tsa.answer
                        FROM test_student_answers tsa 
                        WHERE (tsa.scheduled_test_id = ".$test['id']." AND 
                        tsa.question_id = ".$question['question_id']." AND tsa.student_id = ".$student_id." AND 
                        tsa.subquestion_id = ".$answer['id'].")";
                        $query = $this->db->query($sql);
                        if ($query->num_rows() > 0) {
                            $answer = $query->result_array()[0]['answer'];
                            $new_question['answers'][$key]['selected_answer'] = $answer;
                        }
                    }
                } else{
                    $sql = "SELECT tsa.answer
                        FROM test_student_answers tsa 
                        WHERE (tsa.scheduled_test_id = ".$test['id']." AND 
                        tsa.question_id = ".$question['question_id']." AND tsa.student_id = ".$student_id.")";
                    $query = $this->db->query($sql);
                    if ($query->num_rows() > 0) {
                        $answer = $query->result_array()[0]['answer'];
                        $new_question['selected_answer'] = $answer;
                    }
                }
                break;
            }
        }

        ChromePhp::log($new_question);
        return $new_question;
    }

    public function getGeneratedTestContent($test_id){
        $sql = "SELECT ts.*, t.test_time, t.end_time
                FROM generated_test ts 
                JOIN test_schedule t ON ts.scheduled_test_id = t.id
                WHERE ts.id = ".$test_id;
        $query = $this->db->query($sql);
        $test = $query->result_array()[0];
        $content_unserialized = unserialize($test['random_test']);

        if($test['end_time'] <= date('Y-m-d H:i:s') || $test['ended'] == true){
            $test_ended = true;
        } else{
            $test_ended = false;
        }
        $time_left = $test['test_time'] * 60 - (time() - $test['time_started']);
        $content_unserialized['time_left'] = $time_left;

        if($time_left <= 0 ||$test_ended){
            $error = array(
                'error' => 'Test ended'
            );

            return $error;
        }
        ChromePhp::log($test);

        $student_id = $this->session->userdata('id');
        foreach($content_unserialized as $q_key => $question){
            if($question['type'] != 'open_question'){
                if(isset($question['answers'])){
                    foreach($question['answers'] as $a_key => $answer){
                        $sql = "SELECT tsa.answer
                            FROM test_student_answers tsa 
                            WHERE (tsa.scheduled_test_id = ".$test['id']." AND 
                            tsa.question_id = ".$question['question_id']." AND tsa.student_id = ".$student_id." AND 
                            tsa.subquestion_id = ".$answer['id'].")";
                        $query = $this->db->query($sql);
                        if ($query->num_rows() > 0) {
                            $answer = $query->result_array()[0]['answer'];
                            $content_unserialized[$q_key]['answers'][$a_key]['selected_answer'] = $answer;
                        }
                    }
                }
            } else{
                $sql = "SELECT tsa.answer
                        FROM test_student_answers tsa 
                        WHERE (tsa.scheduled_test_id = ".$test['id']." AND 
                        tsa.question_id = ".$question['question_id']." AND tsa.student_id = ".$student_id.")";
                $query = $this->db->query($sql);
                if ($query->num_rows() > 0) {
                    $answer = $query->result_array()[0]['answer'];
                    $content_unserialized[$q_key]['selected_answer'] = $answer;
                }
            }
        }

        ChromePhp::log("CONTENT");
        ChromePhp::log($content_unserialized);
        return $content_unserialized;
    }

    public function saveTestAnswer($answer){
        $student_id = $this->session->userdata('id');
        $answer['student_id'] = $student_id;

        $this->db->replace('test_student_answers', $answer);
    }

    public function updateQuestionPoints($params){
        $sql = "UPDATE tests_questions ts SET ts.correct_answer_points = ".$params['correct_answer_points'].
               ", ts.incorrect_answer_points = ".$params['incorrect_answer_points'].", ts.automatic_eval = ".$params['automatic_eval'].
               " WHERE (ts.question_id = ".$params['question_id']." AND ts.test_id = ".$params['test_id']." )";

        ChromePhp::log($sql);
        $this->db->query($sql);
    }

    public function finishExam($test_id){
        $sql = "UPDATE generated_test g SET g.ended = true 
                WHERE g.id = ".$test_id;
        $this->db->query($sql);
    }

    public function gradeExam($generated_test_id){
        ChromePhp::log("Grading");
        $sql = "SELECT * FROM generated_test gt 
                WHERE gt.id =".$generated_test_id;
        $query = $this->db->query($sql);
        $result = $query->result_array()[0];
        $generated_test = unserialize($result['random_test']);

        ChromePhp::log($generated_test);

        $graded_test = array();
        foreach($generated_test as $test_question){
            if($test_question['automatic_eval'] == 1){
                $graded_test[] = $this->evaluateQuestion($test_question, $generated_test_id, $result['student_id']);
            } else{
                $graded_test[] = $this->getQuestionAnswer($test_question, $generated_test_id, $result['student_id']);
                $graded_test['manual_evaluation'] = true;
            }
        }

        $graded_test['total_points'] = 0;
        foreach($graded_test as $graded_question){
            $graded_test['total_points'] += $graded_question['total_points'];
        }

        ChromePhp::log($graded_test);

        $test_results = array(
            'generated_test_id' => $generated_test_id,
            'result' => serialize(($graded_test)),
            'fully_evaluated'=> ($graded_test['manual_evaluation'] ? false : true)
        );
        $this->db->insert('test_results', $test_results);
    }

    public function getQuestionAnswer($question, $generated_test_id, $student_id){
        ChromePhp::log("Manual");
        $sql = "SELECT tsa.* FROM test_student_answers tsa 
                WHERE (tsa.scheduled_test_id =".$generated_test_id." AND tsa.student_id = ".$student_id." 
                AND tsa.question_id = ".$question['question_id'].")";
        $query = $this->db->query($sql);
        $question_answers = $query->result_array();

        if($question['type'] == "multiple_choice" || $question['type'] == 'true_false'){
            foreach($question_answers as $question_answer){
                foreach($question['answers'] as $key => $student_answer){
                    if($student_answer['id'] == $question_answer['subquestion_id']){
                        $question['answers'][$key]['student_answer'] = $question_answer['answer'];
                        break;
                    }
                }
            }
        } else{
            $question['answer'] = $question_answers[0]['answer'];
        }
        ChromePhp::log($question);
        return $question;
    }

    public function evaluateQuestion($question, $generated_test_id, $student_id){
        if($question['type'] == "multiple_choice" || $question['type'] == 'true_false'){
            $sql = "SELECT tsa.* FROM test_student_answers tsa 
                WHERE (tsa.scheduled_test_id =".$generated_test_id." AND tsa.student_id = ".$student_id." 
                AND tsa.question_id = ".$question['question_id'].")";
            $query = $this->db->query($sql);
            $question_answers = $query->result_array();

            foreach($question_answers as $question_answer){
                foreach($question['answers'] as $key => $student_answer){
                    if($student_answer['id'] == $question_answer['subquestion_id']){
                        $question['answers'][$key]['student_answer'] = $question_answer['answer'];
                        break;
                    }
                }
            }
        }

        $correct_answers = 0;
        $wrong_answers = 0;
        foreach($question['answers'] as $answer){
            if($question['type'] == "multiple_choice"){
                if($answer['answer'] == false){
                    if(isset($answer['student_answer'])){
                        $wrong_answers+=1;
                    }
                } else{
                    if(isset($answer['student_answer'])){
                        if($answer['student_answer'] == $answer['answer']){
                            $correct_answers+=1;
                        } else{
                            $wrong_answers+=1;
                        }
                    }
                }
            } elseif($question['type'] == "true_false"){
                if(!isset($answer['student_answer'])){
                    $wrong_answers++;
                } else{
                    if($answer['student_answer'] == $answer['answer']){
                        ChromePhp::log("CORRECT");
                        $correct_answers+= 1;
                    } else{
                        $wrong_answers+= 1;
                    }
                }
            }
        }

        $question['correct_answers'] = $correct_answers;
        $question['wrong_answers'] = $wrong_answers;

        $positive_points = $correct_answers * floatval($question['correct_answer_points']);
        $negative_points = $wrong_answers * floatval($question['incorrect_answer_points']);
        $total_points = $positive_points + $negative_points;

        $question['positive_points'] = $positive_points;
        $question['negative_points'] = $negative_points;
        $question['total_points'] = $total_points;


        /*$sql = "SELECT tsa.* FROM test_student_answers tsa
                WHERE (tsa.scheduled_test_id =".$generated_test_id." AND student_id = ".$student_id." AND question_id = ".$question['question_id'].")";
        $query = $this->db->query($sql);
        $question_answer = $query->result_array()[0];
        ChromePhp::log($question_answer);*/
        ChromePhp::log($question);

        return $question;
    }

    public function getUngradedTests($teacher_id){
        ChromePhp::log("ungraded");
        $sql = "SELECT ts.*, CONCAT(s.firstName, ' ', s.lastName) AS student_name, t.name as 'test_name', t.topic FROM test_results ts
                JOIN generated_test gt ON gt.scheduled_test_id = ts.generated_test_id
                LEFT JOIN test_schedule tsch ON tsch.id = gt.scheduled_test_id
                LEFT JOIN test t ON t.id = tsch.test_id
                JOIN student s ON s.id = gt.student_id 
                WHERE ts.fully_evaluated = FALSE ";
        $query = $this->db->query($sql);
        $results = $query->result_array();

        foreach($results as $key=>$result){
            $results[$key]['result'] = unserialize($result['result']);
        }
        ChromePhp::log($results);

        return $results;
    }

    public function getUngradedTest($test_id){
        ChromePhp::log("ungraded");
        $sql = "SELECT ts.*, CONCAT(s.firstName, ' ', s.lastName) AS student_name, t.name as 'test_name', t.topic FROM test_results ts
                JOIN generated_test gt ON gt.scheduled_test_id = ts.generated_test_id
                LEFT JOIN test_schedule tsch ON tsch.id = gt.scheduled_test_id
                LEFT JOIN test t ON t.id = tsch.test_id
                JOIN student s ON s.id = gt.student_id 
                WHERE ts.generated_test_id = " . $test_id;
        $query = $this->db->query($sql);
        $results = $query->result_array()[0];

        $results['result'] = unserialize($results['result']);

        ChromePhp::log($results);

        return $results;
    }


}