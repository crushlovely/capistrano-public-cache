# capistrano-public-cache

Cache dynamic pages into your public folder on deploy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-public-cache'
```

And then execute:

``` bash
$ bundle
```

Or install it yourself as:

``` bash
$ gem install capistrano-public-cache
```

## Usage

Require in `Capfile` to use the default task:

``` ruby
require 'capistrano/public-cache'
```

The task will run after `deploy:published` as part of Capistrano's default deploy, or can be run in isolation with `cap public_cache:build`

Configurable options:

``` ruby
set :public_cache_roles, :web       # this is default
set :public_cache_base_url, ''      # this is default
set :public_cache_curl_flags, '-sS' # this is default
set :public_cache_files, {}         # this is default
```

Some notes about configuration:

* Leaving `:public_cache_base_url` and `:public_cache_files` as their default values will result in nothing happening when the task is run.
* `:public_cache_base_url` should be set to the base URL of your application, e.g. `http://youapp.com`, `http://localhost:5000`, etc.
* `:public_cache_files` should be a hash where the keys are the source path of the content you want to cache and the values are the file path (relative to your deployment's public directory) where you want it cached.
* `:public_cache_curl_flags` can be a string of flags to pass through to `curl`. The default is `-sS`, which keeps curl silent except when failure occurs.

## Why?

We like to [manage our application's error pages within Rails](https://github.com/crushlovely/exceptionally_beautiful), but it's also a good idea to have static versions available for the web server to use too. As such, our configuration usually looks like this:

``` ruby
set :public_cache_files, '/errors/403' => '403.html',
                         '/errors/404' => '404.html',
                         '/errors/422' => '422.html',
                         '/errors/502' => '502.html',
                         '/errors/500' => '500.html'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
