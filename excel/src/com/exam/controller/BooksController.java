package com.exam.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFileChooser;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.entity.Books;
import com.exam.entity.User;
import com.exam.service.BooksService;
import com.exam.utils.ExcelExport;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class BooksController {
	
	@Autowired
	private BooksService booksService;
	
	
	/**
	 * 所有数据，分页
	 * @param books
	 * @param pageNum
	 * @param request
	 * @return
	 */
	@RequestMapping("/query")
	public String query(Books books,Integer pageNum,HttpServletRequest request){
		if(pageNum==null){
			pageNum=1;
		}
		//分页助手
		PageHelper.startPage(pageNum,4);
		List<Books> bList=booksService.getBooksList(books);
		//分页信息
		PageInfo<Books> pi=new PageInfo<>(bList);
		request.setAttribute("bList",bList);
		request.setAttribute("pi", pi);
		return "index";
	}
	
	/**
	 * 所有数据，不分页
	 * @param books
	 * @param pageNum
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryall")
	public String queryall(Books books,Integer pageNum,HttpServletRequest request){
		if(pageNum==null){
			pageNum=1;
		}
		List<Books> bList=booksService.getBooksList(books);
		request.setAttribute("bList",bList);
		return "index1";
	}
	
	/**
	 * 测试代码，无效
	 * @param response
	 */
	@RequestMapping("/createExcel")
	public void createExcel(HttpServletResponse response){
        List<User> userList = new ArrayList();
        for (int i = 0; i < 20; i++) {
            User user = new User();
            user.setUserId(i);
            user.setUserName("张三"+i);
            user.setSex("男");
            user.setAge(i);
            user.setSchool("学校"+i);
            userList.add(user);
        }
        //excel标题
        String[] title = {"id", "姓名", "性别", "年龄", "学校"};
        String[][] objects = new String[userList.size()][title.length];
        for (int i = 0; i < userList.size(); i++) {
            User user = userList.get(i);
            objects[i][0] = String.valueOf(user.getUserId());
            objects[i][1] = user.getUserName();
            objects[i][2] = user.getSex();
            objects[i][3] = String.valueOf(user.getAge());
            objects[i][4] = user.getSchool();
        }
        String fileName = "学生信息表";
        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelExport.createWorkbook(fileName, title, objects);
        //响应到客户端
        try {
            //设置编码、输出文件格式
            response.reset();
            fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
            response.setContentType("application/vnd.ms-excel;charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xls");
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	/**
	 * 测试代码，无效
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/tDown")
	public void tDown(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		JFileChooser fileChooser =new JFileChooser();
		fileChooser.showOpenDialog(null);
		
		File fl = fileChooser.getSelectedFile();
		byte b[] =new byte[(int)fl.length()];
		try {
			FileInputStream fileinput =new FileInputStream(fl);
			fileinput.read(b);
			String string=new String(b);
			
			System.out.println(fl.getAbsolutePath());
			System.out.print(string);
			fileChooser.showSaveDialog(null);
			File fout =fileChooser.getSelectedFile();
			FileOutputStream fileout =new FileOutputStream(fout);
			fileout.write(b);
			fileout.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
