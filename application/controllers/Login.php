<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('admin_login'))
            return redirect('admin/Dashboard');
    }

    public function index()
    {

        $this->form_validation->set_rules('mobile_no', 'mobile_no', 'trim|required');
        $this->form_validation->set_rules('password', 'Password ', 'trim|required');
        $login_user = [
            'mobile_no' => $this->input->post("mobile_no"),
            'password' => $this->input->post("password")
        ];
        if ($this->form_validation->run() == true) {

            if ($this->db->get_where('users', ['mobile_no' => $login_user['mobile_no']])->num_rows() == 1) {

                if ($this->db->get_where('users', $login_user)->num_rows() == 1) {

                    $user = $this->db->get_where('users', $login_user)->row_array();
                    $loged_user = array(
                        'id' => $user['id'],
                        'mobile_no' => $user['mobile_no'],
                        'username' => $user['username'],
                        'login' => true
                    );
                    $this->session->set_userdata('admin_login', $loged_user);
                    $this->session->set_userdata('id', $loged_user['id']);
                    $message = ['class' => 'success my-2', 'message' => 'login in successfully'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/Dashboard'));
                } else {
                    $message = ['class' => 'danger', 'message' => 'Enter valid Password'];
                    $this->session->set_flashdata('flash', $message);
                    redirect('login');
                }
            } else {
                $message = ['class' => 'danger', 'message' => 'Invalid Mobile Number'];
                $this->session->set_flashdata('flash', $message);
                redirect('login');
            }
        } else {
            $this->load->view('login');
        }
    }
}
