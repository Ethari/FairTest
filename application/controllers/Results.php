<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Results extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Courses_Model');
        $this->load->model('Tests_Model');
        $this->load->model('loader');

        $this->load->model('Authentication');
        $this->Authentication->hasPermission("student");

    }

    public function index(){
        $student_id = $this->session->userdata('id');
        $results = $this->Tests_Model->getGradedTests($student_id);

        $data = array(
            'results' => $results
        );

        $this->loader->generatePage('results', $data);

    }

    public function view($test_id){
        $test['test'] = $this->Tests_Model->getUngradedTest($test_id);
        $this->loader->generatePage('view_test', $test);
    }

    public function viewGradedTest(){
        $test_id = $_POST['id'];
        $test = $this->Tests_Model->getUngradedTest($test_id);

        ChromePhp::log("Viewing graded test");
        ChromePhp::log($test);

        echo json_encode($test);

    }

}
