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

    public function changeStudentPassword($data){
        ChromePhp::log("Changing password");
        $user_id = $this->session->userdata('id');
        $new_password = crypt($data['new_password'], 'd41d8cd98f00b204e9800998ecf8427e');
        $sql = "UPDATE user u SET u.password = '" .$new_password. "' WHERE u.id = " . $user_id;
        $this->db->query($sql);
        $sql = "UPDATE student s SET s.changed_password = '1' WHERE s.user_id = " . $user_id;
        $this->db->query($sql);

        $this->session->unset_userdata('change_password');
    }

    public function changeUserAccount($data){
        ChromePhp::log($data);
        $user_id = $this->session->userdata('id');
        $new_data = array();
        if(isset($data['fName'])){
            $new_data['firstName'] = $data['fName'];
        }
        if(isset($data['lName'])){
            $new_data['lastName'] = $data['lName'];
        }
        ChromePhp::log("???");
        if(isset($data['current_password'])){

            $this->db->where('id', $user_id);
            $query = $this->db->get('user');
            ChromePhp::log("TEST");

            if ($query->num_rows() > 0){
                $results = $query->result_array();
                ChromePhp::log("HERE");
                ChromePhp::log($results);
                $hashed_password = $results[0]['password'];

                if (hash_equals($hashed_password, crypt($data['current_password'], "d41d8cd98f00b204e9800998ecf8427e"))) {
                    ChromePhp::log("Upadting");
                    $this->updatePassword($user_id, $data['new_password'], $data['repeat_new_password'], $new_data);
                    return true;
                } else{
                    ChromePhp::log("NO");
                    return false;
                }
            }
            else{
                return false;
            }
        } else if($new_data['firstName'] != null){
            $sql = "UPDATE user u SET u.firstName = ".$new_data['firstName']." , u.lastName = ".$new_data['lastName']." WHERE u.id = " . $user_id;
            $this->db->query($sql);
            return true;
        }
        else{
            $this->updatePassword($user_id, $data['new_password'], $data['repeat_new_password']);
            return true;
        }
    }

    public function updatePassword($user, $password1, $password2, $new_data = null){
        ChromePhp::log($new_data);
        if($password1 !== '' && $password2 !== ''){
            $new_password = crypt($password1, 'd41d8cd98f00b204e9800998ecf8427e');
            if($new_data !== null){
                $sql = "UPDATE user u SET u.password = '" .$new_password. "', u.firstName = '".$new_data['firstName']."' , u.lastName = '".$new_data['lastName']."' WHERE u.id = " . $user;
                ChromePhp::log($sql);
            } else{
                $sql = "UPDATE user u SET u.password = '" .$new_password. "' WHERE u.id = " . $user;
            }
            $this->db->query($sql);
        } else{
            $sql = "UPDATE user u SET u.firstName = '".$new_data['firstName']."' , u.lastName = '".$new_data['lastName']."' WHERE u.id = " . $user;
            ChromePhp::log($sql);
            $this->db->query($sql);
        }

        if($new_data !== null){
            $userdata = array(
                'name' => $new_data['firstName'],
                'lastName' => $new_data['lastName']
            );
            $this->session->set_userdata($userdata);

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

    public function getCurrentUser(){
        $user_id = $this->session->userdata('id');
        $this->db->where('id', $user_id);
        $query = $this->db->get('user');
        return $query->result_array()[0];
    }


    public function login($user){

        $this->db->where('username', $user['username']);
        $query = $this->db->get('user');

        ChromePhp::log("Logged in");

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
                    'logged_in' => time(),
                );

                if($results[0]['type'] === 'student'){
                    $user_id = $results[0]['id'];

                    ChromePhp::log($user_id);
                    $this->db->where('user_id', $user_id);
                    $query = $this->db->get('student');
                    $student = $query->result_array()[0];

                    ChromePhp::log($student);

                    if($student['changed_password'] === '0'){
                        $user['change_password'] = true;
                    }
                }

                $this->session->set_userdata($user);

                ChromePhp::log("Here");

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
        $user = array('username', 'logged_in', 'name', 'id', 'type', 'lastName', 'change_password');
        $this->session->unset_userdata($user);
    }
}