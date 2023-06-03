<?php
class DB {
    function __construct($config) {
        $host = $config["host"];
        $port = $config["port"];
        $name = $config["name"];
        $user = $config["user"];
        $password = $config["password"];
    

        try {
            $this->db = new PDO(
                'mysql:host=' . $host . ';port=' . $port . ';dbname=' . $name,
                $user,
                $password
            );
        } catch (Exception $e) {
            print_r($e->getMessage());
            die;
        }
    }

    function __destruct() {
        $this->db = null;
    }

    private function getArray($query) {
        $stmt = $this->db->query($query);
        if ($stmt) {
            $result = array();
            while ($row = $stmt->fetch(PDO::FETCH_OBJ)) {
                $result[] = $row;
            }
            return $result;
        }
    }

////////////////////////////////////////
//////////////private///////////////////
////////////////////////////////////////

    // only for string
    private function simpleUpdate($table, $field, $value) {
        $query = 'UPDATE '.$table.' SET '.$field.'=?';
        $sth = $this->db->prepare($query);
        $sth->execute([$value]);
        return true;
    }

    private function simpleUpdateById($table,$field,$value,$id) {
        $query = 'UPDATE '.$table.' SET '.$field.'=? WHERE id=?';
        $sth = $this->db->prepare($query);
        $sth->execute([$value, $id]);
        return true;
    }

    private function delete($table, $condition, $value){
        $query = 'DELETE FROM '.$table.' WHERE '.$condition.'=?';
        $sth = $this->db->prepare($query);
        $sth->execute([$value]);
        return true;
    }

    private function protectQuery($query, $arr){
        $sth = $this->db->prepare($query);
        $sth->execute($arr);
        return $sth;
    }

    private function selectWithCondition($table, $fields, $condition ,$value) {
        $query = 'SELECT ' . $fields .' FROM ' . $table . ' WHERE ' . $condition . '=?';
        $sth = $this->db->prepare($query);
        $this->db->quote($value);
        $sth->execute([$value]);
        return $sth;
    }

    ////////////////////////////////////////
//////////////forUser///////////////////
////////////////////////////////////////

public function getUser($login) {
    $query = 'SELECT * FROM users WHERE login=?';
    return $this->protectQuery($query,[$login])->fetchObject();
}

public function getUserByToken($token) {
    $query = 'SELECT id FROM users WHERE token=?';
    return $this->protectQuery($query,[$token])->fetchObject();
}

public function getLoggedUsers() {
    $query = '
        SELECT id,name 
        FROM users 
        WHERE token IS NOT NULL  AND token<>""';
    return $this->getArray($query);
}

public function addUser($login, $password, $name) {
    $query = 'INSERT INTO users (login, password, name) VALUES (?,?,?)';
    return $this->protectQuery($query,[$login, $password, $name])->fetchObject();
}

public function updateToken($id, $token) {
    return $this->simpleUpdateById('users', 'token', $token, $id);
}

}