{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "user12xxxxxx";
        email = "nauteshkanojiya@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}