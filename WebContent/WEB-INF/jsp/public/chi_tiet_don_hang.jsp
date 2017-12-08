<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading">
                                <h4>Chi tiết đơn hàng của bạn</h4>
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
										<table class="orderinfo-table">
											<tr>
												<th>Sản phẩm</th>
												<th>Hình ảnh</th>
												<th>Giá</th>
												<th>Số lượng</th>
												<th>Thành tiền</th>
											</tr> 
											<c:forEach items="${donhang.chiTietDonHangs}" var="obj">
												<tr>
													<td>
														${obj.sanpham.tensanpham}
													</td>
													
													<td>
														<img alt="" src="${pageContext.request.contextPath}/files/${obj.sanpham.tensanpham}"> 
													</td>
													<td>
														${obj.gia}
													</td>
													<td>
														<c:choose>
															<c:when test="${donhang.trangthai == 0}">
																<input width="50" type="text" name="so_luong" 
																	value="${obj.soluong}" id="sl-${donhang.chiTietDonHangs.indexOf(obj)}" 
																	onchange="checkSL(${obj.id}, ${obj.soluong})">
															</c:when>
															<c:otherwise>
																${obj.soluong}
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														${obj.gia * obj.soluong}
													</td>
												</tr>
											</c:forEach>
										</table>
                                    </div>
								</div>
                            </div>
							
                        </div>
                        
                        <c:choose>
                        	<c:when test="${donhang.trangthai == 0}">
                        		<div class="col-lg-3 col-md-3 col-sm-3">
									<div class="add-green">
										<a href="javascript: void(0)" onclick="return capNhat(${donhang.chiTietDonHangs.size()}, ${donhang.id})">
											Cập nhật
										</a>
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3">
									<div class="add-green">
										<a href="${pageContext.request.contextPath}/xoa-don-hang">
											Xóa
										</a>
									</div>
								</div>
                        	</c:when>
                        	<c:otherwise>
                        		<div class="col-lg-12 col-md-12 col-sm-12">
		                        	<span style="color: red">Đơn hàng đã được xác nhận.</span>
		                        </div>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                    
				</section>
				
<script type="text/javascript">
	function capNhat(total, id) {
		var array_sl = [];
		for (var i = 0; i< total; i++){
			array_sl[i] = $("#sl-" + i).val();
			alert(array_sl[i])
		}
		console.log(array_sl);
		
		window.location="${pageContext.request.contextPath}/cap-nhat-don-hang/"+id + "/"+array_sl;
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