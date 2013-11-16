require 'spec_helper'

describe yumrepo('epel') do
  it { should exist }
  it { should be_enabled }
end

describe yumrepo('nginx') do
  it { should exist }
  it { should be_enabled }
end

describe yumrepo('treasuredata') do
  it { should exist }
  it { should be_enabled }
end
