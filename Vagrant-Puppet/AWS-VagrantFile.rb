Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.box = "ubuntu_awss"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"

  config.puppet_install.puppet_version = :latest
  #config.puppet_install.puppet_version = "2.7.11"
  #config.puppet_install.install_url = 'http://acme.com/install.sh'

  config.vm.provider :aws do |aws, override|
    aws.access_key_id = "SEU_ACCESS_KEY_ID"
    aws.secret_access_key = "SEU_SECRET_ACCESS_KEY"

    aws.keypair_name = "devops"
    aws.ami = "SEU_AMI_AQUI"
    aws.security_groups = ['devops']

    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = "devops.pem"
  end

  config.vm.define :web do |web_config|
    web_config.vm.network "private_network", ip: "192.168.50.10"
    web_config.vm.provision "shell", path: "manifests/bootstrap.sh"

    web_config.vm.provision "puppet" do |puppet|
    puppet.manifest_file = "web.pp"
    end

    web_config.vm.provider :aws do |aws|
      aws.tags = { 'Name' => 'music-jungle'}
    end
  end

end