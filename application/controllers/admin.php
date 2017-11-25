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

    public function test(){
        $tests = array(
            "42",
            1337,
            "1e4",
            "not numeric",
            9.1
        );

        foreach ($tests as $element) {
            if (is_numeric($element)) {
                echo "'{$element}' is numeric <br>", PHP_EOL;
            } else {
                echo "'{$element}' is NOT numeric <br>", PHP_EOL;
            }
        }
    }
}
