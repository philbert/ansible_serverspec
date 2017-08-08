# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "INFO: Testing role webapp/tasks/main.yml" do

  	describe "INFO: checking role webapp" do
        describe file('/webapps/webapp') do
            it { should be_directory }
            it { should be_owned_by 'webapp' }
            it { should be_grouped_into 'webapp' }
        end
  	end

  	describe "INFO: checking virtualenv exists" do
        describe file('/webapps/virtenv') do
            it { should be_directory }
            it { should be_owned_by 'webapp' }
            it { should be_grouped_into 'webapp' }
        end
  	end

  	describe "INFO: checking gunicorn service" do
        describe service('gunicorn') do
            it { should be_enabled }
            it { should be_running }
        end
    end
end



