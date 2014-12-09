package com.future.sqlgateway.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.future.sqlgateway.calls.GatewayRequest;
import com.future.sqlgateway.calls.GatewayResponse;
import com.future.sqlgateway.client.GatewayClient;
import com.future.sqlgateway.db.DAO;

/**
 * Main controller that handles all requests.
 * 
 * @author Victorio Cebedo II
 * 
 */
public class Gateway extends HttpServlet {
	public static final String PARAM_RESPONSE = "response";
	private static final String JSP_EMPTY = "empty.jsp";
	private static final String JSP_RESPONSE = "response.jsp";
	private static final long serialVersionUID = 1L;

	public Gateway() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(new GatewayRequest(request), new GatewayResponse(response));
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(new GatewayRequest(request), new GatewayResponse(response));
	}

	private void process(GatewayRequest request, GatewayResponse response) {
		// Check if request is authorized.
		// Check if request has valid parameters, i.e., complete.
		long start = System.currentTimeMillis();

		if (request.hasValidParams() && request.isAuthorized()) {
			String targetTable = request.getTargetTable();
			String sql = request.getSql();

			DAO dao = new DAO();
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
								+ GatewayClient.SEPARATOR_PIECES
								+ value.toString()
								+ GatewayClient.SEPARATOR_PIECES
								+ value.getClass().getSimpleName();
						responseStr += ",";
					}
					responseStr += "\n";
				}
			}
			respond(request, response, responseStr, start);
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
	private void respond(GatewayRequest request, GatewayResponse response,
			String responseStr, long start) {
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
	private void error(GatewayRequest request, GatewayResponse response) {
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
