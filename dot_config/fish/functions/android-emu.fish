function android-emu -d "The Android Emulator"
    QT_QPA_PLATFORM=xcb $ANDROID_SDK_ROOT/emulator/emulator $argv
end
