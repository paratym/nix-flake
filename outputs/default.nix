{ usrLib, ... }@args: {
  legacyPackages =
    usrLib.mergeRec [ (import ./fadedrya args) ];
}
