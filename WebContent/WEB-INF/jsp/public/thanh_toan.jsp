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
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="page-content">
                            	<p>Nếu bạn đã đăng ký, vui lòng đăng nhập trực tiếp tại đây</p>
                                <form action="${pageContext.request.contextPath}/account" method="post">
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
                                <h4>Bạn là khách hàng mới</h4>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                            <form action="${pageContext.request.contextPath}/forward-thanh-toan">
	                            <div class="page-content">
		                            <div class="row">
		                            	<div class="col-lg-12 col-md-12 col-sm-12">
	                                    	<input name="register" type="radio" value="register" />
	                                    	<span>Đăng ký tài khoản</span>
		                           		</div>    
		                           </div>
	                                <div class="row">
	                                	<div class="col-lg-12 col-md-12 col-sm-12">
	                                    	<input name="register" type="radio" value="không đăng ký" />
	                                		<span>Mua hàng không cần tài khoản</span>
	                                	</div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-lg-12 col-md-12 col-sm-12">
	                                    	<input class="big" type="submit" value="Tiếp tục">
	                                        <input class="big" type="reset" value="Cancel">
	                                    </div>
	                                    
	                                </div>
	                                
	                            </div>
                            </form>
                            
                    	</div>
                          
                    </div>
                    
				</section>