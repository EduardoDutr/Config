{pkgs, ...}:

{
  programs.kitty = {
    enable = true;
    theme = "Dark Pride";
    font = {
      name = "DroidSansMono";
      size = 17;
    };
    settings = {
      window_padding_width = 5;
    };
    shellIntegration.enableZshIntegration = true;
  };
}