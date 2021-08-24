<?php
	try
	{
		$connect = new PDO("mysql:host=localhost;dbname=testflutter","root","");
    	
	}
	catch (Exception $e)
	{
		die('Erreur : ' .$e->getMessage());
	}