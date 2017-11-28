<?php

class Authentication extends CI_Model {

    /*
     * This method generates an admin page wrapped in all necessary elements.
     */
    public function register($user){
        $this->db->where('username', $user['username']);
        $query = $this->db->get('user');

        if ($query->num_rows() > 0)
        {
            return false;
        } else {
            $this->db->insert('user', $user);
            return true;
        }
    }

    public function hasPermission($permission_type, $id = null){
        $session = $this->session->userdata();
        $access = false;

        switch($permission_type){
            case 'student':
                if(isset($session['type'])) {
                    if ($id != null) {
                        if ($session['type'] == 'student' && $session['id'] == $id) {
                            $access = true;
                        }
                    } else {
                        if ($session['type'] == 'student') {
                            $access = true;
                        }
                    }
                }
                break;
            case 'teacher':
                if(isset($session['type'])){
                    if($session['type'] == 'teacher'){
                        $access = true;
                    }
                }

        }
        ChromePhp::log($session);
        ChromePhp::log($access);
        if(!$access){
            header('Location: ' . base_url());
        }

    }
}