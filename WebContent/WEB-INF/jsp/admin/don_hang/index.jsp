<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading">
                                <h4>Quản lý đơn hàng</h4>
                            </div>
                            
                        </div>
                        
                    </div>
                    
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                    	 	<c:choose>
								<c:when test="${param['msg'] eq 'delOK'}">
									<div>
										<span style="color: blue;">Xóa thành công</span>
									</div>
								</c:when>
								<c:when test="${param['msg'] eq 'delErr'}">
									<div>
										<span style="color: red;">Xóa thất bại</span>
									</div>
								</c:when>
							</c:choose>
                    	 </div>
                         <div class="col-lg-12 col-md-12 col-sm-12">
							
							<div class="tabs">
                                <div class="tab-content no-padding">
                                	
                                    <div id="tab1">
										<table class="orderinfo-table">
											<tr>
												<th>Họ tên</th>
												<th>Địa chỉ</th>
												<th>Điện thoại</th>
												<th>Ngày tạo</th>
												<th>HT thanh toán</th>
												<th>Trạng thái</th>
												<th>Chi tiết</th>
											</tr> 
											<c:forEach items="${listDonHang}" var="objDonHang">
												<tr>
													<td>
														${objDonHang.hoten}
													</td>
													
													<td>
														${objDonHang.diachi}
													</td>
													<td>
														${objDonHang.sodienthoai}
													</td>
													<td>
														${objDonHang.ngaykhoitao}
													</td>
													<td>
														${objDonHang.thanhToan.ten}
													</td>
													<td id="tt-${objDonHang.id}">
														<c:choose>
															<c:when test="${objDonHang.trangthai == 0}">
																<a href="javascript:void(0);" onclick="return xacnhan('${objDonHang.id}')"><span class="price small">Xác nhận</span></a>
															</c:when>
															<c:otherwise>
																<a  href="javascript:void(0);"><span class="price small">Đã xác nhận</span></a>
															</c:otherwise>
														</c:choose>
														
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/admin/don-hang/chi-tiet-don-hang/${objDonHang.id}"><span class="price small">Chi tiết</span></a>
														||
														<a href="${pageContext.request.contextPath}/admin/don-hang/del/${objDonHang.id}" onclick="return confirm('Bạn có muốn xóa...!')"><span class="price">Xóa</span></a>
													</td> 
												</tr>
											</c:forEach>
										</table>
										<div class="col-lg-12 col-md-6 col-sm-6">
				                            <div class="pagination">
				                            	<c:if test="${page>1}">
				                            		<a href="${pageContext.request.contextPath}/admin/don-hang?page=${page-1}"><div class="previous"><i class="icons icon-left-dir"></i></div></a>
				                            	</c:if>
				                            	<c:forEach var="i" begin="1" end="${sumPage}" >
				                                	<c:choose>
				                            			<c:when test="${page==i}">
				                            				<a class="active-page" href="${pageContext.request.contextPath}/admin/don-hang?page=${i}"><div class="page-button">${i}</div></a>
				                            			</c:when>
				                            			<c:otherwise>
				                            			<a href="${pageContext.request.contextPath}/admin/don-hang?page=${i}"><div class="page-button">${i}</div></a>
				                            			</c:otherwise>
				                            		</c:choose>
				                                </c:forEach>
				                                <c:if test="${page<sumPage}">
				                           			<a href="${pageContext.request.contextPath}/admin/don-hang?page=${page+1}"><div class="next"><i class="icons icon-right-dir"></i></div></a>
				                           		</c:if>
			                           		 </div>
                                    	</div>
								</div>
                            </div>
							
                        </div>
                        
                    </div>
                    </div>
				</section>
				
<script type="text/javascript">
function xacnhan(id){
	$.ajax({
		url: '${pageContext.request.contextPath}/admin/don-hang/xac-nhan',
		type: 'POST',
		cache: false,
		data: {
			did: id, 
		},
		success: function(data){
			
			$("#tt-" + id).html(data);
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	});
	return false;
}
</script>