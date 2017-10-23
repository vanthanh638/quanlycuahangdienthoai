<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				<section class="main-content col-lg-9 col-md-9 col-sm-9 col-lg-push-3 col-md-push-3 col-sm-push-3">
					<div class="row">
                    	
                        <div class="col-lg-12 col-md-12 col-sm-12">
                        	
                            <div class="carousel-heading no-margin">
                                <h4>Thông báo</h4>
                            </div>
                            <form action="${pageContext.request.contextPath}/login" method="post">
	                            <div class="page-content">
	                                <p style="color: red">
	                                	Bạn không có quyền truy cập trang này
	                                	${userInfor.role}
	                                </p>
	                            </div>
                            </form>
                    	</div>
                          
                    </div>
                  </section>