platform "el-8-aarch64" do |plat|
  plat.servicedir "/usr/lib/systemd/system"
  plat.defaultdir "/etc/sysconfig"
  plat.servicetype "systemd"

  packages = %w(autoconf automake createrepo gcc gcc-c++ rsync cmake make rpm-libs rpm-build libarchive)
  plat.provision_with "dnf install -y --allowerasing #{packages.join(' ')}"
  plat.install_build_dependencies_with "dnf install -y --allowerasing "
  plat.vmpooler_template "redhat-8-arm64"
  plat.docker_image "redhat/ubi8:latest"
end
