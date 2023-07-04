
<?php
class Film
{
    function __construct($db)
    {
        $this->db = $db;
    }

    public function addWatchedMovie($film_id, $user_id)
    {
        return $this->db->addWatchedMovie($film_id, $user_id);
    }

    public function getWatchedMovie($user_id)
    {
        return $this->db->getWatchedMovieByUserId($user_id);
    }

    public function addToBookmarks($film_id, $user_id)
    {
        return $this->db->addToBookmarks($film_id, $user_id);
    }

    public function addReview($film_id, $user_id, $review, $rating)
    {
        return $this->db->addReview($film_id, $user_id, $review, $rating);
    }
}
