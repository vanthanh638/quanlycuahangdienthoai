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
														${obj.soluong}
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
                        
                    </div>
                    
				</section>