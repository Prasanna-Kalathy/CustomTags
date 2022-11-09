package com.pk.CustomTag;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletRequest;
import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.Tag;
import jakarta.servlet.jsp.tagext.TagSupport;

public class ResultHandler extends TagSupport {

	private static final long serialVersionUID = -3143063165568266156L;
	Connection con;
	PreparedStatement ps;

	public ResultHandler() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/mydb", "student", "student");
			ps = con.prepareStatement("select * from user where email=?");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int doStartTag() throws JspException {
		ServletRequest request = pageContext.getRequest();
		String email = request.getParameter("email");

		try {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			JspWriter out = pageContext.getOut();
			if (rs.next()) {
				out.print("User Details are: <br/> First Name:");
				out.print(rs.getString(1));
				out.print("<br/> Last Name:");
				out.print(rs.getString(2));
			} else {
				out.print("Invalid Email Entered");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return Tag.SKIP_BODY;

	}

	@Override
	public void release() {
		try {
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
