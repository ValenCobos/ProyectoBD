import java.sql.*;
import java.util.Scanner;

public class EliminarReclamo{
    
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/Esquema_Proyecto?serverTimezone=UTC";
    private static final String username = "root"; 
    private static final String password = "root"; 

    public static void main(String[] args){
        Connection connection = null;
        Statement statement = null;
        Scanner scanner = new Scanner(System.in);
        
    try{
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);
            
            System.out.print("Ingrese nro_reclamo: ");
            int nro_reclamo = scanner.nextInt();
            

            statement = connection.createStatement();
            String query = "DELETE FROM reclamo WHERE nro_reclamo = " + nro_reclamo + ";";
            int resultDelete = statement.executeUpdate(query);
            if(resultDelete==1){
                System.out.print("Eliminado correctamente \n");
            }
            else{
                System.out.print("Error: por favor intente de nuevo \n");
            }
            
                
        } catch (Exception e) {
            System.err.println("Ocurrió un error:");
            e.printStackTrace();
        } finally {
            try {
                    if (statement != null) statement.close();
                } catch (SQLException e) { e.printStackTrace(); }
                
                try {
                    if (connection != null) connection.close();
                } catch (SQLException e) { e.printStackTrace(); }
                
                if (scanner != null) {
                    scanner.close();
                }
        }
    }           
}         
