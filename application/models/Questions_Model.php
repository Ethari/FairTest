<?php

class Questions_Model extends CI_Model {

    public function getQuestions(){
        $sql = "SELECT q.id, q.description, q.tags, q.date_added, qt.name as type FROM question q JOIN question_types qt ON q.type = qt.id;";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function getQuestionDetails($id, $test_id){
        $sql = "SELECT q.*, tq.correct_answer_points, tq.incorrect_answer_points, tq.automatic_eval FROM question q " .
               "LEFT JOIN tests_questions tq ON tq.question_id = q.id " .
               "WHERE (q.id = " . $id . " AND tq.test_id = ".$test_id.") ";
        $query = $this->db->query($sql);
        ChromePhp::log($sql);
        $result = $query->result_array()[0];

        switch($result['type']){
            case 1:
                $additional_data = "SELECT * FROM true_false_question WHERE question_id = " . $result['id'];
                break;
            case 2:
                $additional_data = "SELECT * FROM multiple_choice_question WHERE question_id = " . $result['id'];
                break;
            case 3:
                return $result;
                break;
        }

        $query2 = $this->db->query($additional_data);

        $result['questions'] = $query2->result_array();

        return $result;
    }

    public function getQuestionsTypes(){
        $sql = "SELECT * FROM question_types;";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function studentExists($studentIndex){
        $this->db->where('studentIndex', $studentIndex);
        $query = $this->db->get('student');

        if ($query->num_rows() > 0){
            return true;
        }
        else{
            return false;
        }
    }

    public function insertQuestionBase($attributes){
        $values = $attributes;
        $values['date_added'] = date('Y-m-d H:i:s');
        ChromePhp::log($values);
        $this->db->insert('question', $values);
        $id = $this->db->insert_id();
        ChromePhp::log($id);

        return $id;
    }

    public function createTrueFalseQuestion($questions, $attributes){

        ChromePhp::log($attributes);

        $id = $this->insertQuestionBase($attributes);

        ChromePhp::log($id);

        foreach($questions as $key => $value){
            if(strlen($key) > 1){
                continue;
            } else{
                $q_description = $questions[$key];
                $q_answer = "";
                foreach($questions as $index => $val){
                    $phrase = "value".$key;
                    if($index === $phrase){
                        $q_answer = $val;
                    }
                }
            }

            $insert_question = array(
                'description' => $q_description,
                'answer' => $q_answer,
                'question_id' => $id
            );

            $this->db->insert('true_false_question', $insert_question);
        }

    }

    public function createOpenQuestion($questions, $attributes){
        $id = $this->insertQuestionBase($attributes);
    }

    public function createMultipleChoiceQuestion($questions, $attributes){

        ChromePhp::log($attributes);

        $id = $this->insertQuestionBase($attributes);

        foreach($questions as $key => $value){
            if(strlen($key) > 1){
                continue;
            } else{
                $q_description = $questions[$key];
                $q_answer = "";
                foreach($questions as $index => $val){
                    $phrase = "mc_value".$key;
                    if($index === $phrase){
                        $q_answer = $val;
                    }
                }
            }

            $insert_question = array(
                'description' => $q_description,
                'answer' => $q_answer,
                'question_id' => $id
            );

            $this->db->insert('multiple_choice_question', $insert_question);
        }

    }

    public function deleteStudent($id){
        $this->db->where('id', $id);
        $this->db->delete('student');

        $this->db->where('student_id', $id);
        $this->db->delete('groups_students');
    }
}