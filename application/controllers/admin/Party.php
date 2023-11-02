<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Party extends CI_Controller
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
            $data['page_title'] = "Party | Admin";
            $data['page_name'] = "admin/party";

            $this->db->select('party.*,users.username as uname');
            $this->db->from('party');
            $this->db->join('users', 'users.id=party.user_id', 'left');
            $data['data'] = $this->db->get()->result_array();
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('name', 'name', 'required|is_unique[party.name]');
            $this->form_validation->set_rules('mobile_no', 'mobile_no', 'required|min_length[10]|max_length[10]');
            $this->form_validation->set_rules('city', 'city', 'required');

            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/party'));
            } else {

                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['mobile_no'] = $post['mobile_no'];
                $data['city'] = $post['city'];
                $data['user_id'] = $this->session->userdata('id');
                $this->db->insert('party',  $data);
                $message = ['class' => 'success my-3', 'message' => 'Party Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/party'));
            }
        }
        if ($params == "edit") {
            $query = $this->db->get_where('party', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $page_data['page_title'] = "Edit Party ";
                $page_data['page_name'] = "admin/Party";
                $page_data['update_data'] = $this->db->get_where('party', ['id' => $id])->row_array();
                $this->db->select('party.*,users.username as uname');
                $this->db->from('party');
                $this->db->join('users', 'users.id=party.user_id', 'left');
                $page_data['data']  = $this->db->get()->result_array();

                $this->load->view('admin/common', $page_data);
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'party does not exist'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/party'));
            }
        }
        if ($params == "delete") {

            $query = $this->db->get_where('party', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('party');
                $message = ['class' => 'success my-3', 'message' => 'party deleted successfully!'];
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'party  not deleted!'];
            }
            $this->session->set_flashdata('flash', $message);
            redirect(base_url('admin/party'));
        }
        if ($params == "update") {
            $this->form_validation->set_rules('name', 'name', 'required');
            $this->form_validation->set_rules('mobile_no', 'mobile_no', 'required|min_length[10]|max_length[10]');
            $this->form_validation->set_rules('city', 'city', 'required');
            if ($this->form_validation->run() == FALSE) {

                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/party'));
            }
            $id = $this->input->post('id');
            $post = $this->input->post();
            $data = array();
            $data['name'] = $post['name'];
            $data['mobile_no'] = $post['mobile_no'];
            $data['city'] = $post['city'];
            $data['user_id'] = $this->session->userdata('id');
            $query = $this->db->get_where('party', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $this->db->where('id', $id)->update('party', $data);
                $message = ['class' => 'success my-3', 'message' => 'party updated successfully!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/party/'));
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'party does not updated'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/party/'));
            }
        }
    }
}
