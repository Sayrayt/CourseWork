<?php
class User
{
    function __construct($db)
    {
        $this->db = $db;
    }

    public function login($login, $password)
    {
        $user = $this->db->getUser($login);
        if ($user && $password === $user->password && $user->is_admin === '0') {
            $token = md5(rand());
            $this->db->updateToken($user->id, $token);
            return array(
                'name' => $user->name,
                'token' => $token,
                'is_Admin' => false
            );
        } elseif ($user && $password === $user->password && $user->is_admin === '1') {
            $token = md5(rand());
            $this->db->updateToken($user->id, $token);
            return array(
                'name' => $user->name,
                'token' => $token,
                'is_Admin' => true
            );
        }
    }

    public function registration($login, $password, $name)
    {
        $user = $this->db->getUser($login);
        if (!$user) {
            $this->db->addUser($login, $password, $name);
            return true;
        }
    }

    public function logout($user)
    {
        $this->db->updateToken($user, 'NULL');
        return true;
    }

    function getUser($token)
    {
        if ($token) {
            return $this->db->getUserByToken($token);
        }
    }

    function getUserOptions($user_id){
        if ($user_id) {
            return $this->db->getUserOptionsById($user_id);
        }
    }

    function addUserOptions($user_id, $status, $personal_information, $country, $avatar){
        return $this->db->addUserOptions($user_id, $status, $personal_information, $country, $avatar);
    }
}
