<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">
                  
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="carousel-heading">
                                <h4>Tài khoản của bạn</h4>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                    	<c:when test="${objUser != null}">
	                    	<div class="row">
	                    	
		                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
		                        	
		                            <form action="${pageContext.request.contextPath}/edit-account/${objUser.id}" method="post" id="frmLogin">
			                            <div class="page-content">
			                            	<div class="row">
			                                    
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Tài khoản*</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="username" value="${objUser.username}" disabled="disabled">
			                                    </div>	
			                                    
			                                </div>
			                                
			                                <!-- <div class="row">
			                                    
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Password</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="password" name="password">
			                                    </div>	
			                                    
			                                </div>
			                                
			                                <div class="row">
			                                    
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Nhập lại Password</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="password" name="re_password">
			                                    </div>	
			                                    
			                                </div> -->
			                            	
			                                <div class="row">
			                                    
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Họ tên*</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="fullname" value="${objUser.tendaydu}">
			                                    </div>	
			                                    
			                                </div>
			                                
			                                <div class="row">
			                                    
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Địa chỉ</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="address" value="${objUser.diachi}">
			                                    </div>	
			                                    
			                                </div>
			                                
			                                <div class="row">
			                                    
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Điện thoại</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="phone" value="${objUser.sodienthoai}">
			                                    </div>	
			                                    
			                                </div>
			                                
			                                <div class="row">
			                                    <div class="col-lg-12 col-md-12 col-sm-12">
			                                    	<input class="big" type="submit" value="Cập nhật">
			                                        <input class="big" type="reset" value="Cancel">
			                                    </div>
			                                    
			                                </div>
			                                
			                            </div>
		                            </form>
		                    	</div>
		                          
		                    </div>
                    	</c:when>
                    	<c:otherwise>
		                    <div class="row">
		                    	
		                        <div class="col-lg-12 col-md-12 col-sm-12">
		                            <div class="page-content">
		                            	<c:choose>
		                            	<c:when test="${param['msg'] eq 'creatOK'}">
		                            		<p>Bạn đã đăng ký thành công, mời bạn đăng nhập để tiếp tục</p>
		                            		<br>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<p>Nếu bạn đã đăng ký, vui lòng đăng nhập trực tiếp tại đây</p>
		                            		<br>
		                            	</c:otherwise>
		                            	</c:choose>
		                            	<c:choose>
		                            		<c:when test="${param['msg'] eq 'loginErr'}">
		                            			<p style="color: red;"> Sai username hoặc password</p><br>
		                            		</c:when>
		                            		<c:when test="${param['msg'] eq 'errUP'}">
		                            			<p style="color: red;"> Nhập đầy đủ username và password</p>
		                            			<br>
		                            		</c:when>
		                            	</c:choose>
		                            	<form action="${pageContext.request.contextPath}/account" method="post" id="frmLogin">
			                               	 <div class="row">
			                                	<div class="col-lg-6 col-md-6 col-sm-6">
			                                    	<div class="iconic-input">
			                                            <input type="text" placeholder="Username" name="username">
			                                            <i class="icons icon-user-3"></i>
			                                        </div>
			                                    </div>
			                                    
			                                    <div class="col-lg-6 col-md-6 col-sm-6">
			                                    	<div class="iconic-input">
			                                            <input type="password" placeholder="Password" name="password">
			                                            <i class="icons icon-lock"></i>
			                                        </div>
			                                    </div>
			                                    
			                                </div>
			                                
			                                <br/>
			                                <div class="row">
			                                	<div class="col-lg-6 col-md-6 col-sm-6 align-left">
			                                    	<input type="submit" class="orange" value="Đăng nhập">
			                                    </div>
			                                </div>
		                                </form>
		                            </div>
		                            
		                    	</div>
		                          
		                    </div>
		                    
		                    <div class="row">
		                        <div class="col-lg-12 col-md-12 col-sm-12">
		                            <div class="carousel-heading">
		                                <h4>Đăng ký</h4>
		                            </div>
		                        </div>
		                    </div>
		                    
		                    
		                    <div class="row">
		                    	
		                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
		                        	
		                            <!-- <div class="carousel-heading no-margin">
		                                <h3>Đăng ký</h3>
		                            </div> -->
		                            <form action="${pageContext.request.contextPath}/dang-ky" method="post" id="frm-add-account">
			                            <div class="page-content">
			                                
			                            	<div class="row">
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Tài khoản (*)</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="username">
			                                    </div>	
			                                </div>
			                                <br>

			                                <div class="row">
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Password (*)</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="password" name="password" id="password">
			                                    </div>	
			                                </div>
			                                
			                                <br>
			                                <div class="row">
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Nhập lại Password (*)</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="password" name="re_password">
			                                    </div>	
			                                </div>
			                            	
			                                <br>
			                                <div class="row">
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Họ tên(*)</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="fullname">
			                                    </div>	
			                                </div>
			                                
			                                <br>
			                                <div class="row">
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Địa chỉ</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="address">
			                                    </div>	
			                                </div>
			                                
			                                <br>
			                                <div class="row">
			                                    <div class="col-lg-3 col-md-3 col-sm-3">
			                                    	<p>Điện thoại</p>
			                                    </div>
			                                    <div class="col-lg-9 col-md-9 col-sm-9">
			                                    	<input type="text" name="phone">
			                                    </div>	
			                                </div>
			                                
			                                <div class="row">
			                                    <div class="col-lg-12 col-md-12 col-sm-12">
			                                    	<input class="big" type="submit" value="Đăng ký">
			                                        <input class="big" type="reset" value="Cancel">
			                                    </div>
			                                    
			                                </div>
			                                
			                            </div>
		                            </form>
		                    	</div>
		                          
		                    </div>
	                    </c:otherwise>
                    </c:choose>    
                    
				</section>
				
<script type="text/javascript">
	
</script>