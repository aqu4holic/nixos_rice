{ config, xdg, pkgs, ... }:
{
    home.packages = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        gnome-keyring
    ];

    xdg = {
        cacheHome = config.home.homeDirectory + "/.local/cache";
        enable = true;

        userDirs = {
            enable = false;
            createDirectories = false;
        };

        portal = {
            enable = true;
            xdgOpenUsePortal = true;

            extraPortals = with pkgs; [
                xdg-desktop-portal
                xdg-desktop-portal-gtk
                gnome-keyring
            ];

            config = {
                common = {
                    default = [ "gtk" ];
                    "org.freedesktop.impl.portal.Secret" = [
                        "gnome-keyring"
                    ];
                };
            };
        };

        # mime
        # mime.enable = true;
        # mimeApps = {
        #     enable = true;
        #     assosiations.added =
        # };
    };

    xdg.configFile."mimeapps.list" = {
        source = ./mimeapps.list;
        recursive = true;
    };
}
