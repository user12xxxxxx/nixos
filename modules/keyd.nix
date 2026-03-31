{ ... }:

{
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Serial Keyboards]
    MatchUdevType=keyboard
    MatchName=keyd virtual keyboard
    AttrKeyboardIntegration=internal
  '';
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "overload(control,esc)";
          
          # pagedown = "oneshot(leftshift)";
          pagedown = "oneshot(shift)";

          leftcontrol = "oneshot(control)";
          rightcontrol = "oneshot(control)";

          leftshift = "oneshot(shift)";
          rightshift = "oneshot(shift)";

          leftalt = "overload(meta,toggle(l1))";
        };
        l1 = {
          t = "1";
          g = "2";
          b = "3";
          r = "4";
          f = "5";
          v = "6";
          d = "backspace";
          e = "8";
          c = "7";
          s = "0";
          w = "9";

          y = "+";
          u = "-";
          i = "*";
          o = "/";
          ";" = "=";

          n = "home";
          m = "end";
          h = "left";
          j = "down";
          k = "up";
          l = "right";
        };
      };
    };
  };
}
