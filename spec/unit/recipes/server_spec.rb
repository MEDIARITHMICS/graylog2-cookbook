require 'spec_helper'

RSpec.describe 'graylog2::server' do
  before do
    stub_data_bag_item('secrets', 'graylog').and_return({
      'server' => {}
    })
  end

  context 'on an empty environment' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'ubuntu',
        version: '20.04'
      ).converge('graylog2::server')
    end

    it 'raise an error an informs the user to set at least password_secret and root_password_sha2' do
      expect { chef_run }.to raise_error("No password_secret set, either set it via an attribute or in the encrypted data bag in secrets.graylog")
    end
  end

  context 'when the cookbook installs Graylog on a Ubuntu system' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'ubuntu',
        version: '20.04'
      ) do |node|
        node.normal['graylog2']['password_secret'] = 'password_hash'
        node.normal['graylog2']['root_password_sha2'] = 'salt'
      end.converge('graylog2::server')
    end

    it 'installs the graylog-server package' do
      expect(chef_run).to install_package 'graylog-server'
    end

    it 'installs the graylog-enterprise-plugins package' do
      expect(chef_run).to install_package 'graylog-enterprise-plugins'
    end

    it 'installs the graylog-enterprise-integrations-plugins package' do
      expect(chef_run).to install_package 'graylog-enterprise-integrations-plugins'
    end

    it 'installs the graylog-integrations-plugins  package' do
      expect(chef_run).to install_package 'graylog-integrations-plugins'
    end

    it 'restart Graylog server service' do
      expect(chef_run).to enable_service 'graylog-server'
    end

    it 'creates a server configuration file' do
      expect(chef_run).to render_file('/etc/graylog/server/server.conf')
    end
    it 'creates a default environment file' do
      expect(chef_run).to render_file('/etc/default/graylog-server')
    end
    it 'creates a logging configuration' do
      expect(chef_run).to render_file('/etc/graylog/server/log4j2.xml')
    end
  end

  context 'when the cookbook installs Graylog on a Centos system' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(
        platform: 'centos',
        version: '8'
      ) do |node|
        node.normal['graylog2']['password_secret'] = 'password_hash'
        node.normal['graylog2']['root_password_sha2'] = 'salt'
      end.converge('graylog2::server')
    end

    it 'creates a default environment file' do
      expect(chef_run).to render_file('/etc/sysconfig/graylog-server')
    end
  end
end
