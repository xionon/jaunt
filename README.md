# Jaunt

Jaunt is a code demo and review tool, that searches your codebase for specially tagged comments, then sorts and categorizes them.

Jaunt features multiple output modes, including Interactive, HTML, Markdown, and PDF.

## Simple Usage

First, add specially marked comments to your code.

```ruby
# :jaunt:
# This section of the code does something very interesting
def do_something_interesting
end

# :jaunt:
# This code does something else very interesting
def do_something_else_interesting
end
```

Then, run `jaunt` from the command line. This will give you a guided tour of the previously marked code snippets. Fun!

## Advanced Topics

- [Sorting jaunts](#sorting-jaunts)
- [Naming jaunts](#naming-jaunts)
- [Exporting jaunts](#exporting-jaunts)
- [Interactive jaunts](#interactive-jaunts)

### Sorting Jaunts

Jaunts can be sorted.

```ruby
# :jaunt-2:
# This jaunt appears second
def second
end

# :jaunt-1:
# This jaunt appears first
def first
end
```

### Naming jaunts

Jaunts can be named.

```ruby
# :jaunt:(second)
# This jaunt appears in the `second` jaunt
def second
end

# :jaunt:(first)
# This jaunt appears in the `first` jaunt
def first
end
```

You can invoke a specific jaunt by running `jaunt <name>`

### Exporting jaunts

Jaunts can be exported in many different formats using the `--format` argument. The default is `--format=interactive`.

Other formats:

- `--format=markdown` - Print GH-flavored markdown to STDOUT
- `--format=pull-request` - Print GH-flavored markdown with GH[E] compatable links to the files
- `--format=html` - Print HTML (that uses Pygments) to STDOUT

### Interactive jaunts

Jaunt can run a small server you can click through by running `jaunt --server`. This will bind on `http://localhost:4111` and automatically serve all availalbe jaunts.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jaunt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jaunt

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jaunt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

