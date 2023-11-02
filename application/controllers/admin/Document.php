<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Document extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        chech_login();
    }
    public function index($params = "", $params1 = "")
    {

        if ($params == "") {
            $data['page_title'] = "Document | Admin";
            $data['page_name'] = "admin/document";

            $this->db->select('document.*,users.username as uname');
            $this->db->from('document');
            $this->db->join('users', 'users.id=document.user_id', 'left');
            $data['data'] = $this->db->get()->result_array();
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('name', 'name', 'required|is_unique[document.name]');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
            } else {
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['user_id'] = $this->session->userdata('id');
                $this->db->insert('document', $data);

                $message = ['class' => 'success my-3', 'message' => 'document Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/document'));
            }
        }
        if ($params == "edit") {
            $id = $params1;
            $page_data['page_title'] = "Edit Document ";
            $page_data['page_name'] = "admin/document";
            $page_data['update_data'] = $this->db->get_where('document', ['id' => $id])->row_array();

            $this->db->select('document.*,users.username as uname');
            $this->db->from('document');
            $this->db->join('users', 'users.id=document.user_id', 'left');
            $page_data['data'] = $this->db->get()->result_array();
            $this->load->view('admin/common', $page_data);
        }
        if ($params == "delete") {
            $id = $params1;
            $query = $this->db->get_where('document', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('document');
                $message = ['class' => 'success my-3', 'message' => 'document deleted successfully!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/document'));
            } else {
                $message = ['class' => 'success my-3', 'message' => 'document  not deleted!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/document'));
            }
        }
        if ($params == "update") {
            $this->form_validation->set_rules('name', 'name', 'required');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/document'));
            } else {
                $id = $this->input->post('id');
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['user_id'] = $this->session->userdata('id');
                $query = $this->db->get_where('document', ['id' => $id]);
                if ($query->num_rows() == 1) {
                    if ($data == $query->row()->name) {
                        $message = ['class' => 'danger my-3', 'message' => 'document does not updated'];
                        $this->session->set_flashdata('flash', $message);
                        redirect(base_url('admin/document') . $id);
                    } else {
                        $this->db->where('id', $id)->update('document', $data);
                        $message = ['class' => 'success my-3', 'message' => 'document updated successfully!'];
                        $this->session->set_flashdata('flash', $message);
                        redirect(base_url('admin/document'));
                    }
                }
            }
        }
    }
}
