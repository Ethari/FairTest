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
        $sql = "SELECT tq.question_id, q.type FROM tests_questions tq JOIN question q ON q.id = tq.question_id WHERE tq.test_id = " . $id;
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

}