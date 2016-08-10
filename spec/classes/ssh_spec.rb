require 'spec_helper'

describe 'ssh', :type => :class do

  context 'with defaults for all parameters' do
    it { should contain_class('ssh') }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('ssh::params') }
      it { is_expected.to contain_class('ssh::install') }
      it { is_expected.to contain_class('ssh::config') }
      it { is_expected.to contain_class('ssh::service') }

      it { is_expected.to contain_package('openssh-clients').with_ensure('installed') }
      it { is_expected.to contain_package('openssh-server').with_ensure('installed') }

      it { is_expected.to contain_file('/etc/ssh/ssh_config').with_ensure('file') }
      it { is_expected.to contain_file('/etc/ssh/sshd_config').with_ensure('file') }

      it { is_expected.to contain_file('/etc/ssh.d').with_ensure('directory') }

      it { is_expected.to contain_service('sshd').with( 'ensure' => 'running', 'enable' => 'true') }

      it { is_expected.to contain_file('/etc/ssh.d/vagrant').with_ensure('file') }
      it 'should generate valid content for authorized keys file vagrant' do
        content = catalogue.resource('file', '/etc/ssh.d/vagrant').send(:parameters)[:content]
        expect(content).to match('qm8tehUc9c9WhQ== vagrant insecure public key')
      end

      case facts[:osfamily]
      when 'RedHat'
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end
