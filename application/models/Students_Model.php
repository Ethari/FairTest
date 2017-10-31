<?php

class Students_Model extends CI_Model {

    public function getAllStudents(){
        $sql = "SELECT * FROM student;";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function studentExists($studentIndex){
        $this->db->where('studentIndex', $studentIndex);
        $query = $this->db->get('student');

        if ($query->num_rows() > 0){
            return true;
        }
        else{
            return false;
        }
    }

    public function newStudent($data){
        $id = $this->db->insert_id();
        return $id;
    }

    public function deleteStudent($id){
        $this->db->where('id', $id);
        $this->db->delete('student');

        $this->db->where('student_id', $id);
        $this->db->delete('groups_students');
    }
}