<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp"%>
<section class="main-content col-lg-9 col-md-9 col-sm-9">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="carousel-heading">
				<h4>Thông tin của bạn</h4>
				<div class="carousel-arrows">
					<a href="javaScript:window.history.back();"><i
						class="icons icon-reply"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 register-account">
			<div class="page-content">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<p>Họ tên</p>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9">
						<p>${objUser.tendaydu}</p>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<p>Địa chỉ</p>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9">
						<p>${objUser.diachi}</p>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<p>Điện thoại</p>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9">
						<p>${objUser.sodienthoai}</p>
					</div>
				</div>

				<%-- <div class="row">
					<div class="col-lg-3 col-md-3 col-sm-3">
						<p>Thông tin thêm</p>
					</div>
					<div class="col-lg-9 col-md-9 col-sm-9">
						<p>${objCustomer.tt_them}</p>
					</div>
				</div> --%>
			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="carousel-heading">
				<h4>Giỏ hàng của bạn</h4>
			</div>
		</div>
	</div>
	<!-- gio hang -->
	<div class="row">

		<div class="col-lg-12 col-md-12 col-sm-12">


			<div class="tabs">
				<div class="tab-content no-padding">

					<div id="tab1">
						<c:choose>
							<c:when test="${cart.total() > 0}">
								<table class="orderinfo-table">

									<tr>
										<th>Tên sản phẩm</th>
										<th>Hình ảnh</th>
										<th>Giá</th>
										<th>Số lượng</th>
										<th>Tổng tiền</th>
										<th>Xóa</th>
									</tr>
									<c:forEach begin="0" end="${cart.total()-1}" var="i">
										<c:set var="objProduct" value="${cart.getItem(i)}"></c:set>
										<tr>
											<td>${objProduct.sanpham.tensanpham}</td>
											<td><img alt=""
												src="${pageContext.request.contextPath}/files/${objProduct.sanpham.hinhanh}">
											</td>
											<td>${formatNumber.formatNumber(objProduct.sanpham.gia)}</td>
											<td>${objProduct.soluong}</td>
											<td>${formatNumber.formatNumber(objProduct.gia * objProduct.soluong)}</td>
											<td><a
												href="${pageContext.request.contextPath}/cart/del/${objProduct.sanpham.tensanpham}"
												onclick="return confirm('Bạn có muốn xóa sản phẩm..!')"><span
													class="price big">Xóa</span></a></td>
										</tr>
									</c:forEach>
									<tr>
										<td class="align-right" colspan="4"><span
											class="price big">Thành tiền</span></td>
										<td><span class="price big">${formatNumber.formatNumber(cart.tongTien())}
												VNĐ</span></td>
									</tr>
								</table>

								<div class="col-lg-9 col-md-9 col-sm-9"></div>
							</c:when>
							<c:otherwise>
								Giỏ hàng trống
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

		</div>

	</div>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="carousel-heading">
				<h4>Chọn hình thức thanh toán</h4>
			</div>
		</div>
	</div>

	<div class="row">

		<div class="col-lg-12 col-md-12 col-sm-12">
			<div class="page-content">
				<table style="margin: auto; border: 0">
					<tr>
						<td>Thanh toán qua ví điện tử Ngân Lượng</td>
						<td>
							<form action="https://www.nganluong.vn/button_payment.php" method="post">
								<input type="hidden" name="receiver" value="vanthanh638x11@gmail.com"> 
								<input type="hidden" name="product_name" value="${rd}"> 
								<input type="hidden" name="price" value="${cart.tongTien()}">
								<input type="hidden" name="return_url" value="diachitrave">
								<input type="hidden" name="comments" value="Thanh toán đơn hàng Mobile shop"> <input
									type="image"
									src="https://www.nganluong.vn/css/newhome/img/button/pay-sm.png">
							</form>
						</td>
					</tr>
					<tr>
						<td>Thanh toán qua ví điện tử Bảo Kim</td>
						<td>
						<a href="https://www.baokim.vn/payment/product/version11?business=vanthanh638x11%40gmail.com&id=&order_description=&product_name=KH${objUser.tendaydu}&product_price=${cart.tongTien()}&product_quantity=2&total_amount=${cart.tongTien()}&url_cancel=${pageContext.request.contextPath}&url_detail=&url_success=">
							<img src="http://www.baokim.vn/developers/uploads/baokim_btn/thanhtoan-m.png"
								alt="Thanh toán an toàn với Bảo Kim !" border="0"
								title="Thanh toán trực tuyến an toàn dùng tài khoản Ngân hàng (VietcomBank, TechcomBank, Đông Á, VietinBank, Quân Đội, VIB, SHB,... và thẻ Quốc tế (Visa, Master Card...) qua Cổng thanh toán trực tuyến BảoKim.vn">
							</a>
						</td>
					</tr>
					<tr>
						<td>
							Thu tiền tận nhà - COD
						</td>
						<td>
							<div class="add-green">
								<a href="${pageContext.request.contextPath}/add-don-hang-ht4">
									Đặt hàng
								 </a>
							</div>
						</td>
					</tr>

				</table>
			</div>

		</div>

	</div>

</section>