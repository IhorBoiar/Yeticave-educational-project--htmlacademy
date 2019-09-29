<?php
require_once("helpers.php");
require_once("functions.php");

$con = mysqli_connect("localhost", "root", "", "yeticave5");
mysqli_set_charset($con, "utf8");

if(!$con) {
    echo "ERROR";
}

$sql_cat = "SELECT * FROM categories";
$result_cat = mysqli_query($con, $sql_cat);
$categories = mysqli_fetch_all($result_cat, MYSQLI_ASSOC);

$id_user = $_SESSION['id'];

$sql_bets = "SELECT b.user_id AS id_user, l.id AS lot_id, 
DATE_FORMAT(date, '%d.%m.%y в %H:%i') AS date_bet, b.price AS price_bet, img,
 time_exit, l.name AS name_lot, c.name AS name_cat, u.contacts AS cont_user, winner_id FROM bets b 
JOIN lots l ON b.lot_id = l.id
JOIN categories c ON l.category_id = c.id
JOIN users u ON l.user_id = u.id 
WHERE b.user_id = $id_user ORDER BY date DESC";
$result_bets = mysqli_query($con, $sql_bets);
$bets = mysqli_fetch_all($result_bets, MYSQLI_ASSOC);

if (mysqli_num_rows($result_bets) >= 1) {
$my_bets_page = include_template("my-bets.php", [
    'categories' => $categories,
    'bets' => $bets,
    'id_user' => $id_user,
]); 
} else {
    $my_bets_page = include_template("error.php", [
        'error_message' => "Вы ёще не ставили ни одной ставки.",
        'categories' => $categories,
    ]); 

}

$layout_page = include_template("layout.php", [
'content' => $my_bets_page,
 'user_name' => $user_name,
 'is_auth' => $is_auth,
 'categories' => $categories,
 'title' => 'Мои ставки',
]);

print($layout_page);