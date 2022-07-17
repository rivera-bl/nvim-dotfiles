{
  pkgs,
  lib,
  ...
}: {
  vim-bufsurf = pkgs.vimUtils.buildVimPlugin rec {
    pname = "vim-bufsurf";
    version = "v0.3";
    src = pkgs.fetchFromGitHub {
      owner = "ton";
      repo = "vim-bufsurf";
      rev = "e6dbc7ad66c7e436e5eb20d304464e378bd7f28c";
      sha256 = "1nmpvnqlw4y2g1ki33nbj74vdnaxnaqshqv3238zxgvps44y3mw5";
    };
    meta.homepage = "https://github.com/ton/vim-bufsurf";
  };
}
