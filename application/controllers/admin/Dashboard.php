<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        chech_login();
    }
    public function index()
    {

        $data['page_title'] = "Dashboard | Admin";
        $data['page_name'] = "admin/dashboard";
        $this->load->view('admin/common', $data);
    }
    public function logout()
    {
        $this->session->unset_userdata('admin_login');
        $message = ['class' => 'danger', 'message' => 'logout Successfully !'];
        $this->session->set_flashdata('flash', $message);
        redirect(base_url('login'));
    }
}
