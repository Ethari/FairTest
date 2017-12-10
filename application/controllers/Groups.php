<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Groups extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Groups_Model');
        $this->load->model('Courses_Model');
        $this->load->model('loader');

        $this->load->model('Authentication');
        $this->Authentication->hasPermission("teacher");
    }

    public function index(){
        $courses = $this->Courses_Model->getCourses(1);
        $groups = $this->Groups_Model->getGroups(1);
        $data = array(
            'courses' => $courses,
            'groups' => $groups
        );

        $this->loader->generateAdminPage('groups', $data);

    }

    public function newGroup(){
        $new_group = $this->Groups_Model->newGroup($_POST);
        $this->session->set_flashdata('group_added', true);
        echo $new_group;
    }

    public function deleteGroup(){
        $id = $_POST['group_id'];
        $this->Groups_Model->deleteGroup($id);
        echo "true";
    }

    public function deleteStudent(){
        $group_id = $_POST['group_id'];
        $student_id = $_POST['student_id'];
        $this->Groups_Model->deleteStudent($student_id, $group_id);
        echo "true";
    }

    public function students($group_id){
        $students_group = $this->Groups_Model->getStudents($group_id);
        $students_not_group = $this->Groups_Model->getStudentsNotInGroup($group_id);
        $group_name = $this->Groups_Model->getGroupName($group_id);
        $data = array(
            'students_group' => $students_group,
            'students_not_group' => $students_not_group,
            'group_name' => $group_name,
            'group_id' => $group_id
        );

        $this->loader->generateAdminPage('students_in_group', $data);
    }

    public function addStudentsCSV($group_id){
        $csv = str_getcsv(utf8_encode(file_get_contents($_FILES['csv_file']['tmp_name'])))[0];
        $students_added = $this->Groups_Model->addStudentsCSV($csv, $group_id);

        if($students_added == 0){
            $students_added = '0';
        }

        $this->session->set_flashdata('students_added', $students_added);
        redirect(base_url() . "groups/students/" . $group_id, 'refresh');
    }

    public function addStudentsToGroup(){
        $student_ids = json_decode(stripslashes($_POST['data']));
        $group_id = $_POST['group_id'];
        $this->Groups_Model->addStudentsToGroup($group_id, $student_ids);
        $this->session->set_flashdata('students_added', count($student_ids));
        redirect($this->students(3), 'refresh');
    }
}
