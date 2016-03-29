# Modules: BlueGreen

[![Gem Version](https://badge.fury.io/rb/mina-blue_green.svg)](https://badge.fury.io/rb/mina-blue_green)

[Mina](https://github.com/mina-deploy/mina) module for [Blue Green Deployment](http://martinfowler.com/bliki/BlueGreenDeployment.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-blue_green', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-blue_green

## Usage

Require `mina/blue_green` in your `config/deploy.rb`:

```rb
require 'mina/blue_green'

set :blue, '198.51.100.1' # Use an IP address
set :green, 'example.com' # or domain name

...

task setup: :environment do
  ...
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  ...
end
```

Then run:

```shell
$ bundle exec mina blue status
```

You can run commands on either blue or green:

```shell
$ bundle exec mina green unicorn:start
```

Or:

```shell
$ bundle exec mina blue deploy
```

With `mina-multistage`:

```shell
$ bundle exec mina production green deploy
```

# Suggestions for use with AWS

This requires two EC2 instances (blue and green) and two ELBs (production and staging). The production ELB's health check gets a healthy response when an instance is running in production. Likewise, the staging ELB points to an endpoint that only responds healthily when an instance is running in staging. In this way, by promoting an instance to production it will automatically go live. If no staging environment is needed, both blue and green can be run in production mode and the ELB will balance their load.

# Switching environments

If you're running unicorn you need to stop it first:

```shell
$ bundle exec mina blue unicorn:stop
```

```shell
$ bundle exec mina staging blue deploy
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reedlaw/mina-blue_green.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

