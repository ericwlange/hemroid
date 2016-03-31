package org.liquidplayer.hemroid;

public class Soup extends Hemroid {
    public Soup(android.content.Context context) {
        super(context);
        new GIO(context);
        new GModule(context);
        new GObject(context);
        new FFI(context);
        new Glib(context);
        new XML2(context);
        new Sqlite3(context);
        loadLibrary("soup-2.4");
    }
}