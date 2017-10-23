<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/taglib.jsp" %>
  <tiles:insertAttribute name="header"></tiles:insertAttribute>	
			<!-- Content -->
			<div class="row content">
				<!-- Main Content -->
				 <tiles:insertAttribute name="content"></tiles:insertAttribute>	
				<!-- /Main Content -->
				<!-- Sidebar -->
					<tiles:insertAttribute name="right_bar"></tiles:insertAttribute>	
				<!-- /Sidebar -->
				
			</div>
			<!-- /Content -->
			
			<!-- Footer -->
			<tiles:insertAttribute name="footer"></tiles:insertAttribute>	