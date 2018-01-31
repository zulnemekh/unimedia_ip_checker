# unimedia_ip_checker

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unimedia_ip_checker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unimedia_ip_checker

## Usage

```ruby
step 1:
 
 create before filter in ApplicationController 

 before_filter :check_ip_block

step 2: 
  
  create check_ip_block method in ApplicationController 

  def check_ip_block
    require 'ip_checker.rb'
    # admin is current project name
    ip=IpChecker.new('admin') 
      unless ip.is_allow_myip(request)
       render(:file => "#{Rails.root.to_s}/public/403.html",:status => 403.6, :layout => false)
       return
      end   
  end

step 2: 

 create 403.html file in public folder

  <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
  <html><head>
  <title>403 Forbidden</title>
  </head><body>
  <h1>Forbidden</h1>
  <p>You don't have permission to access /
  on this server.</p>
  <hr>
  <address></address>
  </body></html>

```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zulnemekh/unimedia_ip_checker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [Unimedia Solutions License](http://unimedia.mn).

