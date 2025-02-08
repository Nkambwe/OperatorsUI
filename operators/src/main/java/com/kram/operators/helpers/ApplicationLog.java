package com.kram.operators.helpers;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/** Logger class
 * Class used to write log file for the application
 * @author Macjohnan
 */
public class ApplicationLog {
    
    private static final String OS = System.getProperty("os.name").toLowerCase();
    
    public static boolean saveLog(String message,String key){
    
         BufferedWriter bw = null;
        try {
            //Specify the file name and path here
            String directory;
            if(isWindows()){
            directory = "C://Activity_Logs/Operator";
            }else if(isMac()){
            directory="/users/eng.semandamoses/Documents/Activity_Logs/Operator";
            }else{
            directory="/users/eng.semandamoses/Documents/Activity_Logs/Operator";
            }
            
            File d = new File(directory);
            d.mkdirs();

            //log date
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            String dateFormated = ft.format(new Date());

            //filename formatted to include date
            String fileName = directory + "/log_" + dateFormated + ".log";
            File file = new File(fileName);
            if (!file.exists()) {
                file.createNewFile();              
            }
            FileWriter fw = new FileWriter(file, true);
            bw = new BufferedWriter(fw);
             //This will add a new line to the file content
             try (PrintWriter pw = new PrintWriter(bw)) {
                 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                 String dateFo = df.format(new Date());
                 pw.println(dateFo+" ["+key+"] "+message);
             }
            return true;
   
        }catch(FileNotFoundException notf){
            System.out.println( notf.toString()+"ussdserver.Logs.saveLog() File NOt Found "+notf.getMessage());
           
        } catch (IOException ioe) {
            ioe.printStackTrace();
            System.out.println("ussdserver.Logs.saveLog()" +ioe.getMessage());
        } finally {
            System.out.println("Execting Finally Close");
            try {
                System.out.println("ussdserver.Logs.saveLog() Closing BufferedWriter(fw) ");
                if (bw != null) {
                    bw.close();
                }
            } catch (IOException ex) {
                System.out.println("Error in closing the BufferedWriter" + ex.getMessage());
            }
        }
        return false;

    }
    
    private static boolean isWindows() {
        return (OS.contains("win"));
	}
    
    private static boolean isMac() {
        return (OS.contains("mac"));
	}

    private static boolean isUnix() {
    return (OS.contains("nix") || OS.contains("nux") || OS.indexOf("aix") > 0 );
    }
}

