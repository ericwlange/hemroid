package org.liquidplayer.hemroid;

public class WebKitGTK extends Hemroid {
    public void WebKitGTK() {
        new WebCoreGTK();
        new GTK();
        new GDK();
        new PangoCairo();
        new Pango();
        new ATK();
        new CairoGobject();
        new Cairo();
        new GDKPixbuf();
        new GIO();
        new GObject();
        new GLib();
        new Intl();
        new IConv();
        new Notify();
        new GThread();
        new PangoFT2();
        new Epoxy();
        new Pixman();
        new FFI();
        new ICUData;
        new JavaScriptCoreGTK();
        new ICUI18n();
        new ICUUC();
        new Enchant();
        new Fontconfig();
        new Freetype();
        new GModule();
        new Harfbuzz();
        new HarfbuzzICU();
        new JPEG();
        new Secret();
        new Soup();
        new XML2();
        new Hyphen();
        new PNG();
        new Sqlite3();
        new Webp();
        new GstApp();
        new GstBase();
        new Gstreamer();
        new GstPbUtils();
        new GstAudio();
        new GstTag();
        new GstVideo();
        new GstFft();
        loadLibrary("libwebkitgtk-4.0")
    }
}