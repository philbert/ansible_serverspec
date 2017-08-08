# Testing your ansible playooks with serverspec

## Dependencies (last tested working versions):
  - vagrant 2.0.3
  - ansible 2.6.3
  - python 3.7
  - ruby 2.4.1
  - bundler 1.15.3

## The webapp details:
  - `vagrant up` should bring up the app on http port 80 at `http://10.10.10.20`
  - Ansible is used as the provisioner (version 2.3.1.0) and the following property must be set in .ansible.cfg: 
      `ansible_python_interpreter=/usr/bin/python3` due to the vagrant box (ubuntu/xenial64) only coming with python3
  - nginx installed as reverse proxy forwarding traffic from 0.0.0.0:80 to localhost:5000
  - The app is using [this github repo](https://github.com/philbert/sample_flask_app.git)
  - The app is started using gunicorn running as a service under systemd and should automatically restart if killed
  - logs from nginx and gunicorn write to syslog and are viewable using journalctl and rotated by journald

## Running serverspec tests:
  - You need to [bundle install](https://bundler.io/bundle_install.html) the gems from the Gemfile before running the tests
  - Under each role are serverspec tests which can be run with the command `rake all`
  - You can see the available serverspec tasks for each role by running `rake -T`
  - The code uses a gem called [ansible_spec](https://github.com/volanja/ansible_spec) to connect the serverspec test to the ansble roles that get executed by rspec
  - If you want to produce junit formatted xml reports from the tests for CI like jenkins you can [enable this line](https://github.com/philbert/ansible_serverspec/blob/master/Rakefile#L36)

## Here are my test results:

Results for base-playbook
```
Finished in 0.8686 seconds (files took 0.65345 seconds to load)
24 examples, 0 failures
```

Results for webapp-playbook
```
Finished in 0.54631 seconds (files took 0.36219 seconds to load)
8 examples, 0 failures
```
