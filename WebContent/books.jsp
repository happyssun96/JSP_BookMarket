<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<meta charset="EUC-KR">
<title>도서 목록</title>
</head>
<body>
   <%@ include file="menu.jsp" %>

   <div class="jumbotron">
        <div class="container">
           <h1 class="display-3">도서목록</h1>
         </div>
    </div>
    
    <%
       BookRepository dao = BookRepository.getInstance();
       ArrayList<Book> listOfBooks = dao.getAllBooks();
    %>
    
   <div class="container">
           <%
              for (int i=0; i<listOfBooks.size(); i++) {
                 Book book = listOfBooks.get(i);
           %>
    <div class="" style="display:flex; justify-content:center; vertical-align:middle;">
        <div class="col-md-3">
         <img src="C:\\upload\\<%=book.getFilename() %>" style="width:60%" alt="book" />
      </div>
      <div class="col-md-8 ">
           <h3><%= book.getName() %></h3>
           <br>
           <p> <%= book.getDescription() %>
           <a href="./book.jsp?id=<%= book.getBookId() %>" class="btn btn-secondary btn pull-right" role="button">상세정보&raquo;</a>   
           <p><%= book.getAuthor() %> | <%= book.getPublisher() %> | <%= book.getUnitPrice() %>원</p>
            <hr>
       </div>
   </div>
       <%
             }
          %>      
   </div>
 


   <%@ include file="footer.jsp" %>
</body>
</html>
