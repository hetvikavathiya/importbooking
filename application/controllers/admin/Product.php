<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Product extends CI_Controller
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
            $result = $this->db->select('p.*,C.name as category,SC.name as subcategory ,u.username as uname')
                ->join('category C', 'C.id = P.category_id', "left")
                ->join('sub_category SC', 'SC.id = P.sub_category_id', "left")
                ->join('users u', 'u.id=P.user_id', 'left')
                ->get('product P')->result_array();

            $data['page_title'] = "subcategory | Admin";
            $data['page_name'] = "admin/product";


            $data['data'] = $result;
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('category_id', 'category_id', 'required');
            $this->form_validation->set_rules('sub_category_id', 'sub_category_id', 'required');
            $this->form_validation->set_rules('name', 'name', 'required|is_unique[product.name]');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Product'));
            } else {
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['category_id'] = $post['category_id'];
                $data['sub_category_id'] = $post['sub_category_id'];
                $data['user_id'] = $this->session->userdata('id');

                $this->db->insert('product', $data);
                $message = ['class' => 'success my-3', 'message' => 'Product Added Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Product'));
            }
        }
        if ($params == "edit") {
            $result = $this->db->select('p.*,C.name as category,SC.name as subcategory,u.username as uname')
                ->join('category C', 'C.id = P.category_id', "left")
                ->join('sub_category SC', 'SC.id = P.sub_category_id', "left")
                ->join('users u', 'u.id=P.user_id', 'left')
                ->get('product P')->result_array();

            $query = $this->db->get_where('product', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $page_data['page_title'] = "Edit Product ";
                $page_data['page_name'] = "admin/Product";
                $page_data['update_data'] = $this->db->get_where('product', ['id' => $id])->row_array();
                $page_data['data']  = $result;

                $this->load->view('admin/common', $page_data);
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'Product does not exist'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Product'));
            }
        }
        if ($params == "delete") {

            $query = $this->db->get_where('product', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('product');
                $message = ['class' => 'danger my-3', 'message' => 'Product deleted successfully!'];
            } else {
                $message = ['class' => 'success my-3', 'message' => 'Product  not deleted!'];
            }
            $this->session->set_flashdata('flash', $message);
            redirect(base_url('admin/Product'));
        }
        if ($params == "update") {
            $this->form_validation->set_rules('category_id', 'category_id', 'required');
            $this->form_validation->set_rules('sub_category_id', 'sub_category_id', 'required');
            $this->form_validation->set_rules('name', 'name', 'required');
            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/Product/'));
            } else {
                $id = $this->input->post('id');
                $post = $this->input->post();
                $data = array();
                $data['name'] = $post['name'];
                $data['category_id'] = $post['category_id'];
                $data['sub_category_id'] = $post['sub_category_id'];
                $data['user_id'] = $this->session->userdata('id');
                $query = $this->db->get_where('Product', ['id' => $id]);
                if ($query->num_rows() == 1) {
                    $this->db->where('id', $id)->update('Product', $data);
                    $message = ['class' => 'success my-3', 'message' => 'Product updated successfully!'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/Product/'));
                } else {
                    $message = ['class' => 'danger my-3', 'message' => 'Product does not updated'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/Product/'));
                }
            }
        }
    }
    public function getsubcategory()
    {
        $post = $this->input->post();
        if (isset($post['id'])) {
            $id = $post['id'];
            $sub = $this->db->where('category_id', $id)->get('sub_category')->result_array();
            $html = "";
            foreach ($sub as $row) {
                $html .= "<option value='{$row['id']}'>{$row['name']}</option>";
            }
            echo json_encode(array("html" => $html, "status" => true));
        }
    }
}
