<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Include Composer's autoloader
require 'vendor/autoload.php';

$name = $_POST["name"];
$email = $_POST["email"];
$subject = $_POST["subject"];
$message = $_POST["message"];

$mail = new PHPMailer(true);

try {
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_OFF; 
    $mail->isSMTP(); 
    $mail->Host = 'smtp.gmail.com'; 
    $mail->SMTPAuth = true; 
    $mail->Username = 'lemondeduvin2024@gmail.com'; 
    $mail->Password = 'nlralpaxrhztmxcr'; 
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS; 
    $mail->Port = 587; 

    //Recipients
    $mail->setFrom('lemondeduvin2024@gmail.com', 'Mailer');
    $mail->addAddress($email, $name); 

    // Content
    $mail->isHTML(true); 
    $mail->Subject = $subject;
    $mail->Body    = $message;

    $mail->send();
    echo 'Message has been sent';
} catch (Exception $e) {
    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
}

// Database connection 
$conn = mysqli_connect("localhost", "root", "", "mail") or die("Connection failed");
$sql = "INSERT INTO contactus(name, Email, subject, message) VALUES ('{$name}', '{$email}', '{$subject}', '{$message}')";
$result = mysqli_query($conn, $sql) or die("Query Failed!");
mysqli_close($conn);

// HTML response  
echo '

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact form</title>
    <link href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="contact_us.css">
</head>
<body>
    <div class="container">
        <h1>Thank you for contacting me. I will get back to you as soon as possible!</h1>
        <p class="back">Go back to the <a href="Explore_page.html">homepage</a>.</p>
    
    </div>
</body>
</html>
';
?>
