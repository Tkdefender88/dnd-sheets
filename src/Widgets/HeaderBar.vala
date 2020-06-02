namespace Sheets {
    public class HeaderBar : Gtk.HeaderBar {
        public Sheets.Window main_window {get; construct;}

        public HeaderBar(Sheets.Window window) {
            Object(main_window: window);
        }

        construct {
            show_close_button = true;            

            // The button:
            var add_button = new Gtk.Button.with_label ("New");
            add_button.get_style_context().add_class("suggested-action");
            add_button.valign = Gtk.Align.CENTER;
            pack_start(add_button);

            add_button.clicked.connect(open_dialog);

            var edit_button = new Gtk.Button.from_icon_name("open-menu", Gtk.IconSize.LARGE_TOOLBAR); 
            edit_button.valign = Gtk.Align.CENTER;
            pack_end(edit_button);

            var stack_switcher = new Gtk.StackSwitcher();
            stack_switcher.stack = main_window.stack;
            custom_title = stack_switcher;
        }


        private void open_dialog() {
            var dialog = new Gtk.Dialog.with_buttons(
                "New Character",
                main_window,
                Gtk.DialogFlags.DESTROY_WITH_PARENT | Gtk.DialogFlags.MODAL 
            );

            var label = new Gtk.Label("This is the content of the modal");
            var content_area = dialog.get_content_area();
            content_area.add(label);

            dialog.add_button("done", 1);
            dialog.show_all();                
            dialog.present();
        }
    }
}