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
		Book novel = new Book("B1234", "���̾� ��ȭ���� ����", 13000);
		novel.setDescription("������ ��� ���� '���̾� ��ȭ��'���� ������!");
		novel.setAuthor("�����ó� ���̰�");
		novel.setPublisher("���빮��");
		novel.setCategory("�Ҽ�");
		novel.setUnitsInStock(1000);
		novel.setTotalPages(456);
		novel.setReleaseDate("2012�� 12�� 19�� �Ⱓ");
		novel.setCondition("Old");
		novel.setFilename("B1234.jpg");

		Book essay = new Book("B1235", "������ ����", 12000);
		essay.setDescription("������ �� �λ��̾���, �λ��� �� �����̾���!");
		essay.setAuthor("�迵��");
		essay.setPublisher("���е���");
		essay.setCategory("������");
		essay.setUnitsInStock(1000);
		essay.setTotalPages(216);
		essay.setReleaseDate("2019�� 4�� 17�� �Ⱓ");
		essay.setCondition("Refurbished");
		essay.setFilename("B1235.jpg");

		Book megazine = new Book("B1236", "����Ʈ �Ϸ���(2020�� 10��ȣ)", 9000);
		megazine.setDescription("������Ʈ�Ϸ��졻�� ���� �౸�������μ� 1970�� 4���� â���Ͽ����� �ؿ��౸�� �����౸�� ���� �پ��ϰ� ���� �ִ� ������ �ٷ�� �ִ�.");
		megazine.setAuthor("������ ����");
		megazine.setPublisher("����Ʈ�Ϸ���");
		megazine.setCategory("����");
		megazine.setUnitsInStock(1000);
		megazine.setTotalPages(152);
		megazine.setReleaseDate("2020�� 9�� 21�� �Ⱓ");
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
