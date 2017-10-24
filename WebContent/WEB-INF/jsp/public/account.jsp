<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">
                  
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="carousel-heading">
                                <h4>Tài khoản của bạn</h4>
                                <div class="carousel-arrows">
									<a href="javaScript:window.history.back();"><i class="icons icon-reply"></i></a>
								</div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <form action="${pageContext.request.contextPath}/edit-account/${objUser.id}" method="post">
	                            <div class="page-content">
	                            	<div class="row">
	                                    
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Tài khoản*</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="username" value="${objUser.tendangnhap}" disabled="disabled">
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
	                                    	<input type="text" name="tendaydu" value="${objUser.tendaydu}">
	                                    </div>	
	                                    
	                                </div>
	                                
	                                <div class="row">
	                                    
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Địa chỉ</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="diachi" value="${objUser.diachi}">
	                                    </div>	
	                                    
	                                </div>
	                                
	                                <div class="row">
	                                    
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Điện thoại</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="sodienthoai" value="${objUser.sodienthoai}">
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
                        
                    
				</section>