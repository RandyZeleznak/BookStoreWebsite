<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Z-Squared Book Store - List Books by ${category.name}</title>
<link rel="stylesheet" href="css/style.css">	
</head>
<body>
	
	
	
	<jsp:directive.include file="header.jsp"/>
	
	<div class="center">
	<h2> ${category.name }</h2>	
	</div>
	
	<div class="book-group">
		<c:forEach items="${listBooks}" var="book">
			<div style="float: left; display: inline-block; margin:10px">
				<div>
					<div>
						<a href="view_book?id=${book.bookId}">
						<img src="data:image/jpg;base64,${book.base64Image}" width="128" height="164"/>
						</a>
					</div>
					<div>
					<a href="view_book?id=${book.bookId}">
						<b>${book.title}</b>
					</a>
					</div>
					<div>
							<jsp:directive.include file="book_rating.jsp"/>
							
							</div>
					<div><i> by ${book.author}</i></div>
					<div><b>$ ${book.price}</b></div>
					
				</div>
			</div>
		</c:forEach> 	
	</div>
	
	<jsp:directive.include file="footer.jsp"/>
	
</body>
</html>