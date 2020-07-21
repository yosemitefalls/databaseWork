import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Zoo database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class ZooApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public ZooApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    /**
     * getMemberStatusCount: This method has a string argument called theMemberStatus, and
     * returns the number of Keepers whose keeperLevel equals theMemberStatus.
     * A value of theMemberStatus that’s not ‘L’, ‘M’ or ‘H’ (corresponding to Low, Medium, and
     * High) is an error.
     */

    public Integer getMemberStatusCount(String theMemberStatus) throws SQLException
    {
        Integer result = 0;
        // your code here
		String low = "L";
		String medium = "M";
		String high = "H";
			
			
			//if member status is low medium or high add 1 to the result:
			if (theMemberStatus.equals(low) || theMemberStatus.equals(medium)  || theMemberStatus.equals(high)){ 
				result++;
				
			}
			else{
				System.out.println("member status not low medium or high! therefore does not compute");
				System.exit(-1);
			}
      
        return result;
		
	}

		
		
		
		

		


    /**
     * updateMemberAddress:  Sometimes a member changes address.  The updateMemberAddress method
     * has two arguments, an integer argument theMemberID, and a string argument,
     * newMemberAddress.  For the tuple in the Members table (if any) whose memberID equals
     * theMemberID, updateMemberAddress should update the address to be newMemberAddress.
     * (Note that there might not be any tuples whose memberID matches theMemberID.)
     *
     * updateMemberAddress should return the number of tuples that were updated, which will
     * always be 0 or 1.
     */

    public int updateMemberAddress(int theMemberID, String newMemberAddress)
    {
       int  result=0;
	
			try
			{	
				//query the database with the memberid and newMemberAdress so as to update it, if it updates return 1 if it dosent (because memberid dosent exist return 0
				//String query = "Update \"lab4\".Movies set name = ?  where movieid =?"
				String query = "Update Members set name='"+newMemberAddress+"' where memberid = "+theMemberID+";";
				PreparedStatement statement = connection.prepareStatement(query);
				//statement.setString(1,newMemberAddress);
				//statement.setInt(2, theMemberID);
				statement.execute();
				result = statement.getUpdateCount();
				statement.close();
			}
				catch(SQLException e)
			{
				System.out.println("error in database :(");
				System.exit(-1);
				e.printStackTrace();
			}
				return result;
		
    }


    /**
     * increaseSomeKeeperSalaries: This method has an integer parameter, maxIncreaseAmount.
     * It invokes a stored function increaseSomeKeeperSalariesFunction that you will need to
     * implement and store in the database according to the description in Section 5.
     * increaseSomeKeeperSalariesFunction should have the same parameter, maxIncreaseAmount.
     * A value of maxIncreaseAmount that’s not positive is an error.
     *
     * The Keepers table has a keeperSalary attribute, which gives the salary (in dollars and
     * cents) for each keepers.  increaseSomeKeeperSalariesFunction will increase the salary
     * for some (but not necessarily all) keepers; Section 5 explains which keepers should have
     * their salaries increased, and also tells you how much they should be increased.
     * The increaseSomeKeeperSalaries method should return the same integer result that the
     * increaseSomeKeeperSalariesFunction stored function returns.
     *
     * The increaseSomeKeeperSalaries method must only invoke the stored function
     * increaseSomeKeeperSalariesFunction, which does all of the assignment work; do not
     * implement the increaseSomeKeeperSalaries method using a bunch of SQL statements through
     * JDBC.
     */

    public int increaseSomeKeeperSalaries (int maxIncreaseAmount)
    {
       
	int storedFunctionResult=0;
	if (maxIncreaseAmount <= 0){
		System.out.println("0 or <0 inputted, can not inrease salary based of the value provided");
		System.exit(-1);
		
	}		
	
	//send max amount to the pgsql file, it will return with the amount of times 10 20 and 30 (in that order->ascending date will fit into the variable maxIncreaaseAmount
	try{
	String query = "SELECT increaseSomeKeepersSalariesFunction(?)";
	PreparedStatement statement = connection.prepareStatement(query);
	statement.setInt(1,maxIncreaseAmount);
	statement.executeQuery();
	ResultSet resultSet = statement.getResultSet();
	
	if (resultSet.next()){
		storedFunctionResult = resultSet.getInt(1);
		}
	}
	catch(SQLException e)
	{
			System.out.println("error in database :(");
			
			e.printStackTrace();
		System.exit(-1);
		
		
		
	
	}
	
	return storedFunctionResult;

    }

};
