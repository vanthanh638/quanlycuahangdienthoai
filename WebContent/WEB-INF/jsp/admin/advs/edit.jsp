<%@ page language="java" contentType="text/html; charset=UTF-88"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <div class="carousel-heading no-margin">
                                <h3>Sửa hãng sản xuất</h3>
                            </div>
                            
                            <div class="page-content">
                            	<form action="${pageContext.request.contextPath}/admin/quang-cao/edit/${objQC.id}" method="post" enctype="multipart/form-data">
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<form:errors path="objQC.ten" cssStyle="color:red"></form:errors>
	                                    </div>	
	                                </div>
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Tên</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="ten" value="${objQC.ten}">
	                                    </div>	
	                                </div>
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<form:errors path="objQC.lienket" cssStyle="color:red"></form:errors>
	                                    </div>	
	                                </div>
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Link</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="lienket" value="${objQC.lienket}">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	Hình ảnh
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="file" name="picture_add">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    </div>
	                                    <c:if test="${objQC.hinhanh != null}">
		                                    <div class="col-lg-9 col-md-9 col-sm-9">
												<img alt="" src="${pageContext.request.contextPath}/files/${objQC.hinhanh}" width="180">
		                                    </div>	
	                                    </c:if>
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-12 col-md-12 col-sm-12">
	                                    	<input class="big" type="submit" value="Cập nhật">
	                                        <input class="big" type="reset" value="Cancel">
	                                    </div>
	                                    
	                                </div>
                                </form>
                            </div>
                            
                    	</div>
                          
                    </div>
                        
                    
				</section>