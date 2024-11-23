<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('User_model');
    }

    public function index() {
        $data['users'] = $this->User_model->get_all_users();
        $this->load->view('user/index', $data);
    }

    public function create() {
        if ($this->input->post()) {
            $data = [
                'name' => $this->input->post('name'),
                'address' => $this->input->post('address'),
                'phone' => $this->input->post('phone'),
                'email' => $this->input->post('email'),
                'username' => $this->input->post('username'),
                'password' => $this->input->post('password'),
                'role' => $this->input->post('role'),
                'preferences' => $this->input->post('preferences'),
                'notes' => $this->input->post('notes')
            ];
            $this->User_model->create_user($data);
            redirect('user');
        }
        $this->load->view('user/create');
    }

    public function edit($id) {
        $data['user'] = $this->User_model->get_user($id);
        if ($this->input->post()) {
            $update_data = [
                'name' => $this->input->post('name'),
                'address' => $this->input->post('address'),
                'phone' => $this->input->post('phone'),
                'email' => $this->input->post('email'),
                'username' => $this->input->post('username'),
                'role' => $this->input->post('role'),
                'preferences' => $this->input->post('preferences'),
                'notes' => $this->input->post('notes')
            ];
            if ($this->input->post('password')) {
                $update_data['password'] = $this->input->post('password');
            }
            $this->User_model->update_user($id, $update_data);
            redirect('user');
        }
        $this->load->view('user/edit', $data);
    }

    public function delete($id) {
        $this->User_model->delete_user($id);
        redirect('user');
    }
}