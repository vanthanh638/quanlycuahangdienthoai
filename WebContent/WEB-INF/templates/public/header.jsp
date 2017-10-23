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
        <title>MobileShop</title>
        
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
		<link rel="stylesheet" href="${defines.publicUrl}/css/reset.css">
		
		<!-- JavaScript -->
		<script src="${defines.publicUrl}/js/modernizr.min.js"></script>
		<script src="${defines.publicUrl}/js/jquery-3.1.1.min.js"></script>
		<script src="${defines.publicUrl}/js/jquery-1.11.0.min.js"></script>
		<script src="${defines.publicUrl}/js/jquery.validate.min.js"></script>
		<script src="${defines.publicUrl}/js/script.js"></script>
		<script src="${defines.publicUrl}/js/notify.js"></script>
        
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
								<ul class="pull-left">
								</ul>
							</nav>
							
							<nav class="col-lg-5 col-md-5 col-sm-5">
								<ul class="pull-right">
									<c:choose>
										<c:when test="${objUser == null}">
											<li class="purple"><a href="${pageContext.request.contextPath}/account"><i class="icons icon-user-3"></i> Đăng nhập</a>
												<ul id="login-dropdown" class="box-dropdown">
													<li>	
														<form id="frmLogin" action="${pageContext.request.contextPath}/account" method="post">
			                                            	<div class="box-wrapper">
			                                                    <h4>Đăng nhập</h4>
			                                                    <div class="iconic-input">
			                                                        <input type="text" placeholder="Username" name="username" >
			                                                        <i class="icons icon-user-3"></i>
			                                                    </div>
			                                                    <div class="iconic-input">
			                                                        <input type="password" placeholder="Password" name="password">
			                                                        <i class="icons icon-lock"></i>
			                                                    </div>
			                                                    
			                                                    <br>
			                                                    <div class="pull-left">
			                                                        <input type="submit" class="orange" value="Login">
			                                                    </div>
			                                                    <!--<div class="pull-right">
			                                                        <a href="#">Forgot your password?</a>
			                                                        <br>
			                                                        <a href="#">Forgot your username?</a>
																	<br>
			                                                    </div> -->
			                                                    <br class="clearfix">
			                                                </div>
		                                                </form>
														<div class="footer">
															<h4 class="pull-left">Khách hàng mới?</h4>
															<a class="button pull-right" href="${pageContext.request.contextPath}/account">Đăng ký</a>
														</div>
													</li>
												</ul>
											</li>
											<%-- <li><a href="${pageContext.request.contextPath}/account"><i class="icons icon-lock"></i> Đăng ký</a></li> --%>
										</c:when>
										<c:otherwise>
											<li><a href="${pageContext.request.contextPath}/don-hang-c${objUser.id}"><i class=""></i> Đơn hàng</a></li>
											<li><a href="${pageContext.request.contextPath}/account"><i class="icons icon-user-1"></i> ${objUser.username}</a></li>
											<li><a href="${pageContext.request.contextPath}/account/logout"><i class="icons icon-lock"></i> Đăng xuất</a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</nav>
							
						</div>
						
					</div>
					<!-- /Top Header -->
					
					
					
					<!-- Main Header -->
					<div id="main-header">
						
						<div class="row">
							
							<div id="logo" class="col-lg-4 col-md-4 col-sm-4">
								<a href="${pageContext.request.contextPath}/"><img src="${defines.publicUrl}/img/logo.png" alt="Logo"></a>
							</div>
							
							<nav id="middle-navigation" class="col-lg-8 col-md-8 col-sm-8">
								<ul class="pull-right">
									
									<li class="orange" id="add-cart">
										<%-- ${cart.total()} --%>
										<c:choose>
											<c:when test="${cart.total() > 0}">
											<a href="${pageContext.request.contextPath}/gio-hang"><i class="icons icon-basket-2"></i>${cart.total()} Items</a>
	                                    	<ul id="cart-dropdown" class="box-dropdown parent-arrow">
												<li>
	                                            	<div class="box-wrapper parent-border">
	                                                    <p>Giỏ hàng</p>
	                                                    <table class="cart-table">
	                                                    	<c:forEach begin="0" end="${cart.total()-1}" var="i">
		                                                    	<c:set var="objProduct" value="${cart.getItem(i)}"></c:set>
		                                                    	<tr>
		                                                    		<td><img src="${pageContext.request.contextPath}/files/${objProduct.picture}" alt="product"></td>
		                                                            <td>
		                                                                <h6>${objProduct.san_pham}</h6>
		                                                                <!-- <p>Product code PSBJ3</p> -->
		                                                            </td>
		                                                            <td>
		                                                            	<span class="quantity"><span class="light">${objProduct.so_luong} x</span> ${formatNumber.formatNumber(objProduct.gia)}</span>
		                                                            </td>
		                                                        </tr>
	                                                       </c:forEach>
	                                                    </table>
	                                                    
	                                                    <br class="clearfix">
		                                            </div>
		                                                
													<div class="footer">
														<table class="checkout-table pull-right">
	                                                        <tr>
	                                                        	<td class="align-right"><strong>Tổng:</strong></td>
	                                                            <td><strong class="parent-color">${formatNumber.formatNumber(cart.tongTien())} VNĐ</strong></td>
	                                                        </tr>
	                                                    </table>
													</div>
		                                                
	                                                <div class="box-wrapper no-border">
	                                                	
														<a class="button pull-right" href="${pageContext.request.contextPath}/gio-hang">Xem giỏ hàng</a>
	                                                </div>
												</li>
											</ul>
										</c:when>
										<c:otherwise>
											<a href="${pageContext.request.contextPath}/gio-hang"><i class="icons icon-basket-2"></i>0 Items</a>
										</c:otherwise>
                                      </c:choose>
                                    </li>
									
								</ul>
							</nav>
							
						</div>
						
					</div>
					<!-- /Main Header -->
					
					
					<!-- Main Navigation -->
					<nav id="main-navigation" class="style1">
						<ul>							
							<li class="red">
								<a href="${pageContext.request.contextPath}/">
									<i class="icons icon-shop-1"></i>
									<span class="nav-caption">Trang chủ</span>
									
								</a>																
							</li>
							<li class="green">								
								<a href="${pageContext.request.contextPath}/dien-thoai">
									<i class="icons icon-mobile-6"></i>
									<span class="nav-caption">Điện thoại</span>
								</a>
								<ul class="wide-dropdown normalAniamtion">
									<li>
										<ul>
											<c:forEach items="${listPro}" var="objPro">
												<li><a href="${pageContext.request.contextPath}/mobile/${slug.makeSlug(objPro.name_pro)}/cm${objPro.id_pro}"><i class="icons icon-right-dir"></i> ${objPro.name_pro}</a></li>
											</c:forEach>
										</ul>
									</li>
								</ul>
							</li>
							<li class="blue">
								<a href="${pageContext.request.contextPath}/phu-kien">
									<i class="icons icon-camera-7"></i>
									<span class="nav-caption">Phụ Kiện</span>									
								</a>
								
								<ul class="wide-dropdown normalAniamtion">
									<li>
										<ul>											
											<c:forEach items="${listLoaiPK}" var="objLoaiPK">
												<li><a href="${pageContext.request.contextPath}/phu-kien/${slug.makeSlug(objLoaiPK.name_loai_pk)}/cp${objLoaiPK.id_loai_pk}"><i class="icons icon-right-dir"></i> ${objLoaiPK.name_loai_pk}</a></li>
											</c:forEach>
										</ul>
									</li>																
								</ul>								
							</li>
							<li class="purple">
								<a href="${pageContext.request.contextPath}/gioi-thieu">
									<i class="icons icon-pencil-7"></i>
									<span class="nav-caption">Giới thiệu</span><br>
								</a>
							</li>												
							<li class="orange">
								<a href="${pageContext.request.contextPath}/lien-he">
									<i class="icons icon-location-7"></i>
									<span class="nav-caption">Liên hệ</span>
									
								</a>
							</li>
							
							<li class="nav-search">
                                	<i class="icons icon-search-1"></i>
							</li>
							
						</ul>
						
						<div id="search-bar">
							<form action="${pageContext.request.contextPath}/search" method="post">
								<div class="col-lg-12 col-md-12 col-sm-12">
									<table id="search-bar-table">
										<tr>
											<td class="search-column-1">
                                            <p><span class="grey"></span></p>
                                            <input type="text" name="name" value="${name}" placeholder="Nhập tên sản phẩm">
                                        </td>
                                        <td class="search-column-2">
                                        	<p class="align-right"></p>
                                        	<select name="cat" class="chosen-select-search">
                                        		<c:choose>
                                        			<c:when test="${cat eq 'pk'}">
                                        				<option value="mobile">Điện thoại</option>
                                                		<option selected="selected" value="pk">Phụ kiện</option>
                                        			</c:when>
                                        			<c:otherwise>
                                        				<option selected="selected" value="mobile">Điện thoại</option>
                                        				<option value="pk">Phụ kiện</option>
                                        			</c:otherwise>
                                        		</c:choose>	
                                        		<c:if test="${cat eq 'mobile'}"></c:if>
                                                
                                            </select>
                                		</td>									
										</tr>
									</table>
								</div>
								<div id="search-button">
									<input type="submit" value="">
									<i class="icons icon-search-1"></i>
								</div>
							</form>
						</div>
						
					</nav>
					<!-- /Main Navigation -->
					
				</div>
				
			</header>
			<!-- /Header -->