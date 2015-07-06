# Openfire Ruby Client

This is a ruby client for the [REST API plugin](http://www.igniterealtime.org/projects/openfire/plugins/restapi/readme.html
) for [Openfire](http://www.igniterealtime.org/projects/openfire/).

It is based on [Her](https://github.com/remiprev/her), takes care of the rather unusual JSON/XML reponses of the plugin, and provides Her::Models for the resources.

[![Build Status](https://travis-ci.org/GeneralScripting/openfire-ruby.svg)](https://travis-ci.org/GeneralScripting/openfire-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openfire-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install openfire-ruby

## Usage

Create a client:

    client = Openfire::Client.new('http://localhost:9090', 'secrettoken')

Access the User service:

    client.users.all.to_a

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/openfire-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

