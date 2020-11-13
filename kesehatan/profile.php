<?php

require "koneksi.php";

$response = array();
$id_user = $_POST['id_user'];


$sql = mysqli_query($connect, "SELECT * FROM tb_user WHERE id_user = '$id_user'");

while ($a = mysqli_fetch_array($sql)) {
    # code...
	$response['message'] = "berhasil";

    $b['id_user'] = $a['id_user'];
    $b['username'] = $a['username'];
    $b['email'] = $a['email'];
    $b['full_name'] = $a['full_name'];
    $b['sex'] = $a['sex'];
    $b['password'] = $a['password'];
    $b['alamat'] = $a['alamat'];
    $b['tgl_daftar'] = $a['tgl_daftar'];


    array_push($response, $b);
}

echo json_encode($response);


?>