package org.liquidplayer.hemroid;

import android.app.Application;
import android.content.Context;

public class HemroidApplication extends Application {
    @Override
    public void onCreate(){
        super.onCreate();
        Context context = getApplicationContext();
        
       {{INITIALIZERS}}
    }
}
