<?php

require('Db/db.php');
require('User/user.php');
require('Film/film.php');

class Application
{
    function __construct()
    {
        $config = json_decode(file_get_contents('./Config/config.json'), true);
        $db = new DB($config["DataBase"]);
        $this->user = new User($db);
        $this->film = new Film($db);
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
            if ($param == 'film_id' && (!is_int($value))) {
                return false;
            }
        }
        return true;
    }

    ////////////////////////////////////////
    //////////////forUser///////////////////
    ////////////////////////////////////////

    public function login($params)
    {
        if ($this->checkParams($params)) {
            if ($params['login'] && $params['password']) {
                return $this->user->login($params['login'], $params['password']);
            }
        }
    }

    public function registration($params)
    {
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

    public function logout($params)
    {
        if ($this->checkParams($params)) {
            $user = $this->user->getUser($params['token']);
            if ($user) {
                return $this->user->logout($user);
            }
        }
    }

    public function getUserOptions($params)
    {
        return $this->user->getUserOptions($params['id']);
    }

    public function addUserOptions($params)
    {
        [
            'user_id' => $user_id,
            'status' => $status,
            'personal_information' => $personal_information,
            'country' => $country,
            'avatar' => $avatar,
        ] = $params;
        return $this->user->addUserOptions($user_id, $status, $personal_information, $country, $avatar);
    }

    public function getUserOptions($params)
    {
        
        return $this->user->getUserOptions($params['user_id']);
    }

    ////////////////////////////////////////
    //////////////forFilm///////////////////
    ////////////////////////////////////////

    public function addWatchedMovie($params)
    {
        [
            'film_id' => $film_id,
            'user_id' => $user_id,
        ] = $params;
        
        return $this->film->addWatchedMovie($film_id, $user_id);
    }

    

    public function addToBookmarks($params)
    {
        [
            'film_id' => $film_id,
            'user_id' => $user_id,
        ] = $params;
        return $this->film->addToBookmarks($film_id, $user_id);
    }

    public function addReview($params)
    {
        [
            'film_id' => $film_id,
            'user_id' => $user_id,
            'review' => $review,
            'rating' => $rating,
        ] = $params;
        return $this->film->addReview($film_id, $user_id, $review, $rating);
    }

    public function getWatchedMovie($params)
    {
        return $this->film->getWatchedMovie($params['user_id']);
    }
}
