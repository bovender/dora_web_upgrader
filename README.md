# Dora Web Upgrader

**Dora Web Upgrader is a [Rails] [engine] that facilitates upgrading a
[dora]-powered Rails application via webhooks.**

[dora], short for *Do*cker container for *Ra*ils applications, is my
collection of utilities that I use to containerize my Rails applications.

I use web hooks to trigger upgrades from within the container whenever I push
code to the main branch.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dora_web_upgrader', github: 'bovender/dora_web_upgrader', branch: 'main'
```

And then execute:

```bash
bundle
```

## Usage

### Configuring the engine

### Configuring the web hook

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[dora]: https://github.com/bovender/dora
[engine]: https://guides.rubyonrails.org/engines.html
[Rails]: https://rubyonrails.org
