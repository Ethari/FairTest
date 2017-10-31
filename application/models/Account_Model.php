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
        if($this->db->insert('student', $student)){
            $id = $this->db->insert_id();
        } else{
            $id = -1;
        }
        return $id;
    }

    public function login($user){

        $this->db->where('studentIndex',$user['username']);
        $query = $this->db->get('student');

        if ($query->num_rows() > 0){
            $results = $query->result_array();
            $hashed_password = $results[0]['password'];

            if (hash_equals($hashed_password, crypt($user['password'], "d41d8cd98f00b204e9800998ecf8427e"))) {
                $user = array(
                    'username' => $user['username'],
                    'id' => $results[0]['id'],
                    'name' => $results[0]['firstName'],
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
        $user = array('username', 'logged_in', 'name', 'id');
        $this->session->unset_userdata($user);
    }
}