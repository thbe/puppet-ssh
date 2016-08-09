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

      let(:params) {
        {
          :authorized_keys => { 'hugo' => 'ssh-rsa AAAAB3CP3NOTd0jMZEnDkbUvxhMmBYSd== hugo@demo.local.domain', }
        }
      }

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('ssh::params') }
      it { is_expected.to contain_class('ssh::install') }
      it { is_expected.to contain_class('ssh::config') }
      it { is_expected.to contain_class('ssh::service') }

      it { is_expected.to contain_package('openssh-clients').with_ensure('installed') }
      it { is_expected.to contain_package('openssh-server').with_ensure('installed') }

      it { is_expected.to contain_file('/etc/ssh/ssh_config').with_ensure('file') }
      it { is_expected.to contain_file('/etc/ssh/sshd_config').with_ensure('file') }
      it { is_expected.to contain_file('/etc/ssh/ssh_known_hosts').with_ensure('file') }

      it { is_expected.to contain_file('/etc/ssh.d').with_ensure('directory') }

      it 'should generate valid content for authorized keys file vagrant' do
        content = catalogue.resource('file', '/etc/ssh.d/vagrant').send(:parameters)[:content]
        expect(content).to match('ssh-rsa AAAAB3CP3NOTd0jMZEnDkbUvxhMmBYSd== hugo@demo.local.domain')
      end

      case facts[:osfamily]
      when 'RedHat'
      else
        it { is_expected.to contain_warning('The current operating system is not supported!') }
      end
    end
  end
end
