<?php
include('connection.php');
$stmt = $conn->prepare("SELECT * FROM products_vehicles WHERE vehicle_category='Bike' LIMIT 4");

$stmt->execute();

$twowheel = $stmt->get_result();
?>