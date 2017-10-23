<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <div class="carousel-heading no-margin">
                                <h4>Giới thiệu</h4>
                            </div>
                            
                            <div class="page-content">
                            	<form id="frmAbout" action="${pageContext.request.contextPath}/admincp" method="post">
	                            	<c:if test="${param['msg'] eq 'editOK'}">
	                            		<div class="row">
	                            			<div class="col-lg-12 col-md-12 col-sm-12">
	                            				<span style="color: blue"> Cập nhật thành công </span>
	                            			</div>
	                            		</div>
	                            	</c:if>
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Tiêu đề</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="title" value="${objAbout.title}">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Chi tiết</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
											<textarea rows="" cols="" name="content" class="content">${objAbout.content}</textarea>
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-12 col-md-12 col-sm-12">
	                                    	<input class="big" type="submit" value="Cập nhật">
	                                    </div>
	                                    
	                                </div>
                                </form>
                            </div>
                            
                    	</div>
                          
                    </div>
                    
				</section>
<script type="text/javascript">
	CKEDITOR.replace( 'content',
		{
			filebrowserBrowseUrl : '/mobileShop/templates/public/ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : '/mobileShop/templates/public/ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : '/mobileShop/templates/public/ckfinder/ckfinder.html?type=Flash',
			filebrowserUploadUrl : '/mobileShop/templates/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : '/mobileShop/templates/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : '/mobileShop/templates/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
		});
</script>