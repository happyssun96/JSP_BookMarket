create table if not exists book(
b_id varchar(10) not null,
b_name varchar(20),
b_unitPrice INTEGER,
b_author varchar(50),
b_publisher varchar(20),
b_description TEXT,
b_category varchar(20),
b_unitsInStock LONG,
b_totalPages LONG,
b_releaseDate varchar(20),
b_condition varchar(20),
b_fileName varchar(20),
PRIMARY KEY (b_id)
)default CHARSET=utf8;

desc book;