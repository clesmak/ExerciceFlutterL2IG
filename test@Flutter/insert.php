<?php
include('connexion.php');
$data = json_decode(file_get_contents("php://input"), true);

$nom = $data['nom'];
$postnom = $data['postnom'];
$prenom = $data['prenom'];
$sexe = $data['sexe'];
$adresse = $data['adresse'];
$contact = $data['contact'];
$mail = $data['mail'];
$username = $data['username'];
$password = $data['password'];


try {
    $st = $connect->prepare('INSERT INTO `client`(`nom`, `postnom`, `pre`, `sexe`, `adresse`, `contact`, `mail`, `username`, `password`) VALUES 
    (:NOM,:POSTNOM,:PRENOM,:SEXE,:ADRESSE,:CONTACT,:MAIL,:USERNAME,:PASSWORDD)');
    $st->execute(array(
        'NOM' => $nom,
        'POSTNOM' => $postnom,
        'PRENOM' => $prenom,
        'SEXE' => $sexe,
        'ADRESSE' => $adresse,
        'CONTACT' => $contact,
        'MAIL' => $mail,
        'USERNAME' => $username,
        'PASSWORDD' => $password
    ));
    echo json_encode(array(

        "statut" => true,
        "message" => "Save succesful"
    ));
    $st->closeCursor();
} catch (Exception $e) {
    die('Erreur: ' . $e->getMessage());
}