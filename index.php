<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Page 2</title>
		
		<meta name="description" content="Официальный сайт Campaigner">
		<meta name="author" content="Campaigner Team">
		<meta name="keywords" content="web-дизайн, мати, ист">
		
		<link rel="icon" href="/favicon.ico" type="image/x-icon">
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		
		<link href="/styles/styles.css" media="all" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<p>Text</p>
		<?php
		 $q = "SELECT * from articles;";
		 $conn = mysql_connect('');
		 $result = mysql_query($conn, $q);
		 foreach (r in $result) {
			echo "<div>" + r['title'] + "</div>";
			echo "<div>" + r['body'] + "</div>";
		 }
		?>
	</body>
</html>