{
  services.picom = {
    enable = true;
    
    fade = true;
    fadeSteps = [
                  0.03
                  0.03
                ];
    fadeDelta = 3;

    opacityRules = [
      "80:class_g = 'kitty'"
    ];

    settings = {
      blur = {
        method = "dual_kawase";
        strength = 8.0;
        deviation = 1.0;
        kernel = "11x11gaussian";
      };
      blur-background = false;
      blur-background-frame = true;
      blur-background-fixed = true;

      daemon = true;
      dbus = false;

      log-level = "warn";
      log-file = "/home/eduardo/.cache/picom-log.log";
    };

    vSync = true;
    backend = "glx";
    wintypes = {
      tooltip = { fade = true; shadow = false; focus = false; };
      normal = { shadow = false; };
      dock = { shadow = false; };
      dnd = { shadow = false; };
      popup_menu = { shadow = true; focus = false; opacity = 0.90; };
      dropdown_menu = { shadow = false; focus = false; };
      above = { shadow = true; };
      splash = { shadow = false; };
      utility = { focus = false; shadow = false; blur-background = false; };
      notification = { shadow = false; };
      desktop = { shadow = false; blur-background = false; };
      menu = { focus = false; };
      dialog = { shadow = true; };
    };
  };
}