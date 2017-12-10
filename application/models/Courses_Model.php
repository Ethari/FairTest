<?php

class Courses_Model extends CI_Model {

    public function getCourses($user){
        $sql = "SELECT c.*, COUNT(DISTINCT g.id) AS 'number_of_groups', COUNT(DISTINCT gs.student_id) AS 'number_of_students' FROM course c
                LEFT JOIN groups g ON g.course_id = c.course_id
                LEFT JOIN groups_students gs ON g.id = gs.group_id GROUP BY c.course_id ORDER BY c.name";
        $query = $this->db->query($sql);
        ChromePhp::log($query->result_array());
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
            $this->session->set_flashdata('course_added', true);
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