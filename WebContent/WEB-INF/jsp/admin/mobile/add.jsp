<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <div class="carousel-heading no-margin">
                                <h3>Thêm điện thoại</h3>
                            </div>
                            
                            <div class="page-content">
                            	<form id="frmMobile" action="${pageContext.request.contextPath}/admin/mobile/add" method="post" enctype="multipart/form-data">
	                            	
	                            	<%-- <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<form:errors path="objMobile.name_mobile" cssStyle="color:red"></form:errors>
	                                    </div>	
	                                </div> --%>
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Tên điện thoại</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="tensanpham">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Loại sản phẩm</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<select name="id_loaisp">
	                                    		<c:forEach items="${listLSP}" var="lsp">
	                                    			<option value="${lsp.id_loaisanpham}">${lsp.tenloai}</option>
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
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Giá</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<%-- <form:errors path="objMobile.gia" cssStyle="color:red"></form:errors> --%>
	                                    	<input type="text" name="gia">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Số lượng</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<%-- <form:errors path="objMobile.gia" cssStyle="color:red"></form:errors> --%>
	                                    	<input type="text" name="soluongconlai">
	                                    </div>	
	                                </div>
	                            	
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Kích thước</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="kichco">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Băng tần</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="bangtan">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Chip đồ họa</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="chip">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>CPU</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="cpu">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Bộ nhớ trong</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="memory">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Ram</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="ram">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Bluetooth</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="bluetooth">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Wlan</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="wlan">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>GPS</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="gps">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Pin</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="pin">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Màn hình</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="manhinh">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Sim</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="sim">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Camera trước</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="cameratruoc">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Camera sau</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="camerasau">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Quay phim</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="quayphim">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Đánh giá</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<textarea rows="10" cols="" name="danhgia"></textarea>
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-12 col-md-12 col-sm-12">
	                                    	<input class="big" type="submit" value="Thêm">
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