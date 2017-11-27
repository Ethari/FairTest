<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('loader');
        $this->load->model('Courses_Model');
        $this->load->model('Tests_Model');

    }

    public function index()
    {
        $page = 'home';
        $scheduled_tests['tests'] = $this->Tests_Model->getScheduledTests(1);
        $scheduled_tests['ungraded_tests'] = $this->Tests_Model->getUngradedTests(1);
        $this->loader->generateAdminPage($page, $scheduled_tests);
        ChromePhp::log($scheduled_tests);
    }

    public function users(){
        $this->loader->generateAdminPage('users');
    }

    public function groups($mode){
        if($mode == "create"){
            $courses = $this->Courses_Model->getCourses(1);
            $data = array(
                'courses' => $courses
            );


            $this->loader->generateAdminPage('groups', $data);
        }
    }

    public function gradeTest($test_id){
        $test['test'] = $this->Tests_Model->getUngradedTest($test_id);
        $this->loader->generateAdminPage('grade_test', $test);

    }

    public function getUngradedTest(){
        $test_id = $_POST['id'];
        $test = $this->Tests_Model->getUngradedTest($test_id);
        unset($test['result']['manual_evaluation']);
        unset($test['result']['total_points']);
        ChromePhp::log($test);
        echo json_encode($test);
    }

    public function addQuestionPoints(){
        $question_data = $_POST;
        $this->Tests_Model->gradeExamQuestion($question_data);
        echo "OK";
    }

    public function finishGradingExam(){
        $test_id = $_POST['test_id'];
        $this->Tests_Model->finishGradingExam($test_id);
    }
}
