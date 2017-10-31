<?php

class Courses_Model extends CI_Model {

    public function getCourses($user){
        $sql = "SELECT * FROM course WHERE owner = " . $user . " ORDER BY name";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function newCourse($name){
        $this->db->where('name', $name);
        $query = $this->db->get('course');

        if ($query->num_rows()  == 0)
        {
            $data = array(
                'name' => $name,
                'owner' => 1
            );

            $this->db->insert('course', $data);
            $id = $this->db->insert_id();
            return $id;
        } else {
            return -1;
        }
    }


    public function deleteCourse($id){
        $this->db->where('course_id', $id);
        $this->db->delete('course');
    }
}