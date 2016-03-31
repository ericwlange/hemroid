package org.liquidplayer.hemroid;

import android.util.Log;
import java.io.File;
import java.io.IOException;

public class HicolorIconTheme extends Hemroid {
    private static Boolean loaded = false;
    
    public HicolorIconTheme(android.content.Context context) {
        super(context);
        if (!loaded) {
            File sd_path = context.getFilesDir(); 
            String dest_dir_path = sd_path + addLeadingSlash("share/icons/hicolor");
            File dest_dir = new File(dest_dir_path);

            try {
                if (!dest_dir.exists()) {
                    copyDirorfileFromAssetManager("hicolor-icon-theme", "share");
                }
            } catch (IOException e) {
                Log.e("HicolorIconTheme", "Exception", e);
            }
            loaded = true;
        }
    }
}