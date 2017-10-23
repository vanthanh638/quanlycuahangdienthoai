<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <div class="carousel-heading no-margin">
                                <h3>Thêm phụ kiện</h3>
                            </div>
                            
                            <div class="page-content">
                            	<form action="${pageContext.request.contextPath}/admin/phu-kien/edit/${objPK.id}" method="post" enctype="multipart/form-data">
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<form:errors path="objPK.sanpham.tensanpham" cssStyle="color:red"></form:errors>
	                                    </div>	
	                                </div>
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Tên phụ kiện</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="tensanpham" value="${objPK.sanpham.tensanpham}">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Loại sản phẩm</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<select name="id_loaisp">
	                                    		<c:forEach items="${listLSP}" var="lsp">
	                                    			<c:if test="${lsp.id_cha != 0}">
	                                    				<c:choose>
		                                    				<c:when test="${lsp.id_loaisanpham == objPK.sanpham.loaiSanPham.id_loaisanpham}">
		                                    					<option selected="selected" value="${lsp.id_loaisanpham}">${lsp.tenloai}</option>
		                                    				</c:when>
		                                    				<c:otherwise>
		                                    					<option value="${lsp.id_loaisanpham}">${lsp.tenloai}</option>
		                                    				</c:otherwise>
		                                    			</c:choose>
	                                    				<option value="${lsp.id_loaisanpham}">${lsp.tenloai}</option>
	                                    			</c:if>
	                                    		</c:forEach>
	                                    	</select>
	                                    </div>
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Hình ảnh</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="file" name="hinhanh_add">
	                                    </div>	
	                                </div>
	                                
	                                <c:if test="${objPK.sanpham.hinhanh != null}">
	                                	<div class="row">
		                                    <div class="col-lg-3 col-md-3 col-sm-3">
		                                    	<p>Hình ảnh cũ</p>
		                                    </div>
		                                    <div class="col-lg-9 col-md-9 col-sm-9">
		                                    	<img alt="" src="${pageContext.request.contextPath}/files/${objPK.sanpham.hinhanh}" width="150">
		                                    </div>	
		                                </div>
	                                </c:if>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Giá</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="gia" value="${objPK.sanpham.gia}">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Số lương</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="soluongconlai" value="${objPK.sanpham.soluongconlai}">
	                                    </div>	
	                                </div>
	                            	
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Mô tả</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<textarea name="danhgia" class="danh_gia"> ${objPK.danhgia}</textarea>
	                                    </div>	
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
<script type="text/javascript">
	CKEDITOR.replace( 'danhgia',
		{
			filebrowserBrowseUrl : '/mobileShop/templates/public/ckfinder/ckfinder.html',
			filebrowserImageBrowseUrl : '/mobileShop/templates/public/ckfinder/ckfinder.html?type=Images',
			filebrowserFlashBrowseUrl : '/mobileShop/templates/public/ckfinder/ckfinder.html?type=Flash',
			filebrowserUploadUrl : '/mobileShop/templates/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
			filebrowserImageUploadUrl : '/mobileShop/templates/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
			filebrowserFlashUploadUrl : '/mobileShop/templates/public/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
		});
</script>