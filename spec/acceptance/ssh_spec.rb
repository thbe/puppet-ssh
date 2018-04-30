require 'spec_helper_acceptance'

describe 'ssh' do
  it 'should apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end

  describe file('/etc/ssh.d') do
    it { should be_directory }
    it { should exist }
  end

  describe file('/etc/ssh/ssh_config') do
    it { should be_file }
    it { should exist }
  end

  describe file('/etc/ssh/sshd_config') do
    it { should be_file }
    it { should exist }
  end

  describe package('openssh-clients') do
    it { should be_installed }
  end

  describe package('openssh-server') do
    it { should be_installed }
  end

  describe service('sshd') do
    it { should be_enabled }
    it { should be_running }
  end
end
