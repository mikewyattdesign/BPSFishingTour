# BPS Fishing Tour

* JIRA URL: https://group360.atlassian.net/browse/FISHING
* Bitbucket URL: https://bitbucket.org/group360/bps-fishing-tour
* Development URL: https://fishing-tour-dev.herokuapp.com/
* Production URL: https://fishing-tour.herokuapp.com/

## Dependencies

This project requires Ruby 2.0, so if you don't already have at least
2.0.0-p0, please install it via rvm or rbenv.  To install gem
dependencies, you'll need to run `gem install bundler` if you don't
already have bundler installed.  This also depends on `bower` to install
client-side dependencies.  If you don't have bower, run
`npm install -g bower`

## Setup

1. `cd` to the project in your terminal.
1. Run `bundle install` to grab dependencies.
1. Run `bower install` to grab client-side dependencies.

## Development

1. Run `rails s` in the terminal to start the server.
1. Run `guard` to have the RSpec tests auto-run as you develop.
