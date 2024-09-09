{
  description = "A flake creating an environment with a lot of hacking tools available";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
      pkgs.mkShell {
        packages = with pkgs; [
          ### General utils ###
          bat
          ranger

          ### Exploitation ###
          metasploit
          sqlmap

          ### Forensics ###
          capstone
          ddrescue
          ext4magic
          extundelete
          ghidra-bin
          git
          p0f
          pdf-parser
          python39Packages.binwalk
          python39Packages.distorm3
          sleuthkit

          ### Hardware ###
          apktool

          ### Recon ###
          cloudbrute
          dnsenum
          dnsrecon
          enum4linux
          hping
          masscan
          netcat
          nmap
          # ntopng  -> breaks
          # sn0int  -> breaks
          sslsplit
          theharvester
          wireshark
          # wireshark-cli

          ### Backdoors ###
          httptunnel
          pwnat

          ### Passwords ###
          brutespray
          chntpw
          crowbar
          crunch
          hashcat
          hcxtools
          john
          # python36Packages.patator
          phrasendrescher
          thc-hydra

          ### Reverse ###
          binutils
          elfutils
          jd-gui
          jd-cli
          patchelf
          radare2
          radare2-cutter
          retdec
          snowman
          valgrind
          yara

          ### Sniffing ###
          bettercap
          dsniff
          mitmproxy
          rshijack
          sipp
          sniffglue

          ### Vuln analisys ###
          grype
          lynis
          sqlmap
          vulnix

          ### Web ###
          # burpsuite
          dirb
          gobuster
          urlhunter
          wfuzz
          # wpscan
          zap
        ];
        shellHook = ''
          exec zsh
        '';
      };
  };
}
