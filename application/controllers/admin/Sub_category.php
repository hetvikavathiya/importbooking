<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Sub_category extends CI_Controller
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
            $result = $this->db->select('SC.*,C.name as category')
                ->join('category C', 'C.id = SC.category_id', "left")
                ->get('sub_category SC')->result_array();

            $data['page_title'] = "subcategory | Admin";
            $data['page_name'] = "admin/sub_category";
            $data['data'] = $result;
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('category_id', 'category_id', 'required');
            $this->form_validation->set_rules('name', 'name', 'required|is_unique[sub_category.name]');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Sub_category'));
            } else {
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['category_id'] = $post['category_id'];
                $data['user_id'] = $this->session->userdata('id');
                $this->db->insert('sub_category', $data);
                $message = ['class' => 'success my-3', 'message' => 'subcategory Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Sub_category'));
            }
        }
        if ($params == "edit") {
            $query = $this->db->get_where('sub_category', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $page_data['page_title'] = "Edit subcategory ";
                $page_data['page_name'] = "admin/sub_category";
                $page_data['update_data'] = $this->db->get_where('sub_category', ['id' => $id])->row_array();
                $page_data['data']  = $this->db->select('SC.*,C.name as category')
                    ->join('category C', 'C.id = SC.category_id', "left")
                    ->get('sub_category SC')->result_array();

                $this->load->view('admin/common', $page_data);
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'subcategory does not exist'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/sub_category'));
            }
        }
        if ($params == "delete") {

            $query = $this->db->get_where('sub_category', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('sub_category');
                $message = ['class' => 'success my-3', 'message' => 'subcategory deleted successfully!'];
            } else {
                $message = ['class' => 'success my-3', 'message' => 'subcategory  not deleted!'];
            }
            $this->session->set_flashdata('flash', $message);
            redirect(base_url('admin/sub_category'));
        }
        if ($params == "update") {
            $this->form_validation->set_rules('category_id', 'category_id', 'required');
            $this->form_validation->set_rules('name', 'name', 'required');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
            } else {
                $id = $this->input->post('id');
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['category_id'] = $post['category_id'];
                $data['user_id'] = $this->session->userdata('id');
                $query = $this->db->get_where('sub_category', ['id' => $id]);
                if ($query->num_rows() == 1) {
                    $this->db->where('id', $id)->update('sub_category', $data);
                    $message = ['class' => 'success my-3', 'message' => 'subcategory updated successfully!'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/sub_category/'));
                } else {
                    $message = ['class' => 'danger my-3', 'message' => 'subcategory not updated'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/sub_category/'));
                }
            }
        }
    }
}
