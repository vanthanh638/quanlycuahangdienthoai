<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<!DOCTYPE html>

<html>

    <head>
        
        <!-- Meta Tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <!-- Title -->
        <title>MobileShop - Admincp</title>
        
		<!-- Fonts -->
		<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,900,700italic,500italic' rel='stylesheet' type='text/css'>
		
        <!-- Stylesheets -->
        <link rel="stylesheet" href="${defines.publicUrl}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${defines.publicUrl}/css/perfect-scrollbar.css">
        <link rel="stylesheet" href="${defines.publicUrl}/css/style.css">
        <link rel="stylesheet" href="${defines.publicUrl}/css/flexslider.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="${defines.publicUrl}/css/fontello.css">
		<link rel="stylesheet" type="text/css" href="${defines.publicUrl}/css/settings.css" media="screen" />
   		<link rel="stylesheet" href="${defines.publicUrl}/css/animation.css">
		<link rel="stylesheet" href="${defines.publicUrl}/css/owl.carousel.css">
		<link rel="stylesheet" href="${defines.publicUrl}/css/owl.theme.css">
		<link rel="stylesheet" href="${defines.publicUrl}/css/chosen.css">
		
		<!-- JavaScript -->
		<script src="${defines.publicUrl}/js/modernizr.min.js" type="text/javascript"></script>
		<script src="${defines.publicUrl}/js/jquery-3.1.1.min.js" type="text/javascript"></script>
		<script src="${defines.publicUrl}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
		<script src="${defines.publicUrl}/js/jquery.validate.min.js" type="text/javascript"></script>
		<script src="${defines.publicUrl}/js/script.js" type="text/javascript"></script>
		<script src="${defines.publicUrl}/ckeditor/ckeditor.js" type="text/javascript"> </script>
        
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<link rel="stylesheet" href="css/ie.css">
        <![endif]-->
		<!--[if IE 7]>
			<link rel="stylesheet" href="css/fontello-ie7.css">
		<![endif]-->
        
    </head>
    
    
    <body>
		
		<!-- Container -->
		<div class="container">
			
			<!-- Header -->
			<header class="row">
				
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<!-- Top Header -->
					<div id="top-header">
						
						<div class="row">
							
							<nav id="top-navigation" class="col-lg-7 col-md-7 col-sm-7">
								
							</nav>
							
							<nav class="col-lg-5 col-md-5 col-sm-5">
								<c:if test="${userImfor != null}">
									<ul class="pull-right">
										<li class="purple">
											<i class="icons icon-user-3"></i> ${userImfor.username}
										</li>
										<li class="purple">
											<a href="${pageContext.request.contextPath}/logout"><i class="icons icon-user-3"></i> Logout</a>
										</li>
									</ul>
								</c:if>
								
							</nav>
							
						</div>
						
					</div>
					<!-- /Top Header -->
					
					
					
					<!-- Main Header -->
					<div id="main-header">
						
						<div class="row">
							
							<div id="logo" class="col-lg-4 col-md-4 col-sm-4">
								<a href="${pageContext.request.contextPath}/admincp"><img src="${defines.publicUrl}/img/logo.png" alt="Logo"></a>
							</div>
							
							<nav id="middle-navigation" class="col-lg-8 col-md-8 col-sm-8">													
						</div>
						
					</div>
					<!-- /Main Header -->
					
					
					<!-- Main Navigation -->
					<nav id="main-navigation" class="style1">
						<ul>							
							<li class="blue">
																					
							</li>
						</ul>
						
						
						
					</nav>
					<!-- /Main Navigation -->
					
				</div>
				
			</header>
			<!-- /Header -->