package org.liquidplayer.hemroid;

public class GnuTLS extends Hemroid {
    public GnuTLS(android.content.Context context) {
        super(context);
        loadLibrary("gnustl_shared");
        new Tasn1(context);
        new Nettle(context);
        new Hogweed(context);
        new Gmp(context);
        loadLibrary("gnutls");
    }
}