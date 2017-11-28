<?php

class Account_Model extends CI_Model {

    /*
     * This method generates an admin page wrapped in all necessary elements.
     */
    public function registerManyStudents($students){
        foreach($students as $student){
            $this->register($student);
        }
    }

    public function register($student){
        $student['password'] = crypt($student['lastName'], 'd41d8cd98f00b204e9800998ecf8427e');
        $user = array(
            'firstName' => $student['firstName'],
            'lastName' => $student['lastName'],
            'username' => $student['studentIndex'],
            'password' => $student['password'],
            'type' => 'student'
        );

        if($this->db->insert('user', $user)){
            $id = $this->db->insert_id();
            $student = array(
                'user_id' => $id,
                'studentIndex' => $student['studentIndex']
            );
            $this->db->insert('student', $student);
        } else{
            $id = -1;
        }
        return $id;
    }

    public function getStudentID($user_id){
        $sql = "SELECT s.studentIndex FROM student s WHERE s.user_id = " . $user_id;
        $query = $this->db->query($sql);
        $student_array = $query->result_array()[0];
        return $student_array['studentIndex'];
    }

    public function login($user){

        $this->db->where('username', $user['username']);
        $query = $this->db->get('user');

        if ($query->num_rows() > 0){
            $results = $query->result_array();
            $hashed_password = $results[0]['password'];

            if (hash_equals($hashed_password, crypt($user['password'], "d41d8cd98f00b204e9800998ecf8427e"))) {
                $user = array(
                    'username' => $user['username'],
                    'id' => $results[0]['id'],
                    'name' => $results[0]['firstName'],
                    'lastName' => $results[0]['lastName'],
                    'type' => $results[0]['type'],
                    'logged_in' => time()
                );
                $this->session->set_userdata($user);
                return true;
            } else{
                return false;
            }
        }
        else{
            return false;
        }

    }

    public function logout(){
        $user = array('username', 'logged_in', 'name', 'id', 'type', 'lastName');
        $this->session->unset_userdata($user);
    }
}