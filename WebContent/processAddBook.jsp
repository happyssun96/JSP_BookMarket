<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>

<%
   request.setCharacterEncoding("UTF-8");

   String filename = "";
   String realFolder = "C:\\upload";    //웹 애플리케이션의 절대 경로
   int maxSize = 5 * 1024 * 1024;       //최대 업로드될 파일의 크기 5MB
   String encType = "utf-8";         //인코딩 유형
   
   MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
         new DefaultFileRenamePolicy());

   String name = multi.getParameter("name");
   String category = multi.getParameter("category");
   String author = multi.getParameter("author");
   String publisher = multi.getParameter("publisher");
   String unitPrice = multi.getParameter("unitPrice");
   String BookId = multi.getParameter("bookId");
   String ReleaseDate = multi.getParameter("releaseDate");
   String unitsInStock = multi.getParameter("unitsInStock");
   String totalPages = multi.getParameter("totalPages");
   String Description = multi.getParameter("description");
   String condition = multi.getParameter("condition");
   
   long stock;
   
   if (unitsInStock.isEmpty())
      stock = 0;
   else 
      stock = Long.valueOf(unitsInStock);
   
   long pages;
   
   if (totalPages.isEmpty())
      pages = 0;
   else 
      pages = Long.valueOf(totalPages);
   
   Integer price;
   
   if (unitPrice.isEmpty())
      price = 0;
   else 
      price = Integer.valueOf(unitPrice);
   
   Enumeration files = multi.getFileNames();
   String fname = (String) files.nextElement();
   String fileName = multi.getFilesystemName(fname);
   
   BookRepository dao = BookRepository.getInstance();
   
   Book newBook = new Book();
   newBook.setName(name);
   newBook.setCategory(category);
   newBook.setAuthor(author);
   newBook.setPublisher(publisher);
   newBook.setUnitPrice(price);
   newBook.setBookId(BookId);
   newBook.setUnitsInStock(stock);
   newBook.setTotalPages(pages);
   newBook.setReleaseDate(ReleaseDate);
   newBook.setDescription(Description);
   newBook.setCondition(condition);
   newBook.setFilename(fileName);
   
   dao.addBook(newBook);
   response.sendRedirect("books.jsp");
%>