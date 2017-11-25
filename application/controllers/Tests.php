<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tests extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Questions_Model');
        $this->load->model('Courses_Model');
        $this->load->model('Tests_Model');
        $this->load->model('Groups_Model');
        $this->load->model('loader');
    }

    public function index(){
        $tests = $this->Tests_Model->getTests(1);
        $data = array(
            'tests' => $tests
        );

        $this->loader->generateAdminPage('tests', $data);
    }

    public function details($id){
        $result = $this->Questions_Model->getQuestionDetails($id);
        echo "<pre>";
        print_r($result);
        echo "</pre>";
    }

    public function new_test(){
        $id = $this->Tests_Model->createTest();
        echo $id;
    }

    public function create_test($id){
        $questions = $this->Tests_Model->getAvailableQuestions($id);
        $test = $this->Tests_Model->getTest($id);
        $data = array(
            'questions' => $questions,
            'test' => $test
        );

        $this->loader->generateAdminPage('create_test', $data);
    }

    public function schedule_test($id){
        $questions = $this->Tests_Model->getAvailableQuestions($id);
        $test = $this->Tests_Model->getTest($id);
        $groups = $this->Groups_Model->getGroups(1);
        $data = array(
            'questions' => $questions,
            'test' => $test,
            'groups' => $groups
        );

        $this->loader->generateAdminPage('schedule_test', $data);
    }

    public function save_schedule_test(){
        $test_details = $_POST;
        ChromePhp::log($_POST);
        $this->Tests_Model->scheduleTest($test_details);
        $this->session->set_flashdata('test_scheduled', $test_details);

    }

    public function get_test_questions(){
        $id = $_POST['id'];
        $questions = $this->Tests_Model->getTestQuestions($id);
        echo json_encode($questions);
    }

    public function add_question_to_test(){
        $test_id = $_POST['test_id'];
        $question_id = $_POST['question_id'];

        $data = array(
            'test_id' => $test_id,
            'question_id' => $question_id
        );

        $this->Tests_Model->addQuestionToTest($data);

    }

    public function delete_question(){
        $question_id = $_POST['question_id'];
        $test_id = $_POST['test_id'];
        $data = array(
            'question_id' => $question_id,
            'test_id' => $test_id
        );

        ChromePhp::log($data);
        $id = $this->Tests_Model->deleteQuestionFromTest($data);
        echo $id;

    }

    public function delete_test(){
        $id = $_POST['id'];
        ChromePhp::log($id);
        $this->Tests_Model->deleteTest($id);
        echo "true";
    }

    public function saveTestParams(){
        $params = array(
            'name' => $_POST['test_name'],
            'topic' => $_POST['test_topic']
        );

        $test_id = $_POST['test_id'];
        $this->Tests_Model->updateTestParams($test_id, $params);
    }

    public function update_question_points(){
        $params = $_POST;

        $this->Tests_Model->updateQuestionPoints($params);
    }

}
