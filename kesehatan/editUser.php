<?php 

require "koneksi.php";

 $id_user = $_POST['id_user'];
 $username = $_POST['username'];
 $email = $_POST['email'];
 $full_name = $_POST['full_name'];
 $sex = $_POST['sex'];
 $alamat = $_POST['alamat'];

$connect->query("UPDATE tb_user set username='".$username."',email='".$email."',full_name='".$full_name."',sex='".$sex."',alamat='".$alamat."' WHERE id_user=".$id_user);
 ?>