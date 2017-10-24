<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading">
                                <h4>Đơn hàng của bạn</h4>
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
												<th>Họ tên</th>
												<th>Địa chỉ</th>
												<th>Ngày tạo</th>
												<th>HT thanh toán</th>
												<th>Chi tiết</th>
											</tr> 
											<c:forEach items="${donHang}" var="objDonHang">
												<tr>
													<td>
														${objDonHang.hoten}
													</td>
													<td>
														${objDonHang.diachi}
													</td>
													<td>
														${objDonHang.ngaykhoitao}
													</td>
													<td>
														${objDonHang.thanhToan.ten}
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/chi-tiet-don-hang/${objDonHang.id}"><span class="price big">Chi tiết</span></a>
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