<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Students extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Students_Model');
        $this->load->model('Account_Model');

        $this->load->model('loader');

        $this->load->model('Authentication');
        $this->Authentication->hasPermission("teacher");
    }

    public function index(){
        $students = $this->Students_Model->getAllStudents();
        $data = array(
            'students' => $students
        );

        $this->loader->generateAdminPage('students', $data);

    }

    public function newStudent(){
        $student = $_POST;
        $student_id = $this->Account_Model->register($student);
        ChromePhp::log($student_id);
        echo $student_id;
    }

    public function studentExists(){

        $studentIndex = $_POST['studentIndex'];
        if($this->Students_Model->studentExists($studentIndex)){
            echo "false";
        } else{
            echo "true";
        }
    }

    public function deleteStudent(){
        $id = $_POST['id'];
        $this->Students_Model->deleteStudent($id);
        echo "true";
    }
}
