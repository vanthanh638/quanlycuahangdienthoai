<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9">
					<section class="slider">
						<div class="tp-banner-container">
							<div class="tp-banner" >
								<ul>
									<c:forEach items="${listSlide}" var="objSlide">
									<!-- SLIDE  -->
									
									<li data-transition="fade" data-slotamount="7" data-masterspeed="1500" >
										<!-- MAIN IMAGE -->
										
										<img src="${pageContext.request.contextPath}/files/${objSlide.hinhanh}"  alt="${objSlide.ten}"  data-bgfit="cover" data-bgposition="left top" data-bgrepeat="no-repeat">
										
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
				  	</section>
					
					
					
					<!-- Featured Products -->
					<div class="products-row row">
						
						<!-- Carousel Heading -->
						<div class="col-lg-12 col-md-12 col-sm-12">							
							<div class="carousel-heading">
								<h4>Điện thoại</h4> <!-- Hiển thị 5 sản phẩm -->
								<div class="carousel-arrows">
									<i class="icons icon-left-dir"></i>
									<i class="icons icon-right-dir"></i>
								</div>
							</div>
							
						</div>
						<!-- /Carousel Heading -->
						
						<!-- Carousel -->
						<div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">
							
							<div class="owl-carousel" data-max-items="3">
									<c:forEach items="${listDienThoai}" var="dienthoai">
										<!-- Slide -->
										<div>
											<!-- Carousel Item -->
											<div class="product">
												
												<div class="product-image">
													<c:if test="${dienthoai.id < 5}"><span class="product-tag">Hot</span></c:if>
													<img src="${dienthoai.sanpham.hinhanh}" alt="Product1" height="250">
													<a href="${pageContext.request.contextPath}/mobile/${slug.makeSlug(dienthoai.sanpham.tensanpham)}-m${dienthoai.id}" class="product-hover">
														<i class="icons icon-eye-1"></i> Xem ngay
													</a>
												</div>
												
												<div class="product-info">
													<h5><a href="${pageContext.request.contextPath}/mobile/${slug.makeSlug(dienthoai.sanpham.tensanpham)}-m${dienthoai.id}">${dienthoai.sanpham.tensanpham}</a></h5>
													<span class="price">${formatNumber.formatNumber(dienthoai.sanpham.gia)} VNĐ</span>
												<!-- 	<div class="rating readonly-rating" data-score="4"></div> -->
												</div>
												
												<div class="product-actions" onClick="return addCart('${dienthoai.id}', '${dienthoai.sanpham.hinhanh}', ${dienthoai.sanpham.gia})">
													<span class="add-to-cart" >
														<span class="action-wrapper">
															<input type="hidden" value="1" id="item_number">
															<i class="icons icon-basket-2"></i>
															<span class="action-name">Thêm vào giỏ hàng</span>
														</span >
													</span>
												</div>
												
											</div>
											<!-- /Carousel Item -->
										</div>
										<!-- /Slide -->
									</c:forEach>
							</div>
						</div>
						<!-- /Carousel -->
						
					</div>
					<!-- /Featured Products -->

					<!-- /Random Products -->
					
					<!-- Accessories -->										
					<div class="products-row row">
						
						<!-- Carousel Heading -->
						<div class="col-lg-12 col-md-12 col-sm-12">
							
							<div class="carousel-heading">
								<h4>Phụ kiện</h4>
								<div class="carousel-arrows">
									<i class="icons icon-left-dir"></i>
									<i class="icons icon-right-dir"></i>
								</div>
							</div>
							
						</div>
						
						
						<div class="products-row row">
						
						<!-- /Carousel Heading -->
						
						<!-- Carousel -->
						<!-- Phụ kiện -->
						<div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">
							
							<div class="owl-carousel" data-max-items="3">
									<c:forEach items="${listPK}" var="phukien">
										<!-- Slide -->
										<div>
											<!-- Carousel Item -->
											<div class="product">
												
												<div class="product-image">
													<!-- <span class="product-tag">Sale</span> -->
													<img src="${phukien.sanpham.hinhanh}" alt="Product1">
													<a href="${pageContext.request.contextPath}/phu-kien/${slug.makeSlug(phukien.sanpham.tensanpham)}-pk${phukien.id}" class="product-hover">
														<i class="icons icon-eye-1"></i> Xem ngay
													</a>
												</div>
												
												<div class="product-info">
													<h5><a href="${pageContext.request.contextPath}/phu-kien/${slug.makeSlug(phukien.sanpham.tensanpham)}-pk${phukien.id}">${phukien.sanpham.tensanpham}</a></h5>
													<span class="price">${formatNumber.formatNumber(phukien.sanpham.gia)} VNĐ</span>
												</div>
												
												<div class="product-actions" onclick="return addCart('${phukien.sanpham.tensanpham}', '${phukien.sanpham.hinhanh}', ${phukien.sanpham.gia})">
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
									</c:forEach>
							</div>
						</div> 
						<!-- /Carousel -->
						
						<!-- END phụ kiên -->
						
					</div>
					<!-- /Accessories -->


					<!-- Product Brands -->
					<div class="products-row row">
						
						<!-- Carousel Heading -->
						<div class="col-lg-12 col-md-12 col-sm-12">
							
							<div class="carousel-heading">
								<h4>Thương hiệu</h4>
								<div class="carousel-arrows">
									<i class="icons icon-left-dir"></i>
									<i class="icons icon-right-dir"></i>
								</div>
							</div>
							
						</div>
						<!-- /Carousel Heading -->
						
						<!-- Carousel -->
						<%-- <div class="carousel owl-carousel-wrap col-lg-12 col-md-12 col-sm-12">
							
							<div class="owl-carousel" data-max-items="5">
									<c:forEach items="${listPro}" var="objPro">
										<!-- Slide -->
										<div>
											<div class="product">
												<a href="${pageContext.request.contextPath}/mobile/${slug.makeSlug(objPro.name_pro)}/cm${objPro.id_pro}"><img src="${pageContext.request.contextPath}/files/${objPro.icon}" alt="${objPro.name_pro}" width="150" height="115"></a>
											</div>
										</div>
										<!-- /Slide -->
									</c:forEach>
									
							</div>
							
						</div> --%>
						<!-- /Carousel -->
						
					</div>
					<!-- /Product Brands -->
						
				</section>
				
<!-- ${pageContext.request.contextPath} -->
<script type="text/javascript">
function addCart(name, C){
	alert('${pageContext.request.contextPath}/addCart');
	/* $.ajax({
		url: '${pageContext.request.contextPath}/addCart',
		type: 'POST',
		cache: false,
		data: {
			san_pham: name, 
			: C
		},
		success: function(data){
			$(".pull-right").html(data);
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	});
	return false; */
}
</script>			
