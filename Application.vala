
namespace Coin {
    public class Application : Granite.Application {
        public MainWindow app_window;
        public static GLib.Settings gsettings;

        public Application () {
            Object (flags: ApplicationFlags.FLAGS_NONE,
            application_id: "com.github.lainsce.coin");
        }

        static construct {
            gsettings = new GLib.Settings ("com.github.lainsce.coin");
        }

        construct {
            exec_name = "com.github.lainsce.coin";
            app_launcher = "com.github.lainsce.coin";
        }

        protected override void activate () {
            if (get_windows ().length () > 0) {
                app_window.present ();
                return;
            }

            app_window = new MainWindow (this);
            app_window.show_all ();
        }

        public static int main (string[] args) {
            Intl.setlocale (LocaleCategory.ALL, "");
            Intl.textdomain (Build.GETTEXT_PACKAGE);

            var app = new Coin.Application ();
            return app.run (args);
        }
    }
}
