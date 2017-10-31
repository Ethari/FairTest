<?php
class Register extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->load->model('admin_loader');
        $page = 'register';
        $data = array(
            'error' => false
        );
        $this->admin_loader->generatePage($page, $data);
    }

    public function register_user(){
        $this->load->helper('url');
        $user = array(
            'username' => $_POST['username'],
            'firstName' => $_POST['fname'],
            'lastName' => $_POST['lname'],
            'password' => $_POST['password']
        );

        $this->load->model('authentication');
        if($this->authentication->register($user)){
            redirect(base_url());
        } else{
            $this->load->view('header');
            $this->load->view('navbar');
            $this->load->view('register', $data = array('error' => true));
            $this->load->view('footer');
        };
    }
}