package com.future.pylon.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.future.pylon.client.Query;
import com.future.pylon.db.MySQLDAO;

/**
 * Main controller that handles all requests.
 * 
 * @author Victorio Cebedo II
 * 
 */
public class PylonController extends HttpServlet {
	public static final String SEPARATOR_PIECES = "::::";
	public static final String PARAM_RESPONSE = "response";
	private static final String JSP_EMPTY = "empty.jsp";
	private static final String JSP_RESPONSE = "response.jsp";
	private static final long serialVersionUID = 1L;

	public PylonController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(new Query(request), response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(new Query(request), response);
	}

	private void process(Query request, HttpServletResponse response) {
		// Check if request is authorized.
		// Check if request has valid parameters, i.e., complete.

		if (request.hasValidParams() && request.isAuthorized()) {
			String targetTable = request.getTargetTable();
			String sql = request.getSql();

			MySQLDAO dao = new MySQLDAO();
			String responseStr = "";

			// If request is update or delete.
			if (request.isInsert() || request.isUpdate() || request.isDelete()
					|| request.isExecuteQuery()) {
				boolean success = dao.executeUpdate(sql);
				if (!success) {
					error(request, response);
				}
				responseStr = "true";
			}
			// If request is select.
			else if (request.isSelect() || request.isExecuteSelect()) {
				List<Map<String, Object>> rowList = dao.executeQuery(
						targetTable, sql);
				if (rowList == null) {
					error(request, response);
				}

				for (Map<String, Object> row : rowList) {
					for (String columnName : row.keySet()) {
						Object value = row.get(columnName);
						responseStr += columnName
								+ SEPARATOR_PIECES
								+ value.toString().replaceAll(
										"(\\r|\\n|\\r\\n)+", "\\\\n")
								+ SEPARATOR_PIECES
								+ value.getClass().getSimpleName();
						responseStr += ",";
					}
					responseStr += "\n";
				}
			}
			// If request is just to get the list of columns in a table.
			else if (request.isGetColumnList()) {
				responseStr = dao.getColumnListAsString(targetTable);
			}
			respond(request, response, responseStr);
		}
	}

	/**
	 * Redirect to page with results.
	 * 
	 * @param request
	 * @param response
	 * @param responseStr
	 * @param start
	 */
	private void respond(Query request, HttpServletResponse response,
			String responseStr) {
		try {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher(JSP_RESPONSE);
			request.setAttribute(PARAM_RESPONSE, responseStr);
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Redirect to an empty page.
	 * 
	 * @param request
	 * @param response
	 */
	private void error(Query request, HttpServletResponse response) {
		try {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher(JSP_EMPTY);
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
