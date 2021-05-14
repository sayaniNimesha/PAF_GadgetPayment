package com;


import java.sql.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Payment {
	
	public Connection connect()
	{
		
		Connection con = null;

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/gadgetbadget","root", "");
			//For testing
			//System.out.print("Successfully connected");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return con;
	}
	
	//Insert
	public String insertPayment(String desc, String date, String amount)
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{
				return "Error while connecting to the database";
			}

			// create a prepared statement
			String query = " insert into pay1(`pyId`,`pyDes`,`pyDate`,`amount`) values (?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, desc);
			preparedStmt.setString(3, date);
			preparedStmt.setDouble(4, Double.parseDouble(amount)); 

			//execute the statement
			preparedStmt.execute();
			con.close();
			
			String newPay = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" +
					newPay + "\"}";
		}
		catch (Exception e)
		{
			output = "Error while inserting";
			System.err.println(e);
		}
		return output;
	}
	
	//Read
	public String readPayment()
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{
				return "Error while connecting to the database for reading.";
			}
			// Prepare the HTML table to be displayed
			output = "<table border='1'><tr><th>payment ID</th>"
					+"<th>Description</th><th>Date</th>"
					+ "<th>Amount</th>"
					+ "<th>Update</th><th>Remove</th></tr>";

			String query = "select * from pay1";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next())
			{
				String pyId = Integer.toString(rs.getInt("pyId"));
				String pyDes = rs.getString("pyDes");
				String pyDate = rs.getString("pyDate");
				String amount = Double.toString(rs.getDouble("amount"));

				// Add a row into the HTML table
				output += "<tr><td><input id='hidPayIDUpdate' name='hidPayIDUpdate' type='hidden' value='" + pyId + "'>"
						+ pyId + "</td>";
				output += "<td>" + pyDes + "</td>"; 
				output += "<td>" + pyDate + "</td>"; 
				output += "<td>" + amount + "</td>";

				// buttons
				output +=  "<td><input name='btnUpdate' type='button' value='Update' "
						+ "class='btnUpdate btn btn-secondary' data-pyid='" + pyId + "'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-pyid='" + pyId + "'>" +"</td></tr>";
				
			}

			con.close();

			// Complete the HTML table
			output += "</table>";
		}
		catch (Exception e)
		{
			output = "Error while reading the payment.";
			System.err.println(e);
		}
		return output;
	}

	public String updatePayment(String id, String desc, String date, String amount)
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{
				return "Error while connecting to the database";
			}


			String query = "update pay1 set `pyDes`=?,`pyDate`=?,`amount`=? where `pyId`=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			
			preparedStmt.setString(1, desc);
			preparedStmt.setString(2, date);
			preparedStmt.setDouble(3, Double.parseDouble(amount));
			preparedStmt.setInt(4,Integer.parseInt(id));


			preparedStmt.executeUpdate();
			con.close();	
			
			
			
			String newPay = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" +
			newPay + "\"}";
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while updating the payment.\"}";
			System.err.println(e);
		}
		return output;
	}
	public String removePayment(String id)
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{
				return "Error while connecting to the database for reading";
			}

			// create a prepared statement
			String query = "delete from pay1 where `pyId`=?;";
			PreparedStatement preparedStmt = con.prepareStatement(query);

			
			preparedStmt.setInt(1, Integer.parseInt (id));


			preparedStmt.executeUpdate();
			con.close();
			
			String newPay = readPayment();
			output = "{\"status\":\"success\", \"data\": \"" +
					newPay + "\"}";
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while removing the payment.\"}";
			System.err.println(e);
		}
		return output;
	}
	
	}
	

