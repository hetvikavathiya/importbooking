<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Users extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        chech_login();
    }

    public function index($params = "", $params1 = "")
    {
        $id = $params1;
        if ($params == "") {
            $data['page_title'] = "Users | Admin";
            $data['page_name'] = "admin/users";
            $data['data'] = $this->db->get('users')->result_array();
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('username', 'username', 'required|is_unique[users.username]');
            $this->form_validation->set_rules('password', 'password', 'required');
            $this->form_validation->set_rules('mobile_no', 'mobile_no', 'required|min_length[10]|max_length[10]');

            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/users'));
            } else {

                $data = $this->input->post();
                $this->db->insert('users',  $data);
                $message = ['class' => 'success my-3', 'message' => 'User Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/users'));
            }
        }
        if ($params == "edit") {
            $query = $this->db->get_where('users', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $page_data['page_title'] = "Edit Users ";
                $page_data['page_name'] = "admin/users";
                $page_data['update_data'] = $this->db->get_where('users', ['id' => $id])->row_array();
                $page_data['data']  = $this->db->get('users')->result_array();

                $this->load->view('admin/common', $page_data);
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'User does not exist'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/users'));
            }
        }
        // if ($params == "delete") {

        //     $query = $this->db->get_where('users', ['id' => $id]);
        //     if ($query->num_rows() > 0) {
        //         $this->db->where('id', $id)->delete('users');
        //         $message = ['class' => 'success my-3', 'message' => 'User deleted successfully!'];
        //     } else {
        //         $message = ['class' => 'danger my-3', 'message' => 'User  not deleted!'];
        //     }
        //     $this->session->set_flashdata('flash', $message);
        //     redirect(base_url('admin/users'));
        // }
        if ($params == "update") {
            $this->form_validation->set_rules('username', 'username', 'required');
            $this->form_validation->set_rules('password', 'password', 'required');
            $this->form_validation->set_rules('mobile_no', 'mobile_no', 'required|min_length[10]|max_length[10]');

            if ($this->form_validation->run() == FALSE) {

                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/users'));
            }
            $id = $this->input->post('id');
            $data = $this->input->post();
            $query = $this->db->get_where('users', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $this->db->where('id', $id)->update('users', $data);
                $message = ['class' => 'success my-3', 'message' => 'users updated successfully!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/users/'));
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'users does not updated'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/users/'));
            }
        }
    }
}
