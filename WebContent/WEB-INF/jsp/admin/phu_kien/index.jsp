<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
					
                    <div class="row">
                    
                        <!-- Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            
                            <div class="carousel-heading">
                                <h4>Quản lý phụ kiện</h4>
                            </div>
                            
                        </div>
                        <!-- /Heading -->
                        
					</div>	
                    
                    
                    <div class="row">
                    	<div class="col-lg-12 col-md-12 col-sm-12">
                    	 	<c:choose>
								<c:when test="${param['msg'] eq 'addOK'}">
									<div>
										<span style="color: blue;">Thêm thành công</span>
									</div>
								</c:when>
								<c:when test="${param['msg'] eq 'addErr'}">
									<div>
										<span style="color: red;">Thêm thất bại</span>
									</div>
								</c:when>
								<c:when test="${param['msg'] eq 'editOK'}">
									<div>
										<span style="color: blue;">Sửa thành công</span>
									</div>
								</c:when>
								<c:when test="${param['msg'] eq 'editErr'}">
									<div>
										<span style="color: red;">Sửa thất bại</span>
									</div>
								</c:when>
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
                        	<div class="add-green">
								<a href="${pageContext.request.contextPath}/admin/phu-kien/add">
									Thêm phụ kiện
								</a>
							</div>
							<table class="order-table">
                            	
								<tr>
									<th>Tên phụ kiện</th>
									<th width="200">Hình ảnh</th>
									<th>Giá</th>
									<th>Số lượng</th>
									<th>Dã bán</th>
									<th>Chức năng</th>
								</tr>
								<c:forEach items="${listPK}" var="objPK">
									<tr>
										<td class="order-number"><p><a href="#">${objPK.sanpham.tensanpham}</a></p>
										<td style="text-align: center">
											<img src="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}" alt="" width="180">
										</td>
										<td>${objPK.sanpham.gia}</td>
										<td>${objPK.sanpham.soluongconlai}</td>
										<td>${objPK.sanpham.soluongdaban}</td>
										<td style="text-align: center">
											<p>
												<a href="${pageContext.request.contextPath}/admin/phu-kien/edit/${objPK.id}"><span class="price">Sửa</span></a>
												||
												<a href="${pageContext.request.contextPath}/admin/phu-kien/del/${objPK.id}" onclick="return confirm('Bạn có muốn xóa...?')"><span class="price">Xóa</span></a>
											</p>
										</td>
									</tr> 
								</c:forEach>  
							</table>
							
							<div class="col-lg-12 col-md-6 col-sm-6">
                            <div class="pagination">
                            	<c:if test="${page>1}">
                            		<a href="${pageContext.request.contextPath}/admincp/phu-kien?page=${page-1}"><div class="previous"><i class="icons icon-left-dir"></i></div></a>
                            	</c:if>
                            	<c:forEach var="i" begin="1" end="${sumPage}" >
                                	<c:choose>
                            			<c:when test="${page==i}">
                            				<a class="active-page" href="${pageContext.request.contextPath}/admincp/phu-kien?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:when>
                            			<c:otherwise>
                            			<a href="${pageContext.request.contextPath}/admincp/phu-kien?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:otherwise>
                            		</c:choose>
                                </c:forEach>
                                <c:if test="${page<sumPage}">
                           			<a href="${pageContext.request.contextPath}/admincp/phu-kien?page=${page+1}"><div class="next"><i class="icons icon-right-dir"></i></div></a>
                           		</c:if>
                            </div>
								
                        </div>
                        
                    </div>
                        
                    
				</section>