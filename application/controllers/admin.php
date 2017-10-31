<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('loader');
        $this->load->model('Courses_Model');
    }

    public function index()
    {
        $page = 'home';
        $this->loader->generateAdminPage($page);
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
}
