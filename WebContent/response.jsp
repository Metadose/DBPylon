<%@page import="com.future.pylon.controller.PylonController"%>
<%@page import="com.future.pylon.util.RequestUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String responseStr = (String) request.getAttribute(PylonController.PARAM_RESPONSE);
%>
<%=responseStr%>