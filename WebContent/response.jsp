<%@page import="com.future.sqlgateway.controller.Gateway"%>
<%@page import="com.future.sqlgateway.util.RequestUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String responseStr = (String) request.getAttribute(Gateway.PARAM_RESPONSE);
%>
<%=responseStr%>