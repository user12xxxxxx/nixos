{ ... }:

{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "2m";
      search_mode = "fuzzy";
      enter_accept = false;
      filter_mode = "global";
    };
  };
}