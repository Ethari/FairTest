<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Courses extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Courses_Model');
        $this->load->model('loader');

        $this->load->model('Authentication');
        $this->Authentication->hasPermission("teacher");
    }

    public function index(){
        $courses = $this->Courses_Model->getCourses(1);
        $data = array(
            'courses' => $courses
        );

        $this->loader->generateAdminPage('courses', $data);

    }

    public function newCourse(){
        $name = $_POST['name'];
        $new_course = $this->Courses_Model->newCourse($name);
        echo $new_course;
    }

    public function deleteCourse(){
        $id = $_POST['course_id'];
        $this->Courses_Model->deleteCourse($id);
        echo "true";
    }
}
