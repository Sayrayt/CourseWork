<?php

require('Db/db.php');
require('User/user.php');

class Application
{
    function __construct()
    {
        $config = json_decode(file_get_contents('./Config/config.json'), true);
        $db = new DB($config["DataBase"]);
        $this->user = new User($db);
    }


    //функция проверки полученных значений в запросе
    private function checkParams($params)
    {
        foreach ($params as $param => $value) {
            if ($param == 'token' && (!is_string($value) || strlen($value) != 32)) {
                return false;
            }
            if ($param == 'login' && (!is_string($value) || strlen($value) > 16)) {
                return false;
            }
            if ($param == 'password' && (!is_string($value) && strlen($value) > 16)) {
                return false;
            }
            if ($param == 'name' && (!is_string($value) || strlen($value) > 16)) {
                return false;
            }
        }
        return true;
    }

    ////////////////////////////////////////
    //////////////forUser///////////////////
    ////////////////////////////////////////

    public function login($params) {
        if ($this->checkParams($params)) {
            if ($params['login'] && $params['password']) {
                return $this->user->login($params['login'], $params['password']);
            }
        }
    }

    public function registration($params) {
        if ($this->checkParams($params)) {
            [
                'login' => $login,
                'password' => $password,
                'name' => $name
            ] = $params;
            if ($login && $password && $name) {
                return $this->user->registration($login, $password, $name);
            }
        }
    }

    public function logout($params) {
        if ($this->checkParams($params)) {
            $user = $this->user->getUser($params['token']);
            if ($user) {
                return $this->user->logout($user);
            }
        }
    }
    
    
}
