{ config, pkgs, libs, ... }:

{
    # Packages that should be installed to the user profile.
    home.packages = with pkgs; [
        # here is some command line tools I use frequently
        # feel free to add your own or remove some of them

        # archives
        zip
        xz
        unzip
        p7zip
        rar
        unar

        # utils
        ripgrep # recursively searches directories for a regex pattern
        jq # A lightweight and flexible command-line JSON processor
        eza # A modern replacement for ‘ls’
        fzf # A command-line fuzzy finder
        fd
        bat
        zoxide

        ffmpeg
        poppler
        ffmpegthumbnailer

        # networking tools
        mtr # A network diagnostic tool
        iperf
        dnsutils  # `dig` + `nslookup`
        ldns # replacement of `dig`, it provide the command `drill`
        aria2 # A lightweight multi-protocol & multi-source command-line download utility
        socat # replacement of openbsd-netcat
        nmap # A utility for network discovery and security auditing
        ipcalc  # it is a calculator for the IPv4/v6 addresses

        # misc file manipulator
        file
        which
        tree
        lshw
        trash-cli # trash folder manipulator
        duf # disk viewer
        dua
        navi

        # misc
        cowsay
        lolcat
        fortune-kind

        # misc ui
        kdePackages.spectacle # screenshot tool
        kdePackages.okular # pdf viewer
        catppuccin-gtk # gtk theme
        pavucontrol # volume control
        pinta # img manipulator
        qimgv # img viewer
        inkscape # svg manipulator
        qalculate-gtk # calculator
        simplescreenrecorder # screen recorder
        screenkey # display keys pressed on screen

        copyq
        imagemagick
        xclip
        maim
        redshift
        syncthing

        # yazi
        atool
        xlsx2csv
        # mupdf
        mupdf-headless
        pandoc
        exiftool
        ueberzugpp

        # app
        obsidian
        vesktop
        zotero
        telegram-desktop
        mpv
        # wpsoffice

        # nix related
        #
        # it provides the command `nom` works just like `nix`
        # with more details log output
        nix-output-monitor
        nix-prefetch-github

        # monitoring
        btop  # replacement of htop/nmon
        htop
        iotop # io monitoring
        iftop # network monitoring
        nvtopPackages.panthor

        # system call monitoring
        strace # system call monitoring
        ltrace # library call monitoring
        lsof # list open files

        # system tools
        ethtool
        pciutils # lspci
        usbutils # lsusb
        # toybox

        # libs
        conda
        xorg.xhost
        clang-tools
    ];

    programs = {
        jq.enable = true; # A lightweight and flexible command-line JSON processor
        feh.enable = true; # image viewer
        zoxide.enable = true;
    };

    services = {
        network-manager-applet.enable = true;
        copyq.enable = true;
    };
}