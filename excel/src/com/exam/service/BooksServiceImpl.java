package com.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.exam.entity.Books;
import com.exam.mapper.BooksMapper;

@Service
public class BooksServiceImpl implements BooksService {
	
	@Autowired
	private BooksMapper booksMapper;

	@Override
	@Transactional
	public int addBooks(Books books) {
		// TODO Auto-generated method stub
		return booksMapper.addBooks(books);
	}

	@Override
	public List<Books> getBooksList(Books books) {
		// TODO Auto-generated method stub
		return booksMapper.getBooksList(books);
	}

}
