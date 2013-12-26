require 'spec_helper'

describe 'rustlang', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }

  context 'with no parameters' do
    it { should compile.with_all_deps }
    it { should include_class('apt') }
    it { should contain_package('rustlang').with_name('rust-0.8').with_ensure('present') }
    it { should contain_apt__ppa('ppa:hansjorg/rust') }
  end

  context 'with a custom package name' do
    let(:params) { {'package_name' => 'rust-0.7' } }
    it { should contain_package('rustlang').with_name('rust-0.7').with_ensure('present') }
  end

  context 'with another custom package name' do
    let(:params) { {'package_name' => 'rust-nightly' } }
    it { should contain_package('rustlang').with_name('rust-nightly').with_ensure('present') }
  end

  context 'with a custom ensure' do
    let(:params) { {'ensure' => 'absent' } }
    it { should contain_package('rustlang').with_ensure('absent') }
  end

  context 'with an invalid package name' do
    let(:params) { {'package_name' => 'invalid' } }
    it do
      expect {
        should contain_package('rustlang')
      }.to raise_error(Puppet::Error, /"invalid" does not match/)
    end
  end

  context 'with an invalid ensure' do
    let(:params) { {'ensure' => 'invalid' } }
    it do
      expect {
        should contain_package('rustlang')
      }.to raise_error(Puppet::Error, /"invalid" does not match/)
    end
  end

  context 'with an invalid distro name' do
    let(:facts) { {:osfamily => 'RedHat'} }
    it do
      expect {
        should contain_package('rustlang')
      }.to raise_error(Puppet::Error, /This module uses PPA repos/)
    end
  end

end
