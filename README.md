# Capistrano::services

services support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano3-service', '~> 0.1', :github => 'KingCrunch/capistrano3-service'
gem 'capistrano'
```

And then execute:

```bash
bundle
```

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/service'
```

You will get the following tasks

```bash
cap service:force-reload[service,role]  # force-reload service
cap service:reload[service,role]        # reload service
cap service:restart[service,role]       # restart service
cap service:start[service,role]         # start service
cap service:status[service,role]        # status service
cap service:stop[service,role]          # stop service
```

It's main purpose is to be used in custom `Capfile` tasks. 

```ruby
# Capfile
namespace :deploy do
    task :published do
        invoke "service:restart", "nginx", :app
        invoke "service:restart", "php5-fpm", :web
    end
end
```

