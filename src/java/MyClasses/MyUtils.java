package MyClasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import javax.servlet.ServletContext;

public class MyUtils
{
  
    public static Connection getSiteDBconnection(ServletContext app, String dbPath)
    {
        Connection con = null;

        String s = app.getRealPath("/");
        if(s.indexOf("build") > 0)
        {
            s = s.substring(0, s.indexOf("build"));
            s = s + "web\\"+dbPath;
        }
        else
        {
            s = s + dbPath;
        }

        try
        {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            String dbURL = "jdbc:ucanaccess://"+s; 
            con = DriverManager.getConnection(dbURL);
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }

        return con;
    }
    
    public static ArrayList<String> getGenres(int num) {
        ArrayList<String> genres = new ArrayList<>();
        if(num - 1024 >= 0) {
            num -= 1024;
            genres.add("platform");
        }
        if(num - 512 >= 0) {
            num -= 512;
            genres.add("fps");
        }
        if(num - 256 >= 0) {
            num -= 256;
            genres.add("simulator");
        }
        if(num - 128 >= 0) {
            num -= 128;
            genres.add("strategy");
        }
        if(num - 64 >= 0) {
            num -= 64;
            genres.add("fighting");
        }
        if(num - 32 >= 0) {
            num -= 32;
            genres.add("racing");
        }
        if(num - 16 >= 0) {
            num -= 16;
            genres.add("adventure");
        }
        if(num - 8 >= 0) {
            num -= 8;
            genres.add("roleplay");
        }
        if(num - 4 >= 0) {
            num -= 4;
            genres.add("broyale");
        }
        if(num - 2 >= 0) {
            num -= 2;
            genres.add("sports");
        }
        if(num - 1 >= 0) {
            genres.add("action");
        }
        return genres;
    }

    
}
