package dao;

import java.util.ArrayList;
import dto.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public BookRepository() {
		Book novel = new Book("B1234", "나미야 잡화점의 기적", 13000);
		novel.setDescription("따뜻한 고민 상담실 '나미야 잡화점'으로 오세요!");
		novel.setAuthor("히가시노 게이고");
		novel.setPublisher("현대문학");
		novel.setCategory("소설");
		novel.setUnitsInStock(1000);
		novel.setTotalPages(456);
		novel.setReleaseDate("2012년 12월 19일 출간");
		novel.setCondition("Old");
		novel.setFilename("B1234.jpg");

		Book essay = new Book("B1235", "여행의 이유", 12000);
		essay.setDescription("여행이 내 인생이었고, 인생이 곧 여행이었다!");
		essay.setAuthor("김영하");
		essay.setPublisher("문학동네");
		essay.setCategory("에세이");
		essay.setUnitsInStock(1000);
		essay.setTotalPages(216);
		essay.setReleaseDate("2019년 4월 17일 출간");
		essay.setCondition("Refurbished");
		essay.setFilename("B1235.jpg");

		Book megazine = new Book("B1236", "베스트 일레븐(2020년 10월호)", 9000);
		megazine.setDescription("『베스트일레븐』은 월간 축구전문지로서 1970년 4월에 창간하였으며 해외축구와 국내축구에 대해 다양하고 깊이 있는 정보를 다루고 있다.");
		megazine.setAuthor("편집부 지음");
		megazine.setPublisher("베스트일레븐");
		megazine.setCategory("잡지");
		megazine.setUnitsInStock(1000);
		megazine.setTotalPages(152);
		megazine.setReleaseDate("2020년 9월 21일 출간");
		megazine.setCondition("New");
		megazine.setFilename("B1236.jpg");

		listOfBooks.add(novel);
		listOfBooks.add(essay);
		listOfBooks.add(megazine);
	}
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}
	public Book getBookById(String bookId) {
		Book bookById = null;
		
		for(int i=0; i<listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if(book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
}
