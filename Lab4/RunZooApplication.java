import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the ZooApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunZooApplication
{
    public static void main(String[] args) throws ClassNotFoundException,
        FileNotFoundException, IOException, SQLException {
			
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username (twice) and password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cse182-db.lt.ucsc.edu/aijberns",
                                                     "aijberns",
                                                     "");
            
            if (connection != null)
                System.out.println("Connected to the database!");
			
			  ZooApplication app = new ZooApplication(connection);

            /* Include your code below to test the methods of the ZooApplication class.
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
			 
			 
			 //test get member status, returns number of members with high medium or low-
				String testOne = "H";
				int numberOfMembers = app.getMemberStatusCount(testOne);
				System.out.println(numberOfMembers);
				
				/*
				* Output of getMemberStatusCount
				* when the parameter theMemberStatus is ‘H’. 
				System.out.println(numberOfMembers);
				*/

				System.out.println("/*\n\r*Output of getMemberStatusCount\n\r*when the parameter theMemberStatus is ‘H’.\n\r" + numberOfMembers + "\n\r*/");
				
				
				
				
			//updates  -- if memberId=memberid then update adress to newmemberaddress, return 1 if updated.
				
					int updateTest = 1006;
					String updateTestPartTwo = "200 Rocky Road";
					
					int updateTestOne = 1011;
					String updateTestOnePartTwo = "300 Rocky Road";
					
				int updatedMembersCount = app.updateMemberAddress(updateTest, updateTestPartTwo);
				System.out.println("/*\n\r*Output of updateMemberAddress when theMemberID is 1006\n\r* and newMemberAddress is ‘200 Rocky Road’ \n\r"  + updatedMembersCount);
				
				int updatedMembersCount1 = app.updateMemberAddress(updateTestOne, updateTestOnePartTwo);
				System.out.println("/*\n\r*Output of updateMemberAddress when theMemberID is 1006\n\r* and newMemberAddress is ‘200 Rocky Road’ \n\r"  + updatedMembersCount1);

		
				
			//increase keepers salary = send increase amount to zooapplication -> zooapplication sends it stored database in lab4 schema. 
			int increaseTest =451; 
			int totalIncreases = app.increaseSomeKeeperSalaries(increaseTest);
		    System.out.println("Output of increaseSomeKeeperSalaries with increase at 451 is, IE total increase equate to \n\r" + totalIncreases);
			int increaseTest1 =132; 
			int totalIncreases1 = app.increaseSomeKeeperSalaries(increaseTest1);
			System.out.println("Output of increaseSomeKeeperSalaries with increase at 132 is, IE total increase equate to \n\r" + totalIncreases1);
            
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
