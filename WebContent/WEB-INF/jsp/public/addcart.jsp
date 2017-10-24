<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
										<c:choose>
											<c:when test="${cart.total() > 0}">
											<a href="order_info.html"><i class="icons icon-basket-2"></i>${cart.total()} Items</a>
	                                    	<ul id="cart-dropdown" class="box-dropdown parent-arrow">
												<li>
	                                            	<div class="box-wrapper parent-border">
	                                                    <p>Giỏ hàng</p>
	                                                    <table class="cart-table">
	                                                    	<c:forEach begin="0" end="${cart.total()-1}" var="i">
		                                                    	<c:set var="obj" value="${cart.getItem(i)}"></c:set>
		                                                    	<tr>
		                                                    		<td><img src="${pageContext.request.contextPath}/files/${obj.sanpham.hinhanh}" alt="product"></td>
		                                                            <td>
		                                                                <h6>${obj.sanpham.tensanpham}</h6>
		                                                                <!-- <p>Product code PSBJ3</p> -->
		                                                            </td>
		                                                            <td>
		                                                            	<span class="quantity"><span class="light">${obj.soluong} x</span> ${formatNumber.formatNumber(obj.gia)}</span>
		                                                                <a href="${pageContext.request.contextPath}/cart/del/${i}" class="parent-color">Xóa</a>
		                                                            </td>
		                                                        </tr>
	                                                       </c:forEach>
	                                                    </table>
	                                                    
	                                                    <br class="clearfix">
		                                            </div>
		                                                
													<div class="footer">
														<table class="checkout-table pull-right">
	                                                        <tr>
	                                                        	<td class="align-right"><strong>Tổng:</strong></td>
	                                                            <td><strong class="parent-color">${formatNumber.formatNumber(cart.tongTien())} VNĐ</strong></td>
	                                                        </tr>
	                                                    </table>
													</div>
		                                                
	                                                <div class="box-wrapper no-border">
	                                                	
														<a class="button pull-right" href="${pageContext.request.contextPath}/gio-hang">Xem giỏ hàng</a>
	                                                </div>
												</li>
											</ul>
										</c:when>
										<c:otherwise>
											<a href="order_info.html"><i class="icons icon-basket-2"></i>0 Items</a>
										</c:otherwise>
                                      </c:choose>