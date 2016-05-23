# POLITICO RSS - Ruby

A ruby interface to [POLITICO RSS feeds](http://www.politico.com/rss). Includes feed contents and metadata.

## Installation

Add `gem 'politico_rss'` to your Gemfile and run `bundle install`, or install with:

```` sh
gem install politico_rss
````

## Usage

Get feed contents and metadata.

```` rb
feed = PoliticoRSS.feed("playbook")
````

> NOTE: you can find the feed's name (e.g. `playbook`) from its URL (e.g. `http://www.politico.com/rss/playbook.xml`). A full list of known feed names is maintained in `spec/politico_rss_spec.rb`.

## Development

```` sh
git clone git@github.com:debate-watch/politico-rss-ruby.git
cd politico_rss/
````

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/debate-watch/politico-rss-ruby.

## Maintenance

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Run `bundle exec yard doc` to parse comments and/or `bundle exec yard server` to view documentation at `localhost:8808`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
