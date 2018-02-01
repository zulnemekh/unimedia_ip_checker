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

This is 

step 1:
 
 create before filter in ApplicationController 
```ruby
 before_filter :check_ip_block
```
step 2: 
  
  create check_ip_block method in ApplicationController 
```ruby
  def check_ip_block
    # admin is current project name
    ip=IpChecker.new(IP_CHECKER_PROJECT_NAME) 
       if ip.is_block_ip(request)
        render(:file => "#{Rails.root.to_s}/public/403.html",:status => 403.6, :layout => false)
       return
      end   
  end
```
step 3: 

 create 403.html file in public folder
```html
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
step 4: 

 create ip_checker.rb file in config/initializers folder
```ruby
  IP_CHECKER_PROJECT_NAME = "project_name"
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `.gemspec`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [Unimedia Solutions License](http://unimedia.mn).

