{ config, lib, pkgs, ... }:

{
  services.thermald.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNER_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "blance_power";
      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
      
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  services.asusd = {
    enable = true;
    enableUserService = true;
  };

  programs.rog-control-center = {
    enable = true;
    autoStart = true;
  };
  
  specialisation = {
    nvidia.configuration = {
      boot.initrd.kernelModules = [ "nvidia" ];
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.opengl = {
	enable = true;
	driSupport = true;
	driSupport32Bit = true;
      };

      hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
      hardware.nvidia.modesetting.enable = true;
      hardware.nvidia.nvidiaSettings = true;

      hardware.nvidia.prime = {
	sync.enable = true;
	nvidiaBusId = "PCI:1:0:0";
	intelBusId = "PCI:0:2:0";
      };
    };
  };

  environment.systemPackages = with pkgs; [
  ];

}
