package com.exam.mapper;

import java.util.List;

import com.exam.entity.Books;

public interface BooksMapper {
	
	/**
	 * 添加图书
	 * @param books
	 * @return
	 */
	int addBooks(Books books);
	
	/**
	 * 分页查询所有图书，按照时间降序
	 * @return
	 */
	List<Books> getBooksList(Books books);

}
