require 'spec_helper'

%w(
  pkgconfig
  glib2-devel
  gettext
  libxml2-devel
  pango-devel
  cairo-devel
  mplus-2p-fonts
).each do |name|
  describe package(name) do
    it { should be_installed }
  end
end

describe user('growthforecast') do
  it { should exist }
  it { should have_home_directory '/home/growthforecast' }
end

describe group('growthforecast') do
  it { should exist }
end

describe file('/home/growthforecast/.plenv') do
  it { should be_directory }
end

describe file('/home/growthforecast/.plenv/plugins/perl-build') do
  it { should be_directory }
end

describe file('/home/growthforecast/.bash_profile') do
  it { should contain 'plenv init -' }
end

describe file('/home/growthforecast/.plenv/version') do
  it { should contain '5.18.1' }
end

describe file('/home/growthforecast/.plenv/shims/growthforecast.pl') do
  it { should be_file }
end
