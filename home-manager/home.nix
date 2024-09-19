{ config, pkgs, ... }:

{
  imports = [
    ./dconf.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "michal";
    homeDirectory = "/home/michal";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      atuin
      bat
      curl
      file
      fzf
      git
      neovim
      ripgrep
      tldr
      tmux
      #stablePkgs.yazi
      yazi

      nerdfetch
      # pkgs.kitty - doesn't work when installed using nix - https://github.com/NixOS/nixpkgs/issues/80936

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/michal/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      # EDITOR = "emacs";
    };
  };

  # Home manager configuration options
  # https://nix-community.github.io/home-manager/options.xhtml

  # Example of downloading theme
  # programs.bat.themes = {
  #   kanagawa = {
  #     src = pkgs.fetchFromGitHub {
  #       owner = "obergodmar";
  #       repo = "kanagawa-tmTheme"; # Bat uses sublime syntax for its themes
  #       rev = "edb1e41256421a7b26348c80146bcff2c3e37f34";
  #       sha256 = "5Gj0Jz6UUm55v5d7V7E89ujUDSn0aGsZrOMS5FXduAE=";
  #     };
  #     file = "Kanagawa.tmTheme";
  #   };
  # };

  programs.bat = {
    enable = true;
    config = {
      theme = "Dracula";
    };
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      style = "compact";
      inline_height = 60;
      search_mode_shell_up_key_binging = "directory";
      filter_mode_shell_up_key_binding = "directory";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
