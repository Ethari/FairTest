<?php
class Login extends CI_Controller
{
    public function __construct(){
        parent::__construct();
        $this->load->model('Account_Model');
    }

    public function index()
    {
        $user = $_POST;
        if($this->Account_Model->login($user)){
            ChromePhp::log("?????");
            echo "true";
        } else{
            echo "false";
        }
    }
    public function logout(){
        $this->Account_Model->logout();
    }

    public function register(){
        $new_user = $_POST;

        if($this->Account_Model->register($new_user)){
            echo "true";
        } else{
            echo "false";
        }
    }
}