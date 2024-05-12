{ config, xdg, ... }:
{
    xdg = {
        enable = true;
        cacheHome = config.home.homeDirectory + "/.local/cache";

        userDirs = {
            enable = true;
            createDirectories = true;

            extraConfig = {
                XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";

                XDG_DESKTOP_DIR = "$HOME/Desktop";
                XDG_DOWNLOAD_DIR = "$HOME/Downloads";
                XDG_TEMPLATES_DIR = "$HOME/Templates";
                XDG_PUBLICSHARE_DIR = "$HOME/Public";
                XDG_DOCUMENTS_DIR = "$HOME/Documents";
                XDG_MUSIC_DIR = "$HOME/Music";
                XDG_PICTURES_DIR = "$HOME/Pictures";
                XDG_VIDEOS_DIR = "$HOME/Videos";
            };
        };
    };
}