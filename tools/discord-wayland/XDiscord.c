#include <X11/Xlib.h>
#include <X11/Xlibint.h>

// A fake display
static struct _XDisplay display;

// Fake frees
int XFree(void *data) { return 0; }

// Fake Atoms
Atom XInternAtom(Display *display, const char *name, Bool create) { return 0; }

// Fake a display for discord
Display *XOpenDisplay(const char *name) { return &display; }

// Tell discord that no events have arrived
int XPending(Display *display) { return 0; }

// Tell discord we don't have any extensions
int XQueryExtension(Display *display, const char *name,
                    int *major_opcode_return, int *first_event_return,
                    int *first_error_return) {
  return 0;
}

// Fixes a crash caused by joining a voice-chat
int XQueryKeymap(Display *display, char *keymap) { return 0; }
