
<?php
class Film
{
    function __construct($db)
    {
        $this->db = $db;
    }

    /*public function watch_movie($film_id,$user_id){
        $wathedMovie = $this->db->getWathedMovies($film_id,$user_id);
        if($wathedMovie){
            return array(
                'WatchedMovie' => $wathedMovie->film_id,
                'User have watched' => $wathedMovie->user_id
            );
        } //return $this->db->addWatchedMovie($film_id,$user_id);
    } */ 
}
