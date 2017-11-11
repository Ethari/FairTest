<?php

class Loader extends CI_Model {

    /*
     * This method generates an admin page wrapped in all necessary elements.
     */
    public function generateAdminPage($page, $data = null){

        $current_page = array(
            'page' => $page
        );

        $this->load->view('/admin/header_admin');
        $this->load->view('/admin/navbar_admin');
        $this->load->view('/admin/sidebar_admin', $current_page);
        $this->load->view('/admin/'.$page, $data);

        if($page == 'create_question'){
            $this->load->view('/admin/questions/true_false');
            $this->load->view('/admin/questions/multiple_choice');
            $this->load->view('/admin/questions/open_question');
            $this->load->view('/admin/questions/end_of_question');
        }


        $this->load->view('/admin/footer_admin');
    }

    public function generatePage($page, $data = null){
        $current_page = array(
            'page' => $page
        );

        $this->load->view('header');
        $this->load->view('navbar');
        ChromePhp::log($page);
        if($page == 'exams'){
            $this->load->view('sidebar');
        }
        $this->load->view($page, $data);
        $this->load->view('footer');
    }
}