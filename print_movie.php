<?php 
	
	$con = new mysqli('localhost', 'root', '', 'filmovi');
	$movie = ucfirst($_GET['movie']);
 	$result = $con->query("Select F.FilmId, F.Naziv, F.VrijemeTrajanja, R.Ime, R.Prezime, Z.Naziv from film F, redatelj R, zanr Z where F.RedateljId = R.RedateljId AND F.ZanrId = Z.ZanrId AND F.Naziv like '$movie%'");
	$arr = array();
	$sub_arr = array();

	if ($result->num_rows){

		while($row = $result->fetch_array()){

			$sub_arr['id'] = $row[0];
			$sub_arr['naziv'] = $row[1];
			$sub_arr['vrijeme_trajanja'] = $row[2];
			$sub_arr['ime'] = $row[3];
			$sub_arr['prezime'] = $row[4];			
			$sub_arr['zanr'] = $row[5];

			$arr[] = $sub_arr;
		}

		echo json_encode($arr);

	}
		   
   else echo 'Nema rezultata pretrage!';
   

?>