<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Company extends CI_Controller
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
            $data['page_title'] = "Company | Admin";
            $data['page_name'] = "admin/company";
            $this->db->select('company.*,users.username as uname');
            $this->db->from('company');
            $this->db->join('users', 'users.id=company.user_id', 'left');

            $data['data'] = $this->db->get()->result_array();
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('name', 'name', 'required|is_unique[company.name]');
            $this->form_validation->set_rules('mobile_no', 'mobile_no', 'required|min_length[10]|max_length[10]');
            $this->form_validation->set_rules('city', 'city', 'required');

            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/company'));
            } else {

                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['mobile_no'] = $post['mobile_no'];
                $data['city'] = $post['city'];
                $data['user_id'] = $this->session->userdata('id');
                $this->db->insert('company',  $data);
                $message = ['class' => 'success my-3', 'message' => 'Company Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/company'));
            }
        }
        if ($params == "edit") {
            $query = $this->db->get_where('company', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $page_data['page_title'] = "Edit company ";
                $page_data['page_name'] = "admin/company";
                $page_data['update_data'] = $this->db->get_where('company', ['id' => $id])->row_array();
                $this->db->select('company.*,users.username as uname');
                $this->db->from('company');
                $this->db->join('users', 'users.id=company.user_id', 'left');
                $page_data['data']  = $this->db->get()->result_array();

                $this->load->view('admin/common', $page_data);
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'Company does not exist'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/company'));
            }
        }
        if ($params == "delete") {

            $query = $this->db->get_where('company', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('company');
                $message = ['class' => 'success my-3', 'message' => 'Company deleted successfully!'];
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'Company  not deleted!'];
            }
            $this->session->set_flashdata('flash', $message);
            redirect(base_url('admin/company'));
        }
        if ($params == "update") {
            $this->form_validation->set_rules('name', 'name', 'required');
            $this->form_validation->set_rules('mobile_no', 'mobile_no', 'required|min_length[10]|max_length[10]');
            $this->form_validation->set_rules('city', 'city', 'required');
            if ($this->form_validation->run() == FALSE) {

                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/company'));
            }
            $id = $this->input->post('id');
            $post = $this->input->post();
            $data = array();
            $data['name'] = $post['name'];
            $data['mobile_no'] = $post['mobile_no'];
            $data['city'] = $post['city'];
            $data['user_id'] = $this->session->userdata('id');
            $query = $this->db->get_where('company', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $this->db->where('id', $id)->update('company', $data);
                $message = ['class' => 'success my-3', 'message' => 'Company updated successfully!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/company/'));
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'Company does not updated'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/company/'));
            }
        }
    }
}
