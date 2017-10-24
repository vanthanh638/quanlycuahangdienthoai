<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading">
                                <h4>Giỏ hàng của bạn</h4>
                                <div class="carousel-arrows">
									<a href="javaScript:window.history.back();"><i class="icons icon-reply"></i></a>
								</div>
                            </div>
                            
                            
                        </div>
                        
                    </div>
                    
                    <div class="row">
                        
                         <div class="col-lg-12 col-md-12 col-sm-12">
							
							
							<div class="tabs">
                                <div class="tab-content no-padding">
                                	
                                    <div id="tab1">
										<c:choose>
											<c:when test="${cart.total() > 0}">
											<input type="hidden" name="total" id="total" value="${cart.total()}">
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
														<td>
															${objProduct.sanpham.tensanpham}
														</td>
														<td>
															<img alt="" src="${pageContext.request.contextPath}/files/${objProduct.sanpham.hinhanh}" >
														</td>
														<td id="sgia-${i}">${formatNumber.formatNumber(objProduct.gia)}
															<input type="hidden" id="gia-${i}" value="${objProduct.gia}">
														</td>
														<td>
															<input width="50" type="text" name="so_luong" value="${objProduct.soluong}" id="sl-${i}" onchange="checkSL(${i}, ${objProduct.soluong})">
															
														</td>
														<td id="tong-${i}">${formatNumber.formatNumber(objProduct.gia * objProduct.soluong)}</td>
														<td>
															<a href="${pageContext.request.contextPath}/cart/del/${i}" onclick="return confirm('Bạn có muốn xóa sản phẩm..!')"><span class="price big">Xóa</span></a>
														</td>
													</tr>
												</c:forEach>
												<tr>
													<td class="align-right" colspan="4"><span class="price big">Thành tiền</span></td>
													<td><span class="price big" colspan="2">${formatNumber.formatNumber(cart.tongTien())}</span></td>
												</tr>
											</table>
											
											<div class="col-lg-9 col-md-9 col-sm-9">
												<input type="hidden" name="array_sl" value="">
												<div class="cap-nhat">
													<input type="button" value="Cập nhật" onclick="return capNhat(${cart.total()})" id="cap-nhat">
												</div>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<div class="add-green">
													<a href="${pageContext.request.contextPath}/thanh-toan">
														Thanh toán
													</a>
												</div>
											</div>
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
                    
				</section>
				
<script type="text/javascript">
	function capNhat(total) {
		var array_sl = [];
		for (var i = 0; i< total; i++){
			array_sl[i] = $("#sl-" + i).val();
		}
		console.log(array_sl);

		/* alert('${pageContext.request.contextPath}/addCart'); */
		/* $.ajax({
			url : '${pageContext.request.contextPath}/cart-cap-nhat',
			type : 'POST',
			cache : false,
			data : {
				tong : toal,
				array : array_sl,
			},
			success : function(data) {
				$("#sl-").html(data);
			},
			error : function() {
				alert('Có lỗi xảy ra');
			}
		}); */
		window.location="${pageContext.request.contextPath}/cart-cap-nhat/"+array_sl;
	}
	function checkSL(id, sl) {
		var soluong;
		soluong = $('#sl-'+id).val();
		/* var gia =  $('#gia-'+id).val();
		var tong = gia * soluong;
		$('#tong-'+id).text(tong); */
		var re = /^\d+$/;
		if(soluong == ''){
			alert("Số lượng không được bỏ trống");
			$('#sl-'+id).val(sl);
		}else if((!re.test(soluong)) || soluong == 0){
			alert("Số lượng phải là số nguyên và lớn hơn không");
			$('#sl-'+id).val(sl);
		}
		
	}
</script>