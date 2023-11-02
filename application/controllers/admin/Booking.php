<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Booking extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        chech_login();
        $this->load->model('image_model');
    }

    public function index($params = "", $params1 = "")
    {
        $id = $params1;
        if ($params == "") {
            $result = $this->db->select('b.*,c.name as category,pr.name as party,com.name as company,a.name as agent,u.username as uname')
                ->join('party pr', 'pr.id = b.party_id', "left")
                ->join('company com', 'com.id = b.company_id', "left")
                ->join('agent a', 'a.id = b.agent_id', "left")
                ->join('category c', 'c.id = b.category_id', "left")
                ->join('users u', 'u.id=b.user_id', 'left')
                ->get('booking b')->result_array();


            $data['page_title'] = "Booking | Admin";
            $data['page_name'] = "admin/booking";
            $data['data'] = $result;
            $this->load->view('admin/common', $data);
        }
        if ($params == "add") {
            $this->form_validation->set_rules('date', 'date', 'required');
            $this->form_validation->set_rules('party_id', 'party_id', 'required');
            $this->form_validation->set_rules('company_id', 'company_id', 'required');
            $this->form_validation->set_rules('agent_id', 'agent_id', 'required');
            $this->form_validation->set_rules('status', 'status', 'required');
            $this->form_validation->set_rules('category_id', 'category_id', 'required');
            $this->form_validation->set_rules('container', 'container', 'required');
            $this->form_validation->set_rules('net_wt', 'net_wt', 'required');
            $this->form_validation->set_rules('quantity', 'quantity', 'required');
            $this->form_validation->set_rules('gross_wt', 'gross_wt', 'required');
            $this->form_validation->set_rules('CHA', 'CHA', 'required');
            $this->form_validation->set_rules('ETA', 'ETA', 'required');
            $this->form_validation->set_rules('loading_port', 'loading_port', 'required');
            $this->form_validation->set_rules('discharge_port', 'discharge_port', 'required');
            $this->form_validation->set_rules('bill_no', 'bill_no', 'required');
            $this->form_validation->set_rules('insurance', 'insurance', 'required');
            $this->form_validation->set_rules('igm_files', 'igm_files', 'required');
            $this->form_validation->set_rules('custom_duty', 'custom_duty', 'required');
            $this->form_validation->set_rules('shipping_line', 'shipping_line', 'required');
            $this->form_validation->set_rules('custom_duty_status', 'custom_duty_status', 'required');
            $this->form_validation->set_rules('shipping_line_status', 'shipping_line_status', 'required');
            $this->form_validation->set_rules('delivery_date', 'delivery_date', 'required');
            $this->form_validation->set_rules('cha_bill', 'cha_bill', 'required');
            $this->form_validation->set_rules('cha_bill_status', 'cha_bill_status', 'required');
            $this->form_validation->set_rules('cha_misc_exp', 'cha_misc_exp', 'required');
            $this->form_validation->set_rules('cha_misc_exp_status', 'cha_misc_exp_status', 'required');
            $this->form_validation->set_rules('transport', 'transport', 'required');
            $this->form_validation->set_rules('transport_status', 'transport_status', 'required');


            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/booking'));
            } else {
                $post = $this->input->post();
                $data = array();
                $data['date'] = $post['date'];
                $data['party_id'] = $post['party_id'];
                $data['company_id'] = $post['company_id'];
                $data['status'] = $post['status'];
                $data['container'] = $post['container'];
                $data['category_id'] = $post['category_id'];
                $data['quantity'] = $post['quantity'];
                $data['net_wt'] = $post['net_wt'];
                $data['gross_wt'] = $post['gross_wt'];
                $data['agent_id'] = $post['agent_id'];
                $data['CHA'] = $post['CHA'];
                $data['loading_port'] = $post['loading_port'];
                $data['discharge_port'] = $post['discharge_port'];
                $data['bill_no'] = $post['bill_no'];
                $data['insurance'] = $post['insurance'];
                $data['igm_files'] = $post['igm_files'];
                $data['ETA'] = $post['ETA'];
                $data['custom_duty'] = $post['custom_duty'];
                $data['custom_duty_status'] = $post['custom_duty_status'];
                $data['shipping_line'] = $post['shipping_line'];
                $data['shipping_line_status'] = $post['shipping_line_status'];
                $data['delivery_date'] = $post['delivery_date'];
                $data['cha_bill'] = $post['cha_bill'];
                $data['cha_bill_status'] = $post['cha_bill_status'];
                $data['cha_misc_exp'] = $post['cha_misc_exp'];
                $data['cha_misc_exp_status'] = $post['cha_misc_exp_status'];
                $data['transport'] = $post['transport'];
                $data['transport_status'] = $post['transport_status'];
                $data['user_id'] = $this->session->userdata('id');

                $this->db->insert('booking', $data);
                $message = ['class' => 'success my-3', 'message' => 'Booking  Successfully !!'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/booking/report'));
            }
        }


        if ($params == "edit") {
            $result = $this->db->select('b.*,c.name as category,pr.name as party,com.name as company,p.name as product,a.name as agent,u.username as uname')
                ->join('party pr', 'pr.id = b.party_id', "left")
                ->join('company com', 'com.id = b.company_id', "left")
                ->join('product p', 'p.id = b.product_id', "left")
                ->join('agent a', 'a.id = b.agent_id', "left")
                ->join('category c', 'c.id = b.category_id', "left")
                ->join('users u', 'u.id = b.user_id', 'left')
                ->get('booking b')->result_array();

            $query = $this->db->get_where('booking', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $page_data['page_title'] = "Edit Booking ";
                $page_data['page_name'] = "admin/booking";
                $page_data['update_data'] = $this->db->get_where('booking', ['id' => $id])->row_array();
                $page_data['data']  = $result;

                $this->load->view('admin/common', $page_data);
            } else {
                $message = ['class' => 'danger my-3', 'message' => 'Product does not exist'];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/booking/report'));
            }
        }
        if ($params == "delete") {

            $query = $this->db->get_where('booking', ['id' => $id]);
            if ($query->num_rows() > 0) {
                $this->db->where('id', $id)->delete('booking');
                $message = ['class' => 'danger my-3', 'message' => 'Booking deleted successfully!'];
            } else {
                $message = ['class' => 'success my-3', 'message' => 'Booking  not deleted!'];
            }
            $this->session->set_flashdata('flash', $message);
            redirect(base_url('admin/booking/report'));
        }
        if ($params == "update") {
            $this->form_validation->set_rules('date', 'date', 'required');
            $this->form_validation->set_rules('party_id', 'party_id', 'required');
            $this->form_validation->set_rules('company_id', 'company_id', 'required');
            $this->form_validation->set_rules('agent_id', 'agent_id', 'required');
            $this->form_validation->set_rules('status', 'status', 'required');
            $this->form_validation->set_rules('category_id', 'category_id', 'required');
            $this->form_validation->set_rules('container', 'container', 'required');
            $this->form_validation->set_rules('net_wt', 'net_wt', 'required');
            $this->form_validation->set_rules('quantity', 'quantity', 'required');
            $this->form_validation->set_rules('gross_wt', 'gross_wt', 'required');
            $this->form_validation->set_rules('CHA', 'CHA', 'required');
            $this->form_validation->set_rules('ETA', 'ETA', 'required');
            $this->form_validation->set_rules('loading_port', 'loading_port', 'required');
            $this->form_validation->set_rules('discharge_port', 'discharge_port', 'required');
            $this->form_validation->set_rules('bill_no', 'bill_no', 'required');
            $this->form_validation->set_rules('insurance', 'insurance', 'required');
            $this->form_validation->set_rules('igm_files', 'igm_files', 'required');
            $this->form_validation->set_rules('custom_duty', 'custom_duty', 'required');
            $this->form_validation->set_rules('shipping_line', 'shipping_line', 'required');
            $this->form_validation->set_rules('custom_duty_status', 'custom_duty_status', 'required');
            $this->form_validation->set_rules('shipping_line_status', 'shipping_line_status', 'required');
            $this->form_validation->set_rules('delivery_date', 'delivery_date', 'required');
            $this->form_validation->set_rules('cha_bill', 'cha_bill', 'required');
            $this->form_validation->set_rules('cha_bill_status', 'cha_bill_status', 'required');
            $this->form_validation->set_rules('cha_misc_exp', 'cha_misc_exp', 'required');
            $this->form_validation->set_rules('cha_misc_exp_status', 'cha_misc_exp_status', 'required');
            $this->form_validation->set_rules('transport', 'transport', 'required');
            $this->form_validation->set_rules('transport_status', 'transport_status', 'required');

            if ($this->form_validation->run() == FALSE) {
                $message = ['class' => 'danger', 'message' => validation_errors()];
                $this->session->set_flashdata('flash', $message);
                redirect(base_url('admin/booking/'));
            } else {
                $id = $this->input->post('id');
                $post = $this->input->post();
                $data = array();
                $data['party_id'] = $post['party_id'];
                $data['company_id'] = $post['company_id'];
                $data['agent_id'] = $post['agent_id'];
                $data['category_id'] = $post['category_id'];
                $data['date'] = $post['date'];
                $data['status'] = $post['status'];
                $data['container'] = $post['container'];
                $data['quantity'] = $post['quantity'];
                $data['net_wt'] = $post['net_wt'];
                $data['gross_wt'] = $post['gross_wt'];
                $data['CHA'] = $post['CHA'];
                $data['ETA'] = $post['ETA'];
                $data['loading_port'] = $post['loading_port'];
                $data['discharge_port'] = $post['discharge_port'];
                $data['bill_no'] = $post['bill_no'];
                $data['insurance'] = $post['insurance'];
                $data['igm_files'] = $post['igm_files'];
                $data['custom_duty'] = $post['custom_duty'];
                $data['custom_duty_status'] = $post['custom_duty_status'];
                $data['shipping_line'] = $post['shipping_line'];
                $data['shipping_line_status'] = $post['shipping_line_status'];
                $data['delivery_date'] = $post['delivery_date'];
                $data['cha_bill'] = $post['cha_bill'];
                $data['cha_bill_status'] = $post['cha_bill_status'];
                $data['cha_misc_exp'] = $post['cha_misc_exp'];
                $data['cha_misc_exp_status'] = $post['cha_misc_exp_status'];
                $data['transport'] = $post['transport'];
                $data['transport_status'] = $post['transport_status'];
                $data['user_id'] = $this->session->userdata('id');

                $query = $this->db->get_where('booking', ['id' => $id]);
                if ($query->num_rows() == 1) {
                    $this->db->where('id', $id)->update('booking', $data);
                    $message = ['class' => 'success my-3', 'message' => 'Booking updated successfully!'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/booking/report'));
                } else {
                    $message = ['class' => 'danger my-3', 'message' => 'Booking does not updated'];
                    $this->session->set_flashdata('flash', $message);
                    redirect(base_url('admin/booking/report'));
                }
            }
        }
    }


    public function report()
    {
        $data['page_title'] = "Booking  Report | Admin";
        $data['page_name'] = "admin/booking_report";
        $this->load->view('admin/common', $data);
    }
    public function getlist()
    {
        $postData = $this->security->xss_clean($this->input->post());
        $draw = $postData['draw'];
        $start = $postData['start'];
        $rowperpage = $postData['length'];
        // serching coding
        $columnIndex = $postData['order'][0]['column']; // Column index
        $searchValue = $postData['search']['value']; // Search value
        $status_id = $postData['filterstatus'];
        $todate = $postData['todate'];
        $fromdate = $postData['fromdate'];

        # Search 
        $searchQuery = "";
        if ($searchValue != '') {
            $searchQuery = " (category.name like '%" . $searchValue . "%'  or party.name like '%" . $searchValue . "%'  or agent.name like '%" . $searchValue . "%' or company.name like'%" . $searchValue . "%' or container like'%" . $searchValue . "%' or bill_no like'%" . $searchValue . "%' or quantity like'%" . $searchValue . "%' or loading_port like'%" . $searchValue . "%' or discharge_port like'%" . $searchValue . "%' or insurance like'%" . $searchValue . "%' or net_wt like'%" . $searchValue . "%' or gross_wt like'%" . $searchValue . "%'  or delivery_date like'%" . $searchValue . "%' ) ";
        }
        ## Total number of records without filtering
        $this->db->select('count(*) as allcount');
        $records = $this->db->get('booking')->result();
        $totalRecords = $records[0]->allcount;


        ## Total number of record with filtering

        $this->db->select('booking.*, party.name as party,company.name as company,category.name as category,agent.name as agent,document.name as document_name');
        $this->db->from('booking');
        $this->db->join('party', 'party.id = booking.party_id', 'left');
        $this->db->join('company', 'company.id = booking.company_id', 'left');
        $this->db->join('category', 'category.id = booking.category_id', 'left');
        $this->db->join('agent', 'agent.id = booking.agent_id', 'left');
        $this->db->join('document', 'document.id = booking.document_id', 'left');



        if ($searchQuery != '')
            $this->db->where($searchQuery);
        if (!empty($status_id)) {
            $this->db->where('booking.status', $status_id);
        }
        if (!empty($fromdate)) {
            $this->db->where('DATE(booking.date) >=', $fromdate);
        }
        if (!empty($todate)) {
            $this->db->where('DATE(booking.date) <=', $todate);
        }
        $records = $this->db->get();
        $totalRecordwithFilter = $records->num_rows();


        ## Fetch records
        $this->db->select('booking.*, party.name as party,company.name as company,category.name as category,agent.name as agent,users.username as uname,document.name as document_name');
        $this->db->from('booking');
        $this->db->join('party', 'party.id = booking.party_id', 'left');
        $this->db->join('company', 'company.id = booking.company_id', 'left');
        $this->db->join('category', 'category.id = booking.category_id', 'left');
        $this->db->join('agent', 'agent.id = booking.agent_id', 'left');
        $this->db->join('users', 'users.id = booking.user_id', 'left');
        $this->db->join('document', 'document.id = booking.document_id', 'left');


        if ($searchQuery != '')
            $this->db->where($searchQuery);
        if (!empty($status_id)) {
            $this->db->where('booking.status', $status_id);
        }
        if (!empty($fromdate)) {
            $this->db->where('DATE(booking.date) >=', $fromdate);
        }
        if (!empty($todate)) {
            $this->db->where('DATE(booking.date) <=', $todate);
        }
        $this->db->limit($rowperpage, $start);
        $this->db->order_by('id', "desc");
        $records = $this->db->get()->result();


        $data = array();
        $i = $start + 1;
        foreach ($records as $record) {
            $action = '
            <a href="index/edit/' . $record->id . '" class="btn btn-primary">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-edit " width="50" height="50" viewBox="0 0 25 25" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
            <path d="M7 7h-1a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-1"></path>
            <path d="M20.385 6.585a2.1 2.1 0 0 0 -2.97 -2.97l-8.415 8.385v3h3l8.385 -8.415z"></path>
            <path d="M16 5l3 3">
            </path>
            </svg>
            </a>
            <a href="index/delete/' . $record->id . '" class="btn btn-danger" id=""delete>
            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-trash-off" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
            <path d="M3 3l18 18"></path>
            <path d="M4 7h3m4 0h9"></path>
            <path d="M10 11l0 6"></path>
            <path d="M14 14l0 3"></path>
            <path d="M5 7l1 12a2 2 0 0 0 2 2h8a2 2 0 0 0 2 -2l.077 -.923"></path>
            <path d="M18.384 14.373l.616 -7.373"></path>
            <path d="M9 5v-1a1 1 0 0 1 1 -1h4a1 1 0 0 1 1 1v3"></path>
        </svg>
        </a>
            ';

            $upload_documents = '<buttton data-uploadid="' . $record->id . '" class="btn btn-success upload_document">
            Uploade Documents
      </button>
          ';


            $booking_payment = '<buttton data-paymentid="' . $record->id . '" class="btn btn-success booking_payment" >
       payment
    </button>
        ';

            $status = '<select data-bookingid="' . $record->id . '" class="form-select select2 reportstatuschange" style="width:125px;">
        <option>Select Status</option>';
            $selected = "";
            if ($record->status == "Booking") {
                $selected = "selected";
            }
            $status .= '<option value="Booking" ' . $selected . '>Booking</option>';
            $selected = "";
            if ($record->status == "In-transit") {
                $selected = "selected";
            }
            $status .= '<option value="In-transit" ' . $selected . '>In-transit</option>';
            $selected = "";
            if ($record->status == "Arrived") {
                $selected = "selected";
            }
            $status .= '<option value="Arrived" ' . $selected . '>Arrived</option>
            </select>';


            $data[] = array(
                'id' => $i,
                'action' => $action,
                'uploade_documents' => $upload_documents,
                'booking_payment' => $booking_payment,
                'date' => $record->date,
                'party' => $record->party,
                'company' => $record->company,
                'status' =>  $status,
                'container' => $record->container,
                'category' => $record->category,
                'quantity' => $record->quantity,
                'net_wt' => $record->net_wt,
                'gross_wt' => $record->gross_wt,
                'agent' => $record->agent,
                'CHA' => $record->CHA,
                'loading_port' => $record->loading_port,
                'discharge_port' =>  $record->discharge_port,
                'bill_no' => $record->bill_no,
                'insurance' => $record->insurance,
                'igm_files' => $record->igm_files,
                'ETA' => $record->ETA,
                'custom_duty' => $record->custom_duty,
                'custom_duty_status' => $record->custom_duty_status,
                'shipping_line' => $record->shipping_line,
                'shipping_line_status' =>  $record->shipping_line_status,
                'delivery_date' => $record->delivery_date,
                'cha_bill' => $record->cha_bill,
                'cha_bill_status' => $record->cha_bill_status,
                'cha_misc_exp' => $record->cha_misc_exp,
                'cha_misc_exp_status' => $record->cha_misc_exp_status,
                'transport' => $record->transport,
                'transport_status' => $record->transport_status,
                'uname' => $record->uname,
                'created_at' => $record->created_at,
                'updated_at' => $record->updated_at,
            );
            $i = $i + 1;
        }

        $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $totalRecords,
            "iTotalDisplayRecords" => $totalRecordwithFilter,
            "aaData" => $data,
        );
        echo json_encode($response);
        exit();
    }

    public function update_booking_status()
    {
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('booking_id');
            $selectedOption = $this->input->post('selected_option');
            $data = array(
                'status' => $selectedOption,
                'user_id' => $this->session->userdata('id'),
            );
            $query = $this->db->get_where('booking', ['id' => $id]);
            if ($query->num_rows() == 1) {
                $this->db->where('id', $id)->update('booking', $data);
            }
        }
    }
    public function image()
    {
        $page_data['id'] = $this->input->post('id');
        $page_data['data'] = $this->db->get_where('uploaded', array('booking_id' => $page_data['id']))->result();
        $res = $this->load->view('admin/multipleImage', $page_data);
        echo json_encode($res);
    }

    public function uploaddocument()
    {
        $post = $this->input->post();

        $booking_id = $post['booking_id'];

        $document_id = $post['document_id'];

        $deleteQ = $this->db->get_where('uploaded', array('booking_id' => $booking_id))->result_array();
        foreach ($deleteQ as $delR) {
            if (!in_array($delR['id'], $post['uploaded_id'])) {
                $this->db->where('id', $delR['id']);
                $this->db->delete('uploaded');
            }
        }

        $this->load->library('upload');
        $dataInfo = array();
        $files = $_FILES;

        $cpt = count($_FILES['uploade_documents']['name']);

        $config = array();
        $config['upload_path'] = 'upload/documents/';
        $config['allowed_types'] = 'gif|jpg|png|pdf|jpeg';
        $config['max_size']      = '10000';
        $config['overwrite']     = FALSE;

        $this->upload->initialize($config);

        for ($i = 0; $i < $cpt; $i++) {
            if (!empty($files['uploade_documents']['name'][$i])) {
                $_FILES['uploade_documents']['name'] = $files['uploade_documents']['name'][$i];
                $_FILES['uploade_documents']['type'] = $files['uploade_documents']['type'][$i];
                $_FILES['uploade_documents']['tmp_name'] = $files['uploade_documents']['tmp_name'][$i];
                $_FILES['uploade_documents']['error'] = $files['uploade_documents']['error'][$i];
                $_FILES['uploade_documents']['size'] = $files['uploade_documents']['size'][$i];

                $this->upload->do_upload('uploade_documents');
                $dataInfo[$i] = $_FILES['uploade_documents']['name'];
            } else {
                $dataInfo[$i] = "";
            }
        }

        for ($i = 0; $i < count($document_id); $i++) {

            if ($post['uploaded_id'][$i] > 0) {
                $updatearray = array('document_id' => $document_id[$i]);

                if (!empty($dataInfo[$i])) {
                    $updatearray['name'] = $dataInfo[$i];
                }
                $this->db->where('id', $post['uploaded_id'][$i]);
                $this->db->where('booking_id', $booking_id);
                $this->db->update('uploaded', $updatearray);
                $message = ['class' => 'success my-3', 'message' => ' uploaded document updated  successfully!!'];
                $this->session->set_flashdata('flash', $message);
            } else {
                $this->db->insert(
                    'uploaded',
                    array('booking_id' => $booking_id, 'name' => $dataInfo[$i], 'document_id' => $document_id[$i])
                );
                $message = ['class' => 'success my-3', 'message' => 'document updated  Successfully !!'];
                $this->session->set_flashdata('flash', $message);
            }
        }

        redirect(base_url('admin/booking/report'));
    }

    public function payment()
    {
        $page_data['id'] = $this->input->post('id');
        $page_data['data'] = $this->db->get_where('booking_payment', array('booking_id' => $page_data['id']))->result();
        $page_data['booking_data'] = $this->db->get_where('Booking', array('id' => $page_data['id']))->row_array();
        $res = $this->load->view('admin/payment', $page_data);
        echo json_encode($res);
    }

    public function givepayment()
    {
        $post = $this->input->post();
        $booking_id = $post['booking_id'];
        $amount = $post['amount'];

        $deleteQ = $this->db->get_where('booking_payment', array('booking_id' => $booking_id))->result_array();
        foreach ($deleteQ as $delR) {
            if (!in_array($delR['id'], $post['payment_id'])) {
                $this->db->where('id', $delR['id']);
                $this->db->delete('booking_payment');
            }
        }

        for ($i = 0; $i < count($amount); $i++) {

            if ($post['payment_id'][$i] > 0) {
                $payment_details = array();
                $payment_details['amount'] = $post['amount'][$i];
                $payment_details['date'] = $post['date'][$i];
                $payment_details['remark'] = $post['remark'][$i];
                $payment_details['booking_id'] = $booking_id;

                $this->db->where('id', $post['payment_id'][$i]);
                $this->db->update('booking_payment', $payment_details);
                $message = ['class' => 'success my-3', 'message' => ' payment updated  successfully!!'];
                $this->session->set_flashdata('flash', $message);
            } else {

                $payment_details = array();
                $payment_details['amount'] = $post['amount'][$i];
                $payment_details['date'] = $post['date'][$i];
                $payment_details['remark'] = $post['remark'][$i];
                $payment_details['booking_id'] = $booking_id;

                $this->db->insert('booking_payment', $payment_details);
                $message = ['class' => 'success my-3', 'message' => 'Payment successfully!!'];
                $this->session->set_flashdata('flash', $message);
            }
        }

        redirect(base_url('admin/booking/report'));
    }
}
