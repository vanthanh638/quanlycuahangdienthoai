<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">                        
                    <div class="row">                
                    	<!-- Heading -->
						<div class="col-lg-12 col-md-12 col-sm-12">						
							<div class="carousel-heading">
								<h4>Điện thoại</h4>
							</div>						
						</div>
						<!-- /Heading -->                                                             
                    </div>
                    
                   <div class="row"> 
                        <c:forEach items="${listPK}" var="objPK">
	                        <!-- Product Item -->
	                        <div class="col-lg-4 col-md-4 col-sm-4 product">
	                            
	                            <div class="product-image">
	                                <img src="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}" alt="" height="250">
	                                <a href="${pageContext.request.contextPath}/phu-kien/${slug.makeSlug(objPK.sanpham.tensanpham)}-pk${objPK.id}" class="product-hover">
															<i class="icons icon-eye-1"></i> Xem ngay
														</a>
	                            </div>
	                            
	                            <div class="product-info">
	                                <h5><a href="${pageContext.request.contextPath}/phu-kien/${slug.makeSlug(objPK.sanpham.tensanpham)}-pk${objPK.id}">${objPK.sanpham.tensanpham}</a></h5>
	                                <span class="price">${formatNumber.formatNumber(objPK.sanpham.gia)} VNĐ</span>
	                            </div>
	                            
	                            <div class="product-actions" onClick="return addCart(${objPK.sanpham.id}, ${objPK.sanpham.gia})">
									<span class="add-to-cart">
                                         <span class="action-wrapper">
                                             <i class="icons icon-basket-2"></i>
                                             <span class="action-name">Thêm vào giỏ hàng</span>
                                         </span >
                                     </span>
								</div>
	                            
	                        </div>
	                        <!-- Product Item -->
                        </c:forEach>
                                               
                        <div class="col-lg-12 col-md-6 col-sm-6">
                            <div class="pagination">
                            	<c:if test="${page>1}">
                            		<a href="${pageContext.request.contextPath}/phu-kien?page=${page-1}"><div class="previous"><i class="icons icon-left-dir"></i></div></a>
                            	</c:if>
                            	<c:forEach var="i" begin="1" end="${sumPage}" >
                                	<c:choose>
                            			<c:when test="${page==i}">
                            				<a class="active-page" href="${pageContext.request.contextPath}/phu-kien?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:when>
                            			<c:otherwise>
                            			<a href="${pageContext.request.contextPath}/phu-kien?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:otherwise>
                            		</c:choose>
                                </c:forEach>
                                <c:if test="${page<sumPage}">
                           			<a href="${pageContext.request.contextPath}/phu-kien?page=${page+1}"><div class="next"><i class="icons icon-right-dir"></i></div></a>
                           		</c:if>
                            </div>
                        </div>
                        
                    </div>
					
					
						
				</section>