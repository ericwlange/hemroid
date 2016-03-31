package org.liquidplayer.hemroid;

public class Cairo extends Hemroid {
    public Cairo(android.content.Context context) {
        super(context);
        new Pixman(context);
        new FontConfig(context);
        new Freetype(context);
        new PNG(context);
        loadLibrary("cairo");
    }
}