#!/usr/bin/env bash
# exit on error
set -o errexit

# Explicitly install and use Ruby 3.2.2
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 3.2.2
rvm use 3.2.2

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean