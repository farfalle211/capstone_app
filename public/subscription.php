<?php

/*
 * Script for sending Subscriber E-Mail Address.
 * 
 * Note: Please edit $sendTo variable value to your email address and $subject variable value to desired subject for all E-Mails.
 * 
 */
  
 
$email = $_POST['newsletter_email'];
$subject = 'New Subscriber';

$error = "success";
$flash = "";

if ($email == "" || !filter_var($email, FILTER_VALIDATE_EMAIL)) {  
	$error = "error";
	$flash = "There was a problem while sending E-Mail. Please verify entered data and try again!"; 
	echo json_encode(array("error" => $error, "flash" => $flash));
	exit;     	
}


$message = "The following person has subscribed to your newsletter: ".$email;

$headers = 'From: ' . $email . "\r\n" .
        'Reply-To: ' . $email . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

// Please change this to your E-Mail address
$sendTo = "example@example.com";

if (@mail($sendTo, $subject, $message, $headers)) {    
	$flash = "Email successfully added.";
} else {
	$flash = "There was a problem while sending E-Mail.";    
	$error = "error";
}

echo json_encode(array("error" => $error, "flash" => $flash));
?>