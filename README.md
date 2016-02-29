# Modules: BlueGreen

Mina module for [Blue Green Deployment](http://martinfowler.com/bliki/BlueGreenDeployment.html).

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
$ bundle exec mina blue_green
```

To run a command on either blue or green:

```shell
$ bundle exec mina green unicorn:start
```

Or:

```shell
$ bundle exec mina blue deploy
```

If you have `mina-multistage` installed then all commands will default to production environment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/reedlaw/mina-blue_green.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

