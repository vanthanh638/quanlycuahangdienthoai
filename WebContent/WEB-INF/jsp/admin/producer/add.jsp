<%@ page language="java" contentType="text/html; charset=UTF-88"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
			<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
                    <div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12 register-account">
                        	
                            <div class="carousel-heading no-margin">
                                <h3>Thêm hãng sản xuất</h3>
                            </div>
                            
                            <div class="page-content">
                            	<form id="frmProducer" action="${pageContext.request.contextPath}/admincp/producer/add" method="post" enctype="multipart/form-data">
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<form:errors path="objProducer.name_pro" cssStyle="color:red"></form:errors>
	                                    </div>	
	                                </div>
	                            	<div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Tên hãng</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="text" name="name_pro" value="">
	                                    </div>	
	                                </div>
	                                
	                                <div class="row">
	                                    <div class="col-lg-3 col-md-3 col-sm-3">
	                                    	<p>Icon</p>
	                                    </div>
	                                    <div class="col-lg-9 col-md-9 col-sm-9">
	                                    	<input type="file" name="icon_add">
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