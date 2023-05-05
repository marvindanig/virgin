require 'spec_helper'
require 'generators/virgin/install_generator'

describe Virgin::Generators::InstallGenerator do
  destination File.expand_path("../../../dummy_generator", __FILE__)

  before {prepare_destination}

  describe 'presence of virgin configuration file' do
    before do
      @env_available = ["virgin_env", "staging", "production"]
      create_fake_env
      create_routes_rb
      run_generator
    end

    ["virgin_env", "staging", "production"].each  do |env|
       describe 'config/virgins/#{env}.txt' do
        subject { file("config/virgins/#{env}.txt") }
        it { is_expected.to exist }
        it { is_expected.to contain "User-Agent: *" }
        it { is_expected.to contain "Disallow: /" }
      end
    end

    describe 'config/routes.rb' do
      subject { file('config/routes.rb') }
      it { is_expected.to exist }
      it { is_expected.to contain "mount_virgin" }
    end
  end

  def create_routes_rb
    routes = File.expand_path("../../../dummy/config/routes.rb", __FILE__)
    destination = File.join(destination_root, "config")
    FileUtils.mkdir_p(destination)
    FileUtils.cp routes, destination
  end

  def create_fake_env
    destination = File.join(destination_root, "config/environments")
    FileUtils.mkdir_p(destination)
    @env_available.each {|env|  FileUtils.touch(destination_root + "/config/environments/#{env}.rb")}
  end
end