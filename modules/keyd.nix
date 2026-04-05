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

          pagedown = "oneshot(shift)";

          leftcontrol = "oneshot(control)";
          rightcontrol = "oneshot(control)";

          leftshift = "oneshot(shift)";
          rightshift = "oneshot(shift)";

          leftalt = "oneshot(meta)";
        };
      };
    };
  };
}
