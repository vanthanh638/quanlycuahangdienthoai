<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading">
                                <h4>Chi tiết đơn hàng</h4>
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
											<c:forEach items="${donhang.chiTietDonHangs}" var="chithiet">
												<tr>
													<td>
														${chithiet.sanpham.tensanpham}
													</td>
													
													<td>
														<img alt="" src="${pageContext.request.contextPath}/files/${chitiet.sanpham.hinhanh}"> 
													</td>
													<td>
														${chithiet.soluong}
													</td>
													<td>
														${chithiet.gia}
													</td>
													<td>
														${chithiet.soluong * chithiet.gia}
													</td>
												</tr>
											</c:forEach>
										</table>
										<div class="col-lg-3 col-md-3 col-sm-3">
											<div class="add-green">
												<a href="${pageContext.request.contextPath}/admin/don-hang/del/${donhang.id}" onclick="return confirm('Bạn có muốn xóa...!')">
													Xóa đơn hàng
												</a>
											</div>
										</div>
                                    </div>
                                    
								</div>
                            </div>
							
                        </div>
                        
                    </div>
                    
				</section>