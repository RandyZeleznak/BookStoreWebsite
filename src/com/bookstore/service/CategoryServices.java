package com.bookstore.service;


import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

public class CategoryServices {
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		
		categoryDAO = new CategoryDAO();
	}
	
	public void listCategories(String message) throws ServletException, IOException {
		List<Category> listCategories = categoryDAO.listAll();
		request.setAttribute("listCategories", listCategories);
		
		if(message != null) {
			request.setAttribute("message", message);
		}
		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		
		requestDispatcher.forward(request, response);
		
	}
	public void listCategories() throws ServletException, IOException {
		listCategories(null);
	}
	
	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("name");
		Category existCategory = categoryDAO.findByName(name);
		
		if(existCategory != null){
			String message = "Could not create category."
					+ "A category name with " +name+ " already exists.";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory);
			String message = "New category created successfully";
			listCategories(message);
		}	
	}
	
	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		request.setAttribute("category", category);
		String editPage = "category_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void updateCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("name");
		
		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(categoryName);
		
		if(categoryByName != null  && categoryById.getCategoryId() != categoryByName.getCategoryId()) {
			String message = "Unable to update Category. A category with name " +categoryName+ "already exists.";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		}else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			String message = "Category Successfully Updated";
			listCategories(message);
		}	
	}
	
	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		categoryDAO.delete(categoryId);
		System.out.println("Deleting Category");
		String message = "Category ID:" +categoryId+ " has been removed";
		listCategories(message);
		
	}

}











