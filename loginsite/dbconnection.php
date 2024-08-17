<?php
$servername = "localhost";   // Server name, usually 'localhost' for local development
$username = "root";          // Default MySQL username for XAMPP
$password = "";              // Default MySQL password (empty for XAMPP)
$dbname = "user_info";       // Name of the database you created

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// If form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['signupName'];
    $email = $_POST['signupEmail'];
    $password = $_POST['signupPassword'];

    // Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Prepare and bind the SQL statement
    $stmt = $conn->prepare("INSERT INTO user (name, email, password) VALUES (?, ?, ?)");
    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("sss", $name, $email, $hashed_password);

    // Execute the statement
    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close the statement
    $stmt->close();
}

// Close the connection
$conn->close();
?>
