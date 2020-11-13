<?php
require "koneksi.php";
	if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		$response = array();
		$username = $_POST['username'];
		$password = md5($_POST['password']);
		// langkah 2
		$cek = "SELECT * FROM tb_user WHERE username='$username' and
		password='$password'";
		$result = mysqli_fetch_array(mysqli_query($connect, $cek));
		if (isset($result)) {
			$response['value'] = 1;
			$response['message'] = "Login berhasil";
			$response['id_user'] = $result['id_user'];
			$response['gambar'] = $result['gambar'];
			$response['username'] = $result['username'];
			$response['email'] = $result['email'];
			$response['full_name'] = $result['full_name'];
			$response['sex'] = $result['sex'];
			$response['alamat'] = $result['alamat'];
			$response['password'] = $result['password'];
			echo json_encode($response);
		} else {
			$response['value'] = 0;
			$response['message'] = "Login gagal";
			echo json_encode($response);
			}
		}
?>
