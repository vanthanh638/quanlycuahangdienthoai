<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer id="footer" class="row">
	<!-- Main Footer -->
	<div class="col-lg-12 col-md-12 col-sm-12">

		<div id="main-footer">

			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-6 contact-footer-info"></div>
				<!-- Like us on Facebook -->
				<div class="col-lg-3 col-md-3 col-sm-6 facebook-iframe">
					<h4>Facebook</h4>
					<iframe
						src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fvinaenter.edu%2F%3Ffref%3Dts&tabs=timeline&width=290&height=100&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
						width="290" height="100" style="border: none; overflow: hidden"
						scrolling="no" frameborder="0" allowTransparency="true"></iframe>
				</div>
				<!-- /Like us on Facebook -->



				<!-- Information -->

				<!-- /Information -->


				<div class="col-lg-2 col-md-2 col-sm-6 contact-footer-info"></div>
				<!-- Contact Us -->
				<div class="col-lg-3 col-md-3 col-sm-6 contact-footer-info">
					<h4>Liên hệ</h4>
					<ul>
						<li><i class="icons icon-location"></i> 154, Nguyễn Lương
							Bằng, Liên Chiểu, Đà Nẵng.</li>
						<li><i class="icons icon-phone"></i> +84 985 616 945</li>
						<li><i class="icons icon-mail-alt"></i><a
							href="mailto:mail@company.com"> vanthanh638x111@gmail.com</a></li>
						<li><i class="icons icon-skype"></i> MobileShop</li>
					</ul>

					<!-- Social Media -->
					<div class="social-media">
						<ul>
							<li class="social-googleplus tooltip-hover" data-toggle="tooltip"
								data-placement="top" title="Google+"><a href="#"></a></li>
							<li class="social-facebook tooltip-hover" data-toggle="tooltip"
								data-placement="top" title="Facebook"><a href="#"></a></li>
							<li class="social-pinterest tooltip-hover" data-toggle="tooltip"
								data-placement="top" title="Pinterest"><a href="#"></a></li>
							<li class="social-twitter tooltip-hover" data-toggle="tooltip"
								data-placement="top" title="Twitter"><a href="#"></a></li>
							<li class="social-youtube tooltip-hover" data-toggle="tooltip"
								data-placement="top" title="Youtube"><a href="#"></a></li>
						</ul>
					</div>
					<!-- /Social Media -->

				</div>
				<!-- /Contact Us -->

			</div>

		</div>

	</div>
	<!-- /Main Footer -->



	<!-- Lower Footer -->
	<div class="col-lg-12 col-md-12 col-sm-12">

		<div id="lower-footer">

			<div class="row">

				<div class="col-lg-6 col-md-6 col-sm-6">
					<p class="copyright">
						Copyright 2017
					</p>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6">
					<ul class="payment-list">
						<li class="payment1"></li>
						<li class="payment2"></li>
						<li class="payment3"></li>
						<li class="payment4"></li>
						<li class="payment5"></li>
					</ul>
				</div>

			</div>

		</div>

	</div>
	<!-- /Lower Footer -->

</footer>
<!-- Footer -->


<div id="back-to-top">
	<i class="icon-up-dir"></i>
</div>

</div>
<!-- Container -->


<script type="text/javascript"
	src="${defines.publicUrl}/js/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="${defines.publicUrl}/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="${defines.publicUrl}/js/tinynav.js"></script>

<!-- Scroll Bar -->
<script src="${defines.publicUrl}/js/perfect-scrollbar.min.js"></script>

<!-- Cloud Zoom -->
<script src="${defines.publicUrl}/js/zoomsl-3.0.min.js"></script>

<!-- FancyBox -->
<script src="${defines.publicUrl}/js/jquery.fancybox.pack.js"></script>

<!-- jQuery REVOLUTION Slider  -->
<script type="text/javascript"
	src="${defines.publicUrl}/js/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript"
	src="${defines.publicUrl}/js/jquery.themepunch.revolution.min.js"></script>

<!-- FlexSlider -->
<script defer src="${defines.publicUrl}/js/flexslider.min.js"></script>

<!-- IOS Slider -->
<script src="${defines.publicUrl}/js/jquery.iosslider.min.js"></script>

<!-- noUi Slider -->
<script src="${defines.publicUrl}/js/jquery.nouislider.min.js"></script>

<!-- Owl Carousel -->
<script src="${defines.publicUrl}/js/owl.carousel.min.js"></script>

<!-- Cloud Zoom -->
<script src="${defines.publicUrl}/js/zoomsl-3.0.min.js"></script>

<!-- SelectJS -->
<script src="${defines.publicUrl}/js/chosen.jquery.min.js"
	type="text/javascript"></script>

<!-- Main JS -->
<script defer src="${defines.publicUrl}/js/bootstrap.min.js"></script>
<script src="${defines.publicUrl}/js/main-script.js"></script>

<!-- jquery.tweet.js -->
<script defer src="${defines.publicUrl}/js/jquery.tweet.js"></script>
<script defer src="${defines.publicUrl}/js/jquery.tweet.min.js"></script>

<!-- add-cart.js -->
<%-- <script defer src="${defines.publicUrl}/js/add-cart.js"></script> --%>

<script type="text/javascript">
	function addCart(id, giaC) {
		var number = 1;
		number = $('#item_number').val();
		/* alert(number);
 */
		/* alert('${pageContext.request.contextPath}/addCart') */
		$.ajax({
			url : '${pageContext.request.contextPath}/addCart',
			type : 'POST',
			cache : false,
			data : {
				idsp : id,
				gia : giaC,
				so_luong : number
			},
			success : function(data) {
				$("#add-cart").html(data);
				$.notify("Đã thêm sản phẩm vào giỏ hàng", "success");
			},
			error : function() {
				/* alert('${pageContext.request.contextPath}/addCart') */
				alert('Có lỗi xảy ra');
			}
		});
		return false;
	}
	$(document).ready(function() {
		
	});
</script>
</body>

</html>