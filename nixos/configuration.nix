# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, options, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./laptop.nix
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
  };
  
  boot.kernelParams = [ "quiet"];

  #boot.initrd.kernelModules = [ "amdgpu" ];

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # Easiest to use and most distros use this by default.
  networking.networkmanager.enable = true;  
  networking.networkmanager.dispatcherScripts = [
    {
      source = pkgs.writeText "09-timezone" ''
	case "$2" in
	  up)
	    timedatectl set-timezone "$(/run/current-system/sw/bin/curl --fail https://ipapi.co/timezone)"
	    ;;
	esac
	'';
    }
  ];
  # Set your time zone.
  #time.timeZone = "America/Los_Angeles";
  time.hardwareClockInLocalTime = true;
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "all"
  ];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  nix.settings = {
    substituters = [
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  hardware.keyboard.qmk.enable = true;

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services = {
      greetd.enableGnomeKeyring = true;
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      hyprlock.u2fAuth = true;
      greetd.u2fAuth = true;
    };
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services = {
    gnome.gnome-keyring.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    automatic-timezoned.enable = true;
    udev.packages = [ pkgs.yubikey-personalization pkgs.via ];
    xserver.desktopManager.runXdgAutostartIfNone = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    greetd = {
      enable = true;
      settings = {
	default_session = {
	  command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
	  user = "greeter";
	};
      };
    };
  };
  # Enable sound.
  sound.enable = true;
  # Enable virt-manager
  virtualisation.libvirtd.enable = true;
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;
  users.defaultUserShell = pkgs.zsh;
  users.users.root = {
    home = "/root";
    initialHashedPassword = "$6$Ynp7xmWMdHNfvs1i$nA6gKObMUGjKG2wERLggHchmya0TMyDDzs2nr.8/vtrrGT/P9QbJDFmNbemcCykE9vkZDbtt993kMMKndMsvg.";
  };
  users.users.hyoon = {
    useDefaultShell = true;
    isNormalUser = true;
    home = "/home/hyoon";
    extraGroups = [ 
      "wheel" 
      "networkmanager" 
      "libvirtd" 
    ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$Nv2vzi2yJnd.o1Ii$YqM6Z20xmFp3QuK1oX8j3rqoNNIaoP0GafGtTh4Asztw18GBygOECpWS2NnjnM0TpchVlGlytAVukFZx7a40S.";
    packages = with pkgs; [
    ];
  };


  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.hyoon = { pkgs, ... }: {
    home.packages = [];

    gtk = {
      enable = true;
      iconTheme = {
	name = "Colloid";
	package = pkgs.colloid-icon-theme;
      };
      cursorTheme = {
	name = "phinger-cursors-light";
	package = pkgs.phinger-cursors;
	size = 28;
      };
    };
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
    };

    programs.neovim.plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      initExtra = "source ~/.p10k.zsh";
      plugins = [
	  { 
	    name = "powerlevel10k";
	    src = pkgs.zsh-powerlevel10k;
	    file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
	  }
      ];
    };

    home.stateVersion = "24.05";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    TERMINAL = "wezterm";
    EDITOR = "nvim";
  };
  environment.variables = {
    XCURSOR_PATH = lib.mkDefault "${config.system.path}/share/icons";
  };

  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk
    fira-code-nerdfont
    nerdfonts
    font-awesome
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      unstable = import <nixos-unstable> {
	config = config.nixpkgs.config;
      };
    };
  };
  programs = {
    zsh.enable = true;
    xfconf.enable = true;
    seahorse.enable = true;
    virt-manager.enable = true;
    nix-ld.enable = true;
    git.enable = true;
    hyprlock.enable = true;
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    gnupg.agent = {
       enable = true;
       enableSSHSupport = true;
     };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
	thunar-volman
	thunar-archive-plugin
	thunar-media-tags-plugin
      ];
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
  environment.systemPackages = with pkgs; [
    wget
    brave
    bitwarden-desktop
    yubioath-flutter
    yubikey-manager
    yubikey-manager-qt
    pam_u2f
    btop
    librewolf
    thunderbird
    protonmail-bridge
    via
    rofi-wayland
    wezterm
    waybar
    networkmanagerapplet
    pavucontrol
    polkit_gnome
    wl-clipboard
    hyprpaper
    grim
    slurp
    ferdium
    vesktop
    dunst
    texliveFull
    zig
    zls
    opam
    qmk
    unzip
    blanket
    ventoy
    colloid-icon-theme
    phinger-cursors
    numix-icon-theme
    vimix-cursors
    capitaine-cursors
  ];

  systemd = {
    user.services.polit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
	ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
	Restart = "on-failure";
	RestartSec = 1;
	TimeoutStopSec = 10;
      };
    };
  };



  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}
