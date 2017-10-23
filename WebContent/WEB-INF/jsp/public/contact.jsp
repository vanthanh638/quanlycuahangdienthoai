<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<!-- <div class="row content"> -->


	<!-- Main Content -->
	<section class="main-content col-lg-12 col-md-12 col-sm-12">


		<div class="row">

			<div class="col-lg-7 col-md-7 col-sm-7">

				<div class="carousel-heading no-margin">
					<h4>Thông tin liên hệ</h4>
				</div>

				<div class="page-content contact-info">

					<iframe
						src="https://www.google.com/maps/d/embed?mid=1loyBKk6FrUojH1g1Ab1YRvgA3fU"
						width="425" height="350"></iframe>
					<div class="row">

						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="contact-item green">
								<i class="icons icon-location-3"></i>
								<p>154, Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="contact-item blue">
								<i class="icons icon-mail"></i>
								<p>
									<a href="#">vanthanh638x111@gmail</a><br> <br>
								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="contact-item orange">
								<i class="icons icon-phone"></i>
								<p>
									+84-985-616-945<br>

								</p>
							</div>
						</div>

						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="contact-item purple">
								<i class="icons icon-clock"></i>
								<p>
									Monday - Friday: 08.00-20.00<br> Saturday: 09.00-15.00<br>
									Sunday: closed
								</p>
							</div>
						</div>

					</div>

				</div>

			</div>




			<div class="col-lg-5 col-md-5 col-sm-5">

				<div class="carousel-heading no-margin">
					<h4>Gửi liên hệ</h4>
				</div>

				<div class="page-content contact-form">

					<form id="contact-form" action="${pageContext.request.contextPath}/lien-he" method="post">

						<label>Họ tên</label> 
						<input name="name" type="text"> 
						<form:errors path="objContact.name" cssStyle="color:red"></form:errors>

						<label>Email</label> 
						<input name="email" type="text">
						<form:errors path="objContact.email" cssStyle="color:red"></form:errors>

						<label>Số điện thoại</label> 
						<input name="phone" type="text"> 
						<form:errors path="objContact.phone" cssStyle="color:red"></form:errors>
						
						<label>Nội dung</label>
						<textarea name="message"></textarea>

						<input class="big" type="submit" value="Gửi">

					</form>

				</div>

			</div>


		</div>

	</section>
	<!-- /Main Content -->

<!-- </div> -->
<script type="text/javascript">
	
</script>