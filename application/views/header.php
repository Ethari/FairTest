<!DOCTYPE html>
<?php
$this->load->helper('url');
?>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FairTest</title>

    <!-- Bootstrap Core CSS -->
    <link href="<?php echo base_url("/assets/css/bootstrap.css"); ?>" rel="stylesheet">
    <link href="<?php echo base_url("/assets/css/styles.css"); ?>" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="<?php echo base_url("/assets/css/freelancer.min.css"); ?>" rel="stylesheet">
    <link href="<?php echo base_url("/assets/css/jquery_validation.css"); ?>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?php echo base_url("/assets/font-awesome/css/font-awesome.min.css"); ?>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <script type = "text/javascript">
        var BASE_URL = "<?php echo base_url();?>";
    </script>

</head>

<body id="page-top" class="index">

<script>
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '1301881909849167',
            cookie     : true,
            xfbml      : true,
            version    : 'v2.8'
        });
        FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>
