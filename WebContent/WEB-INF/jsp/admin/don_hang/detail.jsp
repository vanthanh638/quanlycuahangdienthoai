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
											<c:forEach items="${listProduct}" var="objProduct">
												<tr>
													<td>
														${objProduct.san_pham}
													</td>
													
													<td>
														<img alt="" src="${pageContext.request.contextPath}/files/${objProduct.picture}"> 
													</td>
													<td>
														${objProduct.gia}
													</td>
													<td>
														${objProduct.so_luong}
													</td>
													<td>
														${objProduct.gia * objProduct.so_luong}
													</td>
												</tr>
											</c:forEach>
										</table>
										<div class="col-lg-3 col-md-3 col-sm-3">
											<div class="add-green">
												<a href="${pageContext.request.contextPath}/admincp/don-hang/del/${id_dh}" onclick="return confirm('Bạn có muốn xóa...!')">
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