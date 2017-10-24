<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
					<div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading no-margin">
                                <h3>Đăng nhập</h3>
                            </div>
                            <form action="${pageContext.request.contextPath}/admin/login" method="post">
	                            <div class="page-content">
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
	                            </div>
                            </form>
                    	</div>
                          
                    </div>
                  </section>