package org.liquidplayer.hemroid;

public class Sqlite3 extends Hemroid {
    public Sqlite3(android.content.Context context) {
        super(context);
        loadLibrary("sqlite3");
    }
}