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
}