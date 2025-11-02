import java.sql.*;
import java.util.Scanner;


public class ListarReclamosUsuario {
    
    
    private static final String driver = "com.mysql.cj.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/Esquema_Proyecto?serverTimezone=UTC";
    private static final String username = "root"; 
    private static final String password = "root"; 

    public static void main(String[] args){
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null; 
        Scanner scanner = new Scanner(System.in);
        
        try{
            Class.forName(driver);
            connection = DriverManager.getConnection(url, username, password);

            System.out.print("Ingrese ID de usuario para ver sus reclamos: ");
            int idUsuario = scanner.nextInt();

            statement = connection.createStatement();
            
            String query =  "SELECT r.nro_reclamo, r.fecha_hora, " +
                            "COUNT(l.nro_llamado) AS cantidad_rellamados " +
                            "FROM reclamo r " +
                            "LEFT JOIN llamado l ON r.nro_reclamo = l.nro_reclamo " +
                            "WHERE r.id_usuario = " + idUsuario + " " +
                            "GROUP BY r.nro_reclamo, r.fecha_hora;";
            
            
            resultSet = statement.executeQuery(query);
            
            boolean hayResultados = false;
            System.out.println("\n Reclamos del Usuario " + idUsuario);


            while (resultSet.next()) {
                hayResultados = true;
                
                int nroReclamo = resultSet.getInt("nro_reclamo");
                Timestamp fechaHora = resultSet.getTimestamp("fecha_hora");
                int cantRellamados = resultSet.getInt("cantidad_rellamados");
                
                System.out.println("  Nro. Reclamo: " + nroReclamo);
                System.out.println("  Fecha y Hora: " + fechaHora);
                System.out.println("  Cantidad de Rellamados: " + cantRellamados);
            }
            
                
        } catch (Exception e) {
            System.err.println("Ocurrió un error:");
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
            } catch (SQLException e) { e.printStackTrace(); }
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