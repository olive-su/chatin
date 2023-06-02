package utils;

import java.util.logging.Level;
import java.util.logging.Logger;

public class MyLogger {
    Logger log;

    public MyLogger(){
        log = java.util.logging.Logger.getGlobal();
    }

    public void servere(String msg){
        log.setLevel(Level.SEVERE);
        log.severe(msg);
        System.out.println("[SERVERE]" + msg);
    }

    public void warning(String msg){
        log.setLevel(Level.WARNING);
        log.warning(msg);
        System.out.println("[WARNING]" + msg);
    }

    public void info(String msg){
        log.setLevel(Level.INFO);
        log.info(msg);
        System.out.println("[INFO]" + msg);
    }
}
