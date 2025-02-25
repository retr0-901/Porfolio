<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
if($_POST['pagedetails'])
{
	
	$pagedetails=$_POST['pagedetails'];
	
$query = $dbh->prepare($sql);

$query -> execute();

}

?>

<!doctype html>
<html lang="en" class="no-js">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="theme-color" content="#3e454c">
	
	<title>Syiok Wheels | Manager Monthly Report</title>

	<!-- Font awesome -->
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<!-- Sandstone Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap Datatables -->
	<link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
	<!-- Bootstrap social button library -->
	<link rel="stylesheet" href="css/bootstrap-social.css">
	<!-- Bootstrap select -->
	<link rel="stylesheet" href="css/bootstrap-select.css">
	<!-- Bootstrap file input -->
	<link rel="stylesheet" href="css/fileinput.min.css">
	<!-- Awesome Bootstrap checkbox -->
	<link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
	<!-- Admin Stye -->
	<link rel="stylesheet" href="css/style.css">
	<script type="text/JavaScript">
</script>
<script type="text/javascript" src="nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>

</head>

<body>
	<?php include('includes/header.php');?>

  <div class="ts-main-content">
	<?php include('includes/leftbar.php');?>
	<div class="content-wrapper">
			<div class="container-fluid">

				<div class="row">
					<div class="col-md-12">
					
						<h2 class="page-title">Monthly Report </h2>

<div id="print">
				
								<table border="1" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
									<thead>
										<tr>
										<th>#</th>
												<th>Booking ID</th>
												<th>Vehicle ID</th>
												<th>Booking Number</th>
											<th>Booking Days</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
										<th>#</th>
												<th>Booking ID</th>
												<th>Vehicle ID</th>
												<th>Booking Number</th>
											<th>Booking Days</th>
										</tr>
									</tfoot>
									<tbody>


									<?php $currentMonth = date("m");
									$sql = "SELECT * from tblreport WHERE MONTH(report_date) = :currentMonth";
$query = $dbh -> prepare($sql);
$query->bindParam(':currentMonth', $currentMonth, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{				?>	
										<tr>
											<td><?php echo htmlentities($cnt);?></td>
											<td><?php echo htmlentities($result->booking_id);?></td>
											<td><?php echo htmlentities($result->vehicle_id);?></td>
											<td><?php echo htmlentities($result->booking_number);?></td>
											<td><?php echo htmlentities($result->date_diff);?></td>


										</tr>

										<?php $cnt=$cnt+1; }} ?>
										
									</tbody>
								</table>

								<table border="1" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
											<thead>
										<tr>
												<th>Total Users</th>
												<th>Total Subscribers</th>
												<th>Total Testimonials</th>
										</tr>
									</thead>
									<tbody>


									<?php $sql = "SELECT * from tblreport limit 1";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{				?>	
										<tr>
											<td><?php echo htmlentities($result->user_count);?></td>
											<td><?php echo htmlentities($result->subscriber_count);?></td>
											<td><?php echo htmlentities($result->testimonial_count);?></td>


</tr>
										<?php $cnt=$cnt+1; }} ?>
										
									</tbody>
								</table>									

								<form method="post">
	   <input name="Submit2" type="submit" class="txtbox4" value="Print" onClick="return f3();" style="cursor: pointer;"  />
	</form>

</div>
</div>

	<!-- Loading Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>
	<script src="js/Chart.min.js"></script>
	<script src="js/fileinput.js"></script>
	<script src="js/chartData.js"></script>
	<script src="js/main.js"></script>
	<script language="javascript" type="text/javascript">
	function f3()
{
window.print(); 
}
</script>
</body>

</html>
<?php } ?>
