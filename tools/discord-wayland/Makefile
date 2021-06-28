XDiscord.so: XDiscord.c
	clang -O3 -ffreestanding -nodefaultlibs -shared XDiscord.c -o XDiscord.so

.PHONY: install
install: XDiscord.so
	install -s XDiscord.so /usr/local/lib
