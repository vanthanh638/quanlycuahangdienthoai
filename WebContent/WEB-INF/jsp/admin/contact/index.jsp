<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
					
                    <div class="row">
                    
                        <!-- Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            
                            <div class="carousel-heading">
                                <h4>Quản lý hãng sản xuất</h4>
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
							<table class="order-table">
                            	
								<tr>
									<th style="text-align: center;">ID</th>
									<th style="text-align: center;">Họ tên</th>
									<th style="text-align: center;">Email</th>
									<th style="text-align: center;">Điện thoại</th>
									<th style="text-align: center;">Chức năng</th>
								</tr>
								<c:forEach items="${listContact}" var="objContact">
									<tr>
										<td><p>${objContact.id}</p></td>
										<td class="order-number"><p><a href="#">${objContact.name}</a></p>
										<td class="order-number"><p><a href="#">${objContact.email}</a></p>
										<td class="order-number"><p><a href="#">${objContact.phone}</a></p>
										</td>
										<td style="text-align: center;">
											<p>
												<a href="${pageContext.request.contextPath}/admincp/lien-he/detail/${objContact.id}"><span class="price">Chi tiết</span></a>
												||
												<a href="${pageContext.request.contextPath}/admincp/lien-he/del/${objContact.id}" onclick="return confirm('Bạn có muốn xóa...!')"><span class="price">Xóa</span></a>
											</p>
										</td>
									</tr>   
								</c:forEach>
							</table>
							<div class="col-lg-12 col-md-6 col-sm-6">
                            <div class="pagination">
                            	<c:if test="${page>1}">
                            		<a href="${pageContext.request.contextPath}/admincp/lien-he?page=${page-1}"><div class="previous"><i class="icons icon-left-dir"></i></div></a>
                            	</c:if>
                            	<c:forEach var="i" begin="1" end="${sumPage}" >
                                	<c:choose>
                            			<c:when test="${page==i}">
                            				<a class="active-page" href="${pageContext.request.contextPath}/admincp/lien-he?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:when>
                            			<c:otherwise>
                            			<a href="${pageContext.request.contextPath}/admincp/lien-he?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:otherwise>
                            		</c:choose>
                                </c:forEach>
                                <c:if test="${page<sumPage}">
                           			<a href="${pageContext.request.contextPath}/admincp/lien-he?page=${page+1}"><div class="next"><i class="icons icon-right-dir"></i></div></a>
                           		</c:if>
                            </div>
                        </div>
								
                        </div>
                        
                    </div>
                        
                    
				</section>