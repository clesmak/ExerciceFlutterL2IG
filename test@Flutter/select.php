<?php
include('connexion.php');

$data = json_decode(file_get_contents("php://input"), true);
$username = $data['username'];
$password = $data['password'];
// $username = $_POST['username'];
// $password = $_POST['password'];


try {
    $st = $connect->prepare('SELECT `nom`, `postnom`, `pre`, `sexe`, `adresse`, `contact`, `mail` FROM `client` WHERE `username`=:USERNAME AND `password` =:PASSWORD');
    $st->execute(array(
        'USERNAME' => $username,
        'PASSWORD' => $password
    ));
    $rs = $st->fetch();
    if ($rs) {
        echo json_encode(array(

            "status" => true,
            "other" => array(
                "nom" => $rs['nom'],
                "postnom" => $rs['postnom'],
                "prenom" => $rs['pre'],
                "sexe" => $rs['sexe'],
                "adresse" => $rs['adresse'],
                "contact" => $rs['contact'],
                "mail" => $rs['mail'],
            )
        ));
    }

    $st->closeCursor();
} catch (Exception $e) {
    die('Erreur: ' . $e->getMessage());
}