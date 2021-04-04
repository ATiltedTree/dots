function setup-android -d "Setup Android SDK"
    if test -e $ANDROID_SDK_ROOT
        echo "SDK already installed!"
        return 1
    end

    echo "Setting up Andoid SDK"

    set URL "https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip"
    mkdir -p $ANDROID_SDK_ROOT
    curl -fL "$URL" -o - | bsdtar -x -C $ANDROID_SDK_ROOT

    echo "Installed base SDK"
    echo "Updating SDK..."

    sdkmanager --update

    echo "Updated SDK"

    echo "Finished basic setup!"
end
