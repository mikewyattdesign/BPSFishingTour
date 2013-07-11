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

## Cloning production database

If you want a copy of the production database on your local machine:

1. Run `taps server sqlite://db/development.sqlite3 test test` in one
   terminal window
1. In a separate window, run `taps push postgres://urbsyouofqkpta:V1q0JqjGTikeWH2DtyTeNyQq86@ec2-54-235-194-252.compute-1.amazonaws.com:5432/dbohm023umngst http://test:test@localhost:9000`
   to push data from production into your local development database.
