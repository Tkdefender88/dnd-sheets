public  class Application : Gtk.Application {
	public Application () {
		Object(
			application_id: "com.github.Tkdefender88.dnd-sheets",
			flags: GLib.ApplicationFlags.FLAGS_NONE
		);
	}

	protected override void activate () {
		var window = new DNDSheets.Window(this);

        add_window(window);
	}
}

