package org.liquidplayer.hemroid;

public class HarfbuzzICU extends Hemroid {
    public HarfbuzzICU(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new FFI(context);
        new ICUUC(context);
        new ICUData(context);
        new Harfbuzz(context);
        loadLibrary("harfbuzz-icu");
    }
}