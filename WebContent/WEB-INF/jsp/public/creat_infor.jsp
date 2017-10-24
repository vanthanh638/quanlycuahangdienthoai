<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<section class="main-content col-lg-9 col-md-9 col-sm-9">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="carousel-heading">
                                <h4>Nhập thông tin của bạn</h4>
                                <div class="carousel-arrows">
									<a href="javaScript:window.history.back();"><i class="icons icon-reply"></i></a>
								</div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <form id="frmInfor" action="${pageContext.request.contextPath}/thong-tin-thanh-toan" method="post">
	                            <div class="page-content">
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Họ tên (*)</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="fullname">
	                                    </div>	
	                                </div>
	                                
	                                <br>
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Địa chỉ (*)</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text"  name="address">
	                                    </div>	
	                                </div>
	                            	
	                            	<br>
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Điện thoại (*)</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="phone">
	                                    </div>	
	                                </div>
	                                
	                                <br>
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Thông tin thêm</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<textarea name="tt_them"></textarea>
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