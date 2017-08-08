# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "INFO: Testing role nginx/tasks/main.yml" do

  	describe "INFO: checking /etc/nginx/nginx.conf" do
        describe file('/etc/nginx/nginx.conf') do
            it { should be_file }
            it { should be_mode 644 }
            it { should be_owned_by 'root' }
            it { should be_grouped_into 'root' }
        end
  	end

  	describe "INFO: checking nginx service" do
        describe service('nginx') do
            it { should be_enabled }
            it { should be_running }
        end
  	end
end

