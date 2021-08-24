<?php
include('connexion.php');

$id = $_POST['id'];
$nom = $_POST['nom'];
$postnom = $_POST['postnom'];
$prenom = $_POST['prenom'];
$sexe = $_POST['sexe'];
$date_naiss = $_POST['date_naiss'];
$poid = $_POST['poid'];
$taille = $_POST['taille'];


try {
    $st = $connect->prepare('UPDATE `etudiant` SET `nom`=:NOM,`postnom`=:POSTNOM,`prenom`=:PRENOM,`sexe`=:SEXE,
    `Date_naiss`=:DATE_NAISS,`poid`=:POID,`taille`=:TAILLE WHERE `id`=:ID)');
    $st->execute(array(
        'ID' => $id,
        'NOM' => $nom,
        'POSTNOM' => $postnom,
        'PRENOM' => $prenom,
        'SEXE' => $sexe,
        'DATE_NAISS' => $date_naiss,
        'POID' => $poid,
        'TAILLE' => $taille
    ));
    echo json_encode(array(

        "statut" => true,
        "message" => "Update succesful"
    ));
    $st->closeCursor();
} catch (Exception $e) {
    die('Erreur: ' . $e->getMessage());
}