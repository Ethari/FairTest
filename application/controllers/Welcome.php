<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
        $this->load->model('loader');
        $session = $this->session->userdata();
        ChromePhp::log($session);
        if(isset($session['change_password'])){
            ChromePhp::log("SET");
           $this->changePassword();
        } else{
            $page = 'index';
            $this->loader->generatePage($page, null);
        }

	}

    public function changePassword(){
        $page = 'change_password';
        $this->loader->generatePage($page);
    }
}
