<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
        $this->load->model('loader');
        $page = 'index';
        $this->loader->generatePage($page, null);

	}
}
