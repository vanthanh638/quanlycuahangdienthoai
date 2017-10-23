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
												<th>ID </th>
												<th>Họ tên</th>
												<th>Địa chỉ</th>
												<th>Ngày tạo</th>
												<th>HT thanh toán</th>
												<th>Thông tin thêm</th>
												<th>Chi tiết</th>
											</tr> 
											<c:forEach items="${listDonHang}" var="objDonHang">
												<tr>
													<td>
														${objDonHang.id_don_hang}
													</td>
													
													<td>
														${objDonHang.fullname}
													</td>
													<td>
														${objDonHang.address}
													</td>
													<td>
														${objDonHang.date_creat}
													</td>
													<td>
														${objDonHang.hinh_thuc_tt}
													</td>
													<td>
														${objDonHang.tt_them}
													</td>
													<td>
														<a href="${pageContext.request.contextPath}/admincp/don-hang/chi-tiet-don-hang/${objDonHang.id_don_hang}"><span class="price big">Chi tiết</span></a>
														||
														<a href="${pageContext.request.contextPath}/admincp/don-hang/del/${objDonHang.id_don_hang}" onclick="return confirm('Bạn có muốn xóa...!')"><span class="price">Xóa</span></a>
													</td> 
												</tr>
											</c:forEach>
										</table>
										<div class="col-lg-12 col-md-6 col-sm-6">
				                            <div class="pagination">
				                            	<c:if test="${page>1}">
				                            		<a href="${pageContext.request.contextPath}/admincp/don-hang?page=${page-1}"><div class="previous"><i class="icons icon-left-dir"></i></div></a>
				                            	</c:if>
				                            	<c:forEach var="i" begin="1" end="${sumPage}" >
				                                	<c:choose>
				                            			<c:when test="${page==i}">
				                            				<a class="active-page" href="${pageContext.request.contextPath}/admincp/don-hang?page=${i}"><div class="page-button">${i}</div></a>
				                            			</c:when>
				                            			<c:otherwise>
				                            			<a href="${pageContext.request.contextPath}/admincp/don-hang?page=${i}"><div class="page-button">${i}</div></a>
				                            			</c:otherwise>
				                            		</c:choose>
				                                </c:forEach>
				                                <c:if test="${page<sumPage}">
				                           			<a href="${pageContext.request.contextPath}/admincp/don-hang?page=${page+1}"><div class="next"><i class="icons icon-right-dir"></i></div></a>
				                           		</c:if>
			                           		 </div>
                                    	</div>
								</div>
                            </div>
							
                        </div>
                        
                    </div>
                    </div>
				</section>