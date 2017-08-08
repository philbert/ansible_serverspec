# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "INFO: Testing role gunicorn/tasks/main.yml" do

  	describe "INFO: checking /run/gunicorn" do
        describe file('/run/gunicorn') do
            it { should be_directory }
            it { should be_mode 755 }
            it { should be_owned_by 'webapp' }
            it { should be_grouped_into 'webapp' }
        end
  	end

  	describe "INFO: checking /usr/lib/systemd/system" do
        describe file('/usr/lib/systemd/system') do
            it { should be_directory }
            it { should be_mode 755 }
            it { should be_owned_by 'root' }
            it { should be_grouped_into 'root' }
        end
  	end

    describe "INFO: checking /usr/lib/tmpfiles.d/var.conf" do
        describe file('/usr/lib/tmpfiles.d/var.conf') do
            its(:content) { should contain 'd /var/run/gunicorn 0755 webapp webapp -' }
        end
    end
end

