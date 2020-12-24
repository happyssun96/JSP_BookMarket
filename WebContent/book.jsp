<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>도서 상세 정보</title>
<script type = "text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
		<div class="col-md-5">
		<img src="C:\\upload\\<%=book.getFilename()%>" style="width: 50%">
		</div>
		<div class="col-md-6">
		<h3><b>[<%=book.getCategory()%>]
		<%=book.getName() %></b></h3>
		<p><%=book.getDescription() %>
		<p> <b>도서 코드 : </b> <span class="badge badge-danger"><%=book.getBookId() %></span>
		<p> <b>출판사</b> : <%=book.getPublisher() %>
		<p> <b>저자</b> : <%=book.getAuthor() %>
		<p> <b>재고 수</b> : <%=book.getUnitsInStock() %>
		<p> <b>총 페이지수</b> : <%=book.getTotalPages() %>
		<p> <b>출판일</b> : <%=book.getReleaseDate() %>
		<h4><%=book.getUnitPrice() %>원</h4>
		<p> <form name="addForm" action="./addCart.jsp?id=<%=book.getBookId()%>" method="post">
			<a href="#" class="btn btn-info" onclick="addToCart()">도서 주문 &raquo;</a>
			<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
			<a href="./books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
		</form>
		</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
