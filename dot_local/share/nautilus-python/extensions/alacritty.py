from gi import require_version
require_version('Gtk', '3.0')
require_version('Nautilus', '3.0')
from gi.repository import Nautilus, GObject
from subprocess import call

class AlacrittyExtension(GObject.GObject, Nautilus.MenuProvider):

    def launch(self, menu, files):
        safepaths = ''

        for file in files:
            filepath = file.get_location().get_path()
            safepaths += '"' + filepath + '" '

        call('alacritty --working-directory ' + safepaths + '&', shell=True)

    def get_background_items(self, window, file_):
        item = Nautilus.MenuItem(
            name='AlacrittyOpenBackground',
            label='Open Alacritty Here',
            tip='Opens Alacritty in the current directory'
        )
        item.connect('activate', self.launch, [file_])

        return [item]
