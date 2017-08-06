{

  # currently we assume we are running on FHS system.
  tools = {
    bash = "/bin/bash";
    wget = "/usr/bin/wget";
    md5sum = "/usr/bin/md5sum";
  };

  system = "x86_64-linux"; # TODO: remove hardcoding
}
