# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
     # inputs.mangowc.nixosModules.default
    ];

  # Enable sudo
  security.sudo = {
	enable = true;
	execWheelOnly = false;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "koku"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true; # powers up on boot
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable SDDM
  #services.xserver.displayManager.sddm.enable = true;
  #
  # Add entry to SDDM
  services.xserver.displayManager.sessionPackages = [ pkgs.mangowc ];

  # Enable Awesome
  #services.xserver.windowManager.awesome.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  # Enable XFCE
  services.xserver.desktopManager.xfce.enable = true;


  # Enable COSMIC
  #services.desktopManager.cosmic.enable = true;
  # Enable COSMIC greeter
  # services.displayManager.cosmic-greeter.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.punkforpez = {
    isNormalUser = true;
    description = "punkforpez";
    extraGroups = [ "networkmanager" "wheel" "boinc" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
    shell = pkgs.zsh;
  };


  # Install firefox.
  # programs.firefox.enable = true;

  # Hyprland Setup
  programs.hyprland.enable = true;

  # Niri
  programs.niri.enable = true;
  programs.xwayland.enable = true;

  # Sway Setup
  programs.sway = {
	enable = true;
	wrapperFeatures.gtk = true;
  };

  
  # Enable ZSH
  #programs.zsh.enable = true;
  #programs.zsh.autosuggestions.enable;
  #users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
  	enable = true;
  	autosuggestions.enable = true;
  	#ohMyZsh.enable = true;
  	#ohMyZsh.plugins = [ "git" ];
  	#ohMyZsh.theme = "frisk";
  	syntaxHighlighting.enable = true;
  };

  # For Firefox's Progressive Web Apps Extension
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

  # Fix GTK issues in Hyprland/Sway
  programs.dconf.profiles.user.databases = [
    {
	settings."org/gnnome/desktop/interface" = {
	  gtk-theme = "Breeze-Dark";
	  icon-theme = "Kora";
	  font-name ="Noto Sans 12";
	  document-font-name = "Adwaita Sans 12";
          monospace-font-name = "Hack 12";
         };
    }
   ];


  #MangoWC
  #programs.mango.enable = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #vim
	htop
	git
	fastfetch
	ghostty
	#featherpad
	#python3Full
	fzf
	pkgs.kitty
	#rofi-wayland
	rofi
	pkgs.btop
	killall
	pkgs.bat
	wl-clipboard # clipboard manager in Sway
	waybar
	#swayrbar
	hyprpaper
	nerd-fonts.hack
	pamixer
	brightnessctl
	hyprsunset
	hyprlock
  hyprshot
	nwg-look
	dconf
	dconf-editor
	kdePackages.qt6ct
	transmission_4-gtk
	swaybg
	wlroots_0_19
	gammastep
	redshift
	geoclue2
	neovim
	wezterm
	tmux
	pavucontrol
	dysk
	gnome-calendar
	xwayland-satellite
  obsidian
	#todoist-electron
	gcc
	fuzzel
	pyright
	#sway
	swayfx
	wlsunset
	#brightnessctl
	wget
	unzip
	#joplin-desktop
	mission-center
	cmatrix
	kde-rounded-corners
	xclicker
	nerd-fonts.jetbrains-mono
	wget
	#rustup
	cargo
	rust-analyzer
	gcc
	openssl
	steam-run
	helix
	lldb
	lazygit
	xivlauncher
  cmake
  extra-cmake-modules
  gnumake42
  vicinae
  scenefx
  mangowc
	#pkgs.firefoxpwa # for Progressive Web App extension
  ];

nixpkgs.config.permittedInsecurePackages = [
  "broadcom-sta-6.30.223.271-59-6.12.63"
];
 
 # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.flatpak.enable = true;
  services.mullvad-vpn.enable = true; 
  #services.mullvad-vpn.package = pkgs.mullvad-vpn;
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
