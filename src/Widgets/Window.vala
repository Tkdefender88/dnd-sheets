namespace DNDSheets {
    public class Window : Gtk.ApplicationWindow {
        private GLib.Settings settings;
        public Window(Application app) {
            Object (
                application: app
            );
        }

        construct {
            title = "DND Sheets";
            window_position = Gtk.WindowPosition.CENTER;
            set_default_size(350, 200);

            settings = new GLib.Settings("com.github.Tkdefender88.dnd-sheets");
            move(settings.get_int("pos-x"), settings.get_int("pos-y"));
            resize(settings.get_int("width"), settings.get_int("height"));

            delete_event.connect( (e) => {
                return before_destroy();
            });

            show_all();
        }

        public bool before_destroy() {
            int width, height, x, y;

            get_size(out width, out height);
            get_position(out x, out y);

            settings.set_int("pos-x", x);
            settings.set_int("pos-y", y);
            settings.set_int("width", width);
            settings.set_int("height", height);

            return false;
        }
    }
}