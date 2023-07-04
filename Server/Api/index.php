<?php
require("Application/application.php");

function router($params) {
    $method = $params['method'];
    if ($method) {
        $app = new Application();
        switch ($method) {
            case 'check' : return true;
            //////////
            // USER //
            //////////
            case 'login': return $app->login($params);
            case 'logout': return $app->logout($params);
            case 'registration': return $app->registration($params);
            case 'addUserOptions': return $app->addUserOptions($params);
            case 'getUserOptions': return $app->getUserOptions($params);
            //////////
            // FILM //
            //////////
            case 'addWatchedMovie': return $app->addWatchedMovie($params);
            case 'getWatchedMovie': return $app->getWatchedMovie($params);
            case 'addToBookmarks': return $app->addToBookmarks($params);
            case 'addReview': return $app->addReview($params);
        }
    }
    return false;
}

function answer($data) {
    if ($data) {
        return array( 
            'result' => 'ok',
            'data' => $data
        );
    }
    return array(
        'result' => 'error'
    );
}

echo(json_encode(answer(router($_GET))));