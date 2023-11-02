<?php
class image_model extends CI_Model
{

    public function insert_image($data)
    {
        $this->db->insert('booking', $data);
    }
}
