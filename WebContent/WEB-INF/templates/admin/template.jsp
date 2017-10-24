<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
<%-- <%
	if (session.getAttribute("admin") == null){
		response.sendRedirect(request.getContextPath() + "/admin/login");
	} 
%> --%>
  <tiles:insertAttribute name="header"></tiles:insertAttribute>	
			<!-- Content -->
			<div class="row content">
				<!-- Main Content -->
				 <tiles:insertAttribute name="content"></tiles:insertAttribute>	
				<!-- /Main Content -->
				<!-- leff_bar -->
					<tiles:insertAttribute name="left_bar"></tiles:insertAttribute>	
				<!-- /left_bar -->
				
			</div>
			<!-- /Content -->
			
			<!-- Footer -->
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>	