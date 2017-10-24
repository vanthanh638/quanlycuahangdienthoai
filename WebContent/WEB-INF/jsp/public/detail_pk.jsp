<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section class="main-content col-lg-9 col-md-9 col-sm-9">
	<div id="product-single">

		<!-- Product -->
		<div class="product-single">

			<div class="row">

				<!-- Product Images Carousel -->
				<div class="col-lg-5 col-md-5 col-sm-5 product-single-image">

					<div id="product-slider">
						<ul class="slides">
							<li><img class="cloud-zoom"
								src="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}"
								data-large="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}" alt="" /> <a
								class="fullscreen-button" href="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}">
									<div class="product-fullscreen">
										<i class="icons icon-resize-full-1"></i>
									</div>
							</a></li>
						</ul>
					</div>
					<div id="product-carousel">
						<ul class="slides">
							<li><a class="fancybox" rel="product-images"
								href="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}"></a> <img
								src="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}"
								data-large="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}" alt="" />
							</li>
							<%-- <li><a class="fancybox" rel="product-images"
								href="${defines.publicUrl}/img/products/single2.jpg"></a> <img
								src="${defines.publicUrl}/img/products/single2.jpg"
								data-large="${defines.publicUrl}/img/products/single2.jpg" alt="" /></li>
							<li><a class="fancybox" rel="product-images"
								href="${defines.publicUrl}/img/products/single3.jpg"></a> <img
								src="${defines.publicUrl}/img/products/single3.jpg"
								data-large="${defines.publicUrl}/img/products/single3.jpg" alt="" /></li>
							<li><a class="fancybox" rel="product-images"
								href="${defines.publicUrl}/img/products/single4.jpg"></a> <img
								src="${defines.publicUrl}/img/products/single4.jpg"
								data-large="${defines.publicUrl}/img/products/single4.jpg" alt="" /></li>
							<li><a class="fancybox" rel="product-images"
								href="${defines.publicUrl}/img/products/single5.jpg"></a> <img
								src="${defines.publicUrl}/img/products/single5.jpg"
								data-large="${defines.publicUrl}/img/products/single5.jpg" alt="" /></li> --%>
						</ul>
						<div class="product-arrows">
							<div class="left-arrow">
								<i class="icons icon-left-dir"></i>
							</div>
							<div class="right-arrow">
								<i class="icons icon-right-dir"></i>
							</div>
						</div>
					</div>
				</div>
				<!-- /Product Images Carousel -->


				<div class="col-lg-7 col-md-7 col-sm-7 product-single-info">
					<br>
					<h2>${objPK.sanpham.tensanpham}</h2>
					<div class="rating-box">
						<br><br>
						<span>${objPK.sanpham.luotxem} Lượt xem</span>
					</div>

					<span class="price">Giá: ${formatNumber.formatNumber(objPK.sanpham.gia)} VNĐ</span>

					<table class="product-actions-single">
						<tr>
							<td>Số lượng:</td>
							<td>
								<div class="numeric-input">
									<input type="text" value="1" id="item_number"> <span class="arrow-up"><i
										class="icons icon-up-dir"></i></span> <span class="arrow-down"><i
										class="icons icon-down-dir"></i></span>
								</div> 
								<a href="javascript:void(0)" onclick="return addCart(${objPK.sanpham.id}, ${objPK.sanpham.gia})"> 
									<span class="add-to-cart"> 
										<span class="action-wrapper"> <i class="icons icon-basket-2"></i>
											<span class="action-name">Thêm vào giỏ hàng</span>
										</span>
									</span>
								</a>
							</td>
						</tr>
					</table>

				</div>

			</div>

		</div>
		<!-- /Product -->


		<!-- Product Tabs -->
		<div class="row">

			<div class="col-lg-12 col-md-12 col-sm-12">

				<div class="tabs">

					<div class="tab-heading">
						<a href="#tab2" class="button big">Đánh giá chi tiết</a> 
					</div>

					<div class="page-content tab-content">
						<div id="tab1">
							${objPK.danhgia}
						</div>

					</div>

				</div>

			</div>

		</div>
		<!-- /Product Tabs -->

	</div>

</section>

<!-- <script type="text/javascript">
function addCart(name, C){
	/* alert('${pageContext.request.contextPath}/addCart'); */
	$.ajax({
		url: '${pageContext.request.contextPath}/addCart',
		type: 'POST',
		cache: false,
		data: {
			san_pham: name, 
			: C
		},
		success: function(data){
			$("#add-cart").html(data);
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	});
	return false;
}
</script> -->