<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Category extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        chech_login();
    }
    public function index($params = "", $params1 = "")
    {

        if ($params == "") {
            $data['page_title'] = "Category | Admin";
            $data['page_name'] = "admin/category";

            $this->db->select('category.*,users.username as uname');
            $this->db->from('category');
            $this->db->join('users', 'users.id=category.user_id', 'left');
            $data['data'] = $this->db->get()->result_array();
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('name', 'name', 'required|is_unique[category.name]');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
            } else {
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['user_id'] = $this->session->userdata('id');
                $this->db->insert('category', $data);

                $message = ['class' => 'success my-3', 'message' => 'Category Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/category'));
            }
        }
        if ($params == "edit") {
            $id = $params1;
            $page_data['page_title'] = "Edit Category ";
            $page_data['page_name'] = "admin/Category";
            $page_data['update_data'] = $this->db->get_where('category', ['id' => $id])->row_array();

            $this->db->select('category.*,users.username as uname');
            $this->db->from('category');
            $this->db->join('users', 'users.id=category.user_id', 'left');
            $page_data['data'] = $this->db->get()->result_array();
            $this->load->view('admin/common', $page_data);
        }
        if ($params == "delete") {
            $id = $params1;
            $query = $this->db->get_where('category', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('category');
                $message = ['class' => 'success my-3', 'message' => 'Category deleted successfully!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/category'));
            } else {
                $message = ['class' => 'success my-3', 'message' => 'category  not deleted!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/category'));
            }
        }
        if ($params == "update") {
            $this->form_validation->set_rules('name', 'name', 'required');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Category'));
            } else {
                $id = $this->input->post('id');
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['user_id'] = $this->session->userdata('id');
                $query = $this->db->get_where('category', ['id' => $id]);
                if ($query->num_rows() == 1) {
                    if ($data == $query->row()->name) {
                        $message = ['class' => 'danger my-3', 'message' => 'category does not updated'];
                        $this->session->set_flashdata('flash', $message);
                        redirect(base_url('admin/Category') . $id);
                    } else {
                        $this->db->where('id', $id)->update('category', $data);
                        $message = ['class' => 'success my-3', 'message' => 'category updated successfully!'];
                        $this->session->set_flashdata('flash', $message);
                        redirect(base_url('admin/Category'));
                    }
                }
            }
        }
    }
}
