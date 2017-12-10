<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Account extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('loader');
        $this->load->model('Courses_Model');
        $this->load->model('Tests_Model');
        $this->load->model('Account_Model');
        $this->load->model('Authentication');
        $this->Authentication->hasPermission("teacher");

    }

    public function index()
    {
        $page = 'account';
        $data['user'] = $this->Account_Model->getCurrentUser();
        $this->loader->generateAdminPage($page, $data);

        $this->Authentication->hasPermission("teacher");
    }

    public function changeAccount(){
        $this->Authentication->hasPermission("teacher");
        $account = $_POST;
        if($this->Account_Model->changeUserAccount($account)){
            $this->session->set_flashdata('account_changed', true);
            echo "1";
        } else{
            $this->session->set_flashdata('account_error', true);
            echo '-1';

        }
    }

    public function changePassword(){
        $account = $_POST;
        ChromePhp::log("????");
        if($this->Account_Model->changeStudentPassword($account)){
            echo "1";
        } else{
            $this->session->set_flashdata('account_error', true);
            echo '-1';

        }
    }
}
