<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_User extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function create_user($data) {
        $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        return $this->db->insert('users', $data);
    }

    public function get_all_users() {
        return $this->db->get('users')->result();
    }

    public function get_user($id) {
        return $this->db->get_where('users', ['id' => $id])->row();
    }

    public function update_user($id, $data) {
        if (isset($data['password'])) {
            $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        }
        return $this->db->update('users', $data, ['id' => $id]);
    }

    public function delete_user($id) {
        return $this->db->delete('users', ['id' => $id]);
    }
}