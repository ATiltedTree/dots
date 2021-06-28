# Discord-Wayland

Discord still requires a running X Server for the activity feature. If no X
Server is running, it will crash.

This is a little `libX11.so` replacement that can be used with `LD_PRELOAD` to
fix this crash, allowing discord to run without an X Server.

# Building

- Make sure you have the `X11` development headers install.
- Run `make` and `sudo make install` to install.

# Usage

Set `LD_PRELOAD` to `/usr/local/lib/XDiscord.so` before launching discord.
