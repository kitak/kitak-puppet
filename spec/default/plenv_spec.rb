require 'spec_helper'

describe file('/home/vagrant/.plenv') do
  it { should be_directory }
end

describe file('/home/vagrant/.plenv/plugins/perl-build') do
  it { should be_directory }
end

describe file('/home/vagrant/.bash_profile') do
  it { should contain 'plenv init -' }
end
