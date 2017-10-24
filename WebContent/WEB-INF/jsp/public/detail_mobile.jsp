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
								src="${pageContext.request.contextPath}/files/${objMobile.sanpham.hinhanh}"
								data-large="${pageContext.request.contextPath}/files/${objMobile.sanpham.hinhanh}" alt="" /> <a
								class="fullscreen-button" href="${pageContext.request.contextPath}/files/${objMobile.sanpham.hinhanh}">
									<div class="product-fullscreen">
										<i class="icons icon-resize-full-1"></i>
									</div>
							</a></li>
						</ul>
					</div>
					<div id="product-carousel">
						<ul class="slides">
							<li><a class="fancybox" rel="product-images"
								href="${pageContext.request.contextPath}/files/${objMobile.sanpham.hinhanh}"></a> <img
								src="${pageContext.request.contextPath}/files/${objMobile.sanpham.hinhanh}"
								data-large="${pageContext.request.contextPath}/files/${objMobile.sanpham.hinhanh}" alt="" />
							</li>
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
					<h2>${objMobile.sanpham.tensanpham}</h2>
					<div class="rating-box">
						<br>
						<br>
						<!-- <div class="rating readonly-rating" data-score="4"></div> -->
						<span style="margin-left: 10px">${objMobile.sanpham.luotxem} Lượt xem</span>
					</div>

					<span class="price">Giá: ${formatNumber.formatNumber(objMobile.sanpham.gia)} VNĐ</span>

					<table class="product-actions-single">
						<tr>
							<td>Số lượng:</td>
							<td>
								<div class="numeric-input">
									<input type="text" id="item_number" value="1" name="number"> <span class="arrow-up"><i
										class="icons icon-up-dir"></i></span> <span class="arrow-down"><i
										class="icons icon-down-dir"></i></span>
								</div> 
								<a href="javascript:void(0)" onclick="return addCart(${objMobile.sanpham.id}, ${objMobile.sanpham.gia})"> 
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
						<a href="#tab1" class="button big">Cấu hình</a> 
						<a href="#tab2" class="button big">Đánh giá chi tiết</a> 
					</div>

					<div class="page-content tab-content">
						<div id="tab1">
							<table class='charactestic_table' border="0" cellpadding="2px"
								width="100%">
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Kích thước</td>
									<td class='content_charactestic'>
										${objMobile.kichco}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Băng tần</td>
									<td class='content_charactestic'>
										${objMobile.bangtan}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Chip đồ họa</td>
									<td class='content_charactestic'>
										${objMobile.chip}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">CPU</td>
									<td class='content_charactestic'>
										${objMobile.cpu}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Bộ nhớ trong</td>
									<td class='content_charactestic'>
										${objMobile.memory}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Ram</td>
									<td class='content_charactestic'>
										${objMobile.ram}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Bluetooth</td>
									<td class='content_charactestic'>
										${objMobile.bluetooth}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Wlan</td>
									<td class='content_charactestic'>
										${objMobile.wlan}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">GPS</td>
									<td class='content_charactestic'>
										${objMobile.gps}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Pin</td>
									<td class='content_charactestic'>
										${objMobile.pin}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Màn hình</td>
									<td class='content_charactestic'>
										${objMobile.manhinh}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Sim</td>
									<td class='content_charactestic'>
										${objMobile.sim}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Camera trước</td>
									<td class='content_charactestic'>
										${objMobile.cameratruoc}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Camera sau</td>
									<td class='content_charactestic'>
										${objMobile.camerasau}
									</td>
								</tr>
								<tr class="tr-0">
									<td class='title_charactestic' width="20%">Quay phim</td>
									<td class='content_charactestic'>
										${objMobile.quayphim}
									</td>
								</tr>
							</table>
						</div>

						<div id="tab2">
							${objMobile.danhgia}
						</div>

					</div>

				</div>

			</div>

		</div>
		<!-- /Product Tabs -->

	</div>

</section>

<!-- <script type="text/javascript">
function addCart(name, giaC){
	/* alert('${pageContext.request.contextPath}/addCart'); */
	$.ajax({
		url: '${pageContext.request.contextPath}/addCart',
		type: 'POST',
		cache: false,
		data: {
			san_pham: name, 
			gia: giaC
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