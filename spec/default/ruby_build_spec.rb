require 'spec_helper'

# git package
describe package('git') do
  it { should be_installed }
end

# rbenv install
describe command('source /etc/profile.d/rbenv.sh; which rbenv') do
  let(:disable_sudo) { true }
  its(:stdout) { should match %r{/usr/local/rbenv/bin/rbenv} }
end

# rbenv.sh
describe file('/etc/profile.d/rbenv.sh') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
  its(:content) { should match(/^export RBENV_ROOT="\/usr\/local\/rbenv"$/) }
  its(:content) { should match(/^export PATH="\${RBENV_ROOT}\/bin:\${PATH}"$/) }
  its(:content) { should match(/^eval "\$\(rbenv init --no-rehash -\)"$/) }
end

# ruby-build
describe file('/usr/local/rbenv/plugins') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe file('/usr/local/rbenv/plugins/ruby-build') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

# install ruby
describe command("source /etc/profile.d/rbenv.sh; rbenv versions | grep 2.2.2") do
  let(:disable_sudo) { true }
  its(:stdout) { should match(/2.2.2/) }
end

# global ruby
describe command('source /etc/profile.d/rbenv.sh; rbenv global') do
  let(:disable_sudo) { true }
  its(:stdout) { should match(/2.2.2/) }
end
