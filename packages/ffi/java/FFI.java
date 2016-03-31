package org.liquidplayer.hemroid;

public class FFI extends Hemroid {
    public FFI(android.content.Context context) {
        super(context);
        loadLibrary("ffi");
    }
}