<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
					
                    <div class="row">
                    
                        <!-- Heading -->
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            
                            <div class="carousel-heading">
                                <h4>Quản lý slide</h4>
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
								<a href="${pageContext.request.contextPath}/admincp/slide/add">
									Thêm slide
								</a>
							</div>
							
							<table class="order-table">
                            	
								<tr>
									<th style="text-align: center;">ID</th>
									<th style="text-align: center;">Tiêu đề</th>
									<th style="text-align: center;" width="200">Hình ảnh</th>
									<th style="text-align: center;"> Kích hoạt</th>
									<th style="text-align: center;">Chức năng</th>
								</tr>
								<c:forEach items="${listSlide}" var="objSlide">
									<tr>
										<td><p>${objSlide.id}</p></td>
										<td class="order-number"><p><a href="#">${objSlide.name}</a></p>
										<td>
											<img src="${pageContext.request.contextPath}/files/${objSlide.picture}" alt="" width="180">
										</td>
										<td style="text-align: center;" id="active-${objSlide.id}">
											<a href="javascript:void(0);" onclick="return setActive(${objSlide.id}, ${objSlide.active})">
											<c:choose>
												<c:when test="${objSlide.active == 1}">
													<img src="${defines.publicUrl}/img/tick-circle.gif" alt="" />
												</c:when>
												<c:otherwise>
													<img src="${defines.publicUrl}/img/minus-circle.gif" alt="" />
												</c:otherwise>
											</c:choose>
											</a>
										</td>
										<td style="text-align: center;">
											<p>
												<a href="${pageContext.request.contextPath}/admincp/slide/edit/${objSlide.id}"><span class="price">Sửa</span></a>
												||
												<a href="${pageContext.request.contextPath}/admincp/slide/del/${objSlide.id}" onclick="return confirm('Bạn có muốn xóa...!')"><span class="price">Xóa</span></a>
											</p>
										</td>
									</tr>   
								</c:forEach>
							</table>
							<div class="col-lg-12 col-md-6 col-sm-6">
                            <div class="pagination">
                            	<c:if test="${page>1}">
                            		<a href="${pageContext.request.contextPath}/admincp/slide?page=${page-1}"><div class="previous"><i class="icons icon-left-dir"></i></div></a>
                            	</c:if>
                            	<c:forEach var="i" begin="1" end="${sumPage}" >
                                	<c:choose>
                            			<c:when test="${page==i}">
                            				<a class="active-page" href="${pageContext.request.contextPath}/admincp/slide?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:when>
                            			<c:otherwise>
                            			<a href="${pageContext.request.contextPath}/admincp/slide?page=${i}"><div class="page-button">${i}</div></a>
                            			</c:otherwise>
                            		</c:choose>
                                </c:forEach>
                                <c:if test="${page<sumPage}">
                           			<a href="${pageContext.request.contextPath}/admincp/slide?page=${page+1}"><div class="next"><i class="icons icon-right-dir"></i></div></a>
                           		</c:if>
                            </div>
                        </div>
								
                        </div>
                        
                    </div>
                    
				</section>
				
<script type="text/javascript">
function setActive(id, active){
	$.ajax({
		url: '${pageContext.request.contextPath}/admincp/slide/set-active',
		type: 'POST',
		cache: false,
		data: {
			sid: id, 
			sactive: active
		},
		success: function(data){
			
			$("#active-" + id).html(data);
		},
		error: function (){
			alert('Có lỗi xảy ra');
		}
	});
	return false;
}
</script>