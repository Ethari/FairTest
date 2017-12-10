<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Exams extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Courses_Model');
        $this->load->model('Tests_Model');
        $this->load->model('loader');
    }

    public function index(){
        $courses = $this->Courses_Model->getCourses(1);
        $tests = $this->Tests_Model->getStudentsScheduledTests(1);

        if(isset($tests['error'])){
            header('Location: ' . base_url());
        }

        $data = array(
            'courses' => $courses,
            'tests' => $tests
        );

        $this->loader->generatePage('exams', $data);

    }

    public function constructExam(){
        $test_id = $_POST['test_id'];
        $scheduled_test_id = $_POST['scheduled_test_id'];
        $student_id = $this->session->userdata('id');


        $params = array(
            'test_id' => $test_id,
            'scheduled_test_id' => $scheduled_test_id,
            'student_id' => $student_id
        );

        $new_test_id = $this->Tests_Model->constructExam($params);
        echo $new_test_id;
    }

    public function finishExam(){
        $test_id = $_POST['test_id'];
        $this->Tests_Model->finishExam($test_id);
        $this->Tests_Model->gradeExam($test_id);
    }

    public function take_exam($id){

        $params = array(
            'exam' => array(
                'id' => $id
            )
        );
        $this->loader->generatePage('take_exam', $params);
    }

    public function getGeneratedTestContent(){
        $id = $_POST['id'];
        $content = $this->Tests_Model->getGeneratedTestContent($id);
        if(isset($content['error'])){
            $this->session->set_flashdata('test_error', 'This test is over.');
            echo 'exam_error';
        } else{
            echo json_encode($content);

        }
    }

    public function getQuestionContent(){
        $id = $_POST['question_id'];
        $test_id = $_POST['test_id'];
        $content = $this->Tests_Model->getGeneratedQuestionContent($id, $test_id);
        echo json_encode($content);
    }

    public function saveTestAnswer(){
        ChromePhp::log($_POST);
        $answer = $_POST;
        $this->Tests_Model->saveTestAnswer($answer);


    }

    public function changePassword(){
        $page = 'change_password';
        $this->loader->generatePage($page);
    }
}
