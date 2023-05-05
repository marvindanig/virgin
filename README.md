# Virgin
Serve a static file without fingerprinting.

## Installing
Add it to your Gemfile:

```ruby
gem 'virgin'
```

After installation you need to run the generator:

```ruby
$ rails generate virgin:install
```

If you already have virgins.txt, it will be kept for your production environment in config/virgins/production.txt

You can now list environment-specific assets in config/virgins/. By default crawlers are disallow from accessing your site has been made for all your environments.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

