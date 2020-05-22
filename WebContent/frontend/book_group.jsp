
<div  class = "book">
	<div>
		<div>
			<a href="view_book?id=${book.bookId}">
			<img class = "book-small" src="data:image/jpg;base64,${book.base64Image}"/>
			</a>
		</div>
		<div>
		<a href="view_book?id=${book.bookId}">
			<b>${book.title}</b>
		</a>
		</div>
		
		<jsp:directive.include file="book_rating.jsp"/>
		
		
		<div><i> by ${book.author}</i></div>
		<div><b>$ ${book.price}</b></div>
		
	</div>
</div>
			