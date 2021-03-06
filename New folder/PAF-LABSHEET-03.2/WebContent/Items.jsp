<%@page import="com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	if (request.getParameter("itemCode") != null){
			
			Item item = new Item();
			
			String stsmsg = item.insertItem(request.getParameter("itemCode"), 
							 	request.getParameter("itemName"), 
							 	request.getParameter("itemPrice"), 
							 	request.getParameter("itemDescription"));
			
			session.setAttribute("statusMsg",stsmsg);
		
		}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Items Management</h1>
	<form method="post" action="Items.jsp">
		Item Code: <input type="text" name="itemCode"></input><br>
		Item Name: <input type="text" name="itemName"></input><br>
		Item Price: <input type="text" name="itemPrice"></input><br>
		Item Description: <input type="text" name="itemDescription"></input><br>
		<input type="submit" name="btnSubmit" value="Save"></input>	
	</form>
	
	<% 
		out.print(session.getAttribute("statusMsg"));
	%>
	
	
	<% 
		 Item item = new Item();
		 out.print(item.readItems());
	%>	
	

</body>
</html>