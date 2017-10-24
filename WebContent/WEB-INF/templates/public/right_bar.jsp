<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<aside class="sidebar right-sidebar col-lg-3 col-md-3 col-sm-3">					
					
					<!-- Bán chạy -->
					<div class="row sidebar-box red">
						
						<div class="col-lg-12 col-md-12 col-sm-12">
							
							<div class="sidebar-box-heading">
                            <i class="icons icon-award-2"></i>
								<h4>BÁN CHẠY</h4>
							</div>
							
							<div class="sidebar-box-content">
								<table class="bestsellers-table">
									<c:forEach items="${listBC}" var="objBC">
										<tr>
											<td class="product-thumbnail"><a href="#"><img src="${pageContext.request.contextPath}/files/${objBC.picture}" alt="${objBC.picture}" height="90"></a></td>
											<td class="product-info">
												<p><a href="${pageContext.request.contextPath}/mobile/${slug.makeSlug(objBC.name_mobile)}-m${objBC.id_mobile}">${objBC.name_mobile}</a></p>
												<span class="price">${formatNumber.formatNumber(objBC.gia)} VNĐ</span>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							
						</div>
						
					</div>
					<!-- /Bán chạy -->
					
					<!-- Đặc biệt -->										
					<%-- <div class="row products-row sidebar-box orange">
						 
						<div class="col-lg-12 col-md-12 col-sm-12">
							
							<!-- Carousel Heading -->
							<div class="carousel-heading no-margin">
								
								<h4><i class="icons icon-magic"></i> ĐẶC BIỆT</h4>
								<div class="carousel-arrows">
									<i class="icons icon-left-dir"></i>
									<i class="icons icon-right-dir"></i>
								</div>
								
							</div>
							<!-- /Carousel Heading -->
							
						</div>
						
						<!-- Carousel -->
						<div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">
							
							<div class="owl-carousel" data-max-items="1">
									
								<!-- Slide -->
								<div>
									<!-- Carousel Item -->
									<div class="product">
										
										<div class="product-image">
											<img src="${defines.publicUrl}/img/products/sample1.jpg" alt="Product1">
											<a href="products_page_v1.html" class="product-hover">
												<i class="icons icon-eye-1"></i> Xem ngay
											</a>
										</div>
										
										<div class="product-info">
											<h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
											<span class="price">$281.00</span>
											<div class="rating readonly-rating" data-score="4"></div>
										</div>
										
										<div class="product-actions">
											<span class="add-to-cart">
												<span class="action-wrapper">
													<i class="icons icon-basket-2"></i>
													<span class="action-name">Thêm vào giỏ hàng</span>
												</span >
											</span>
											
										</div>
										
									</div>
									<!-- /Carousel Item -->
								</div>
								<!-- /Slide -->
								
								
								<!-- Slide -->
								<div>
									<!-- Carousel Item -->
									<div class="product">
										
										<div class="product-image">
											<img src="${defines.publicUrl}/img/products/sample2.jpg" alt="Product1">
											<a href="products_page_v1.html" class="product-hover">
												<i class="icons icon-eye-1"></i> Xem ngay
											</a>
										</div>
										
										<div class="product-info">
											<h5><a href="products_page_v1.html">Lorem ipsum dolor sit amet</a></h5>
											<span class="price">$281.00</span>
											<div class="rating readonly-rating" data-score="4"></div>
										</div>
										
										<div class="product-actions">
											<span class="add-to-cart">
												<span class="action-wrapper">
													<i class="icons icon-basket-2"></i>
													<span class="action-name">Thêm vào giỏ hàng</span>
												</span >
											</span>
											
										</div>
										
									</div>
									<!-- /Carousel Item -->
								</div>
								<!-- /Slide -->
								
							</div>
						
						</div>
						<!-- / Carousel -->
						
						
					</div> --%>
					<!-- /Specials -->
					
					<!-- Quang cao -->
					<div class="row sidebar-box">
						
						<div class="col-lg-12 col-md-12 col-sm-12 sidebar-carousel">
							
							<!-- Slider -->
							<section class="sidebar-slider">
								<div class="sidebar-flexslider">
									<ul class="slides">
										<c:forEach items="${listQC}" var="qc">
											<c:if test="${qc.active == 1}">
												<li>
													<a href="${qc.lienket}"><img src="${pageContext.request.contextPath}/files/${qc.hinhanh}" alt="Slide1"/></a>
													<br>
												</li>
											</c:if>
										</c:forEach>
										<%-- <li>
											<a href="#"><img src="${defines.publicUrl}/img/sidebar-slide2.jpg" alt="Slide1"/></a>
										</li>
										<li>
											<a href="#"><img src="${defines.publicUrl}/img/sidebar-slide3.jpg" alt="Slide1"/></a>
										</li> --%>
									</ul>
								</div>
								<div class="slider-nav"></div>
							</section>
							<!-- /Slider -->
                            
						</div>
						
					</div>
					<!-- /Quảng cáo -->
					
					
				</aside>