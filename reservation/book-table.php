<?php
session_start();
error_reporting(0);

include('includes/dbconnection.php');

$msg = "";
	
if (strlen($_SESSION['obbsuid']==0)) {
	header('location:logout.php');
	} else{
  
	if($_SERVER['REQUEST_METHOD'] == 'POST') {
		
		if(isset($_POST['submit'])) {
			
			$guest = preg_replace("#[^0-9]#", "", $_POST['guest']);
			$email = filter_var($_POST['email'], FILTER_VALIDATE_EMAIL);
			$phone = preg_replace("#[^0-9]#", "", $_POST['phone']);
			$date_res = htmlentities($_POST['date_res'], ENT_QUOTES, 'UTF-8');
			$time = htmlentities($_POST['time'], ENT_QUOTES, 'UTF-8');
			$suggestions = htmlentities($_POST['suggestions'], ENT_QUOTES, 'UTF-8');
			
			if($guest != "" && $email && $phone != "" && $date_res != "" && $time != "" && $suggestions != "") {
				
				$check = $dbh->query("SELECT * FROM reservation WHERE no_of_guest='".$guest."' AND email='".$email."' AND phone='".$phone."' AND date_res='".$date_res."' AND time='".$time."' LIMIT 1");
				
				if($check->num_rows) {
					
					$msg = "<p style='padding: 15px; color: red; background: #ffeeee; font-weight: bold; font-size: 13px; border-radius: 4px; text-align: center;'>You have already placed a reservation with the same information</p>";
					
				}else{
					
					$insert = $dbh->query("INSERT INTO reservation(no_of_guest, email, phone, date_res, time, suggestions) VALUES('".$guest."', '".$email."', '".$phone."', '".$date_res."', '".$time."', '".$suggestions."')");
					
					if($insert) {
						
						$ins_id = $dbh->insert_id;
						
						$reserve_code = "UNIQUE_$ins_id".substr($phone, 3, 8);
						
						$msg = "<p style='padding: 15px; color: green; background: #eeffee; font-weight: bold; font-size: 13px; border-radius: 4px; text-align: center;'>Reservation placed successfully. Your reservation code is $reserve_code. Please Note that reservation expires after one hour</p>";

						
					}else{
						
						$msg = "<p style='padding: 15px; color: red; background: #ffeeee; font-weight: bold; font-size: 13px; border-radius: 4px; text-align: center;'>Could not place reservation. Please try again</p>";

					}
					
				}
				
			}else{
				
				$msg = "<p style='padding: 15px; color: red; background: #ffeeee; font-weight: bold; font-size: 13px; border-radius: 4px; text-align: center;'>Incomplete form data or Invalid data type</p>";
				
				print_r($_POST);
				
			}
			
		}

	}
		
	}
	

?>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Nourish | Service </title>
<link rel="shortcut icon" href="images/icon.png" type="image/x-icon" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!--// bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" >
<link rel="stylesheet" href="css/main.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script> 
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<![endif]-->
</head>
<body>
	<!-- banner -->
	<div class="banner jarallax">
		<div class="agileinfo-dot">
		<?php include_once('includes/header.php');?>
			<div class="wthree-heading">
				<h2>Reservation</h2>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!-- about -->
	
<div class="content" onclick="remove_class()">
	
	<div class="inner_content">
		
		<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>" class="hr_book_form">
			
			<h2 class="form_head"><span class="book_icon">BOOK A TABLE</span></h2>
			<p class="form_slg">We offer you the best reservation services</p>
			
			<?php echo "<br/>".$msg; ?>
			
			<div class="left">
				
				<div class="form_group">
					 
					 <label>No of Guest</label>
					<input type="number" placeholder="How many guests" min="1" name="guest" id="guest" required>
					
				</div>
				
				<div class="form_group">
					
					<label>Email</label>
					<input type="email" name="email" placeholder="Enter your email" required>
					
				</div>
				
				<div class="form_group">
					
					<label>Phone Number</label>
					<input type="text" name="phone" placeholder="Enter your phone number" required>
					
				</div>
				
				<div class="form_group">
					
					<label>Date</label>
					<input type="date" name="date_res" placeholder="Select date for booking" required>
					
				</div>
				
				<div class="form_group">
					
					<label>Time</label>
					<input type="time" name="time" placeholder="Select time for booking" required>
					
				</div>
				
				
			</div>
			
			<div class="left">
				
				<div class="form_group">
					
                    <label>Suggestions <small><b>(E.g No of Plates, How you want the setup to be)</b></small></label>
					<textarea name="suggestions" placeholder="your suggestions" required></textarea>
					
				</div>
				
				<div class="form_group">
					
					<input type="submit" class="submit" name="submit" value="MAKE YOUR BOOKING" />
					
				</div>
				
			</div>
			
			<p class="clear"></p>
			
		</form>
		
	</div>
	
</div>

	<!-- //about -->
	<!-- footer -->
	<?php include_once('includes/footer.php');?>
	<!-- jarallax -->
	<script src="js/jarallax.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed: 0.5,
			imgWidth: 1366,
			imgHeight: 768
		})
	</script>
	<!-- //jarallax -->
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/
								
			$().UItoTop({ easingType: 'easeOutQuart' });
								
			});
	</script>
<!-- //here ends scrolling icon -->
<script src="js/modernizr.custom.js"></script>

</body>	
</html>