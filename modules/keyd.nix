{ ... }:

{
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = { 
          capslock = "overload(control,esc)"; 
          esc = "capslock";
          control = "oneshot(control)";
          shift = "oneshot(shift)";
          leftalt = "overload(meta,toggle(l1))";
        };
        l1 = {
          t = "1";
          g = "2";
          b = "3";
          r = "4";
          f = "5";
          v = "6";
          d = "9";
          e = "8";
          c = "7";
          s = "0";
          # s = ""
          
          y = "+";
          u = "-";
          i = "*";
          o = "/";
          enter = "=";
          
          h = "left";
          j = "down";
          k = "up";
          l = "right";
        };
      };
    };
  };
}