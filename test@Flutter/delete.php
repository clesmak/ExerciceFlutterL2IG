<?php
include('connexion.php');

$code = $_GET['id'];
try {
    $st = $connect->prepare('DELETE FROM `etudiant` WHERE `id`=:CODE');
    $st->execute(array('CODE' => $code));
    echo json_encode(array(
        "statut" => true,
        "message" => "Delete succesful"
    ));
    $st->closeCursor();
} catch (Exception $e) {
    die('Erreur: ' . $e->getMessage());
}