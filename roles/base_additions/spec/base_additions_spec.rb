# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

packages = [
  'nginx',
  'git',
  'python3-pip',
  'ntpdate']

describe "INFO: Testing role base_additions/tasks/main.yml" do

    packages.each do|p|
      describe package(p) do
        it { should be_installed }
      end
    end

# pip3 not supported :(
#  	describe "INFO: checking installed packages" do
#        describe package('virtualenv') do
#            it { should be_installed.by('pip3') }
#        end
#  	end

# some weird encoding error?
#    describe "INFO: check timezone" do
#        describe file('/etc/localtime') do
#            its(:content) { should contain 'Etc/UTC' }
#        end
#    end
    
end
