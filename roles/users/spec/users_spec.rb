# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'spec_helper'

describe "INFO: Testing role users/tasks/main.yml" do

  	describe "INFO: checking user webapp" do
        describe user('webapp') do
            it { should belong_to_group 'webapp' }
            it { should have_login_shell '/bin/bash' }
            it { should have_home_directory '/webapps' }
        end
  	end
end


