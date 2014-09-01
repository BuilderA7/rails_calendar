# RailsCalendar

An easy to use calendar for your rails app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_calendar'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install rails_calendar
```

## Usage

Use the provided helper to render the calendar in your view:

```ruby
<%= rails_calendar %>
```

By default the calendar will show the current month, but can be easily
changed passing a Date object to the helper:

```ruby
<%= rails_calendar(Date.new(2000, 3)) %>

//-> This shows the calendar for March 2000
```

Additionally, you can specify a block that will be invoked for each day to
show custom information in any calendar cell:

```erb
<%
  events = {
    '2014-03-01' => [ 'TODO 1', 'TODO 2' ],
    '2014-03-03' => [ 'TODO 3' ]
  }
%>

<%= rails_calendar(Date.new(2014, 3)) do |date| %>
  <% if events[date.to_s].present? %>
    <ul>
      <% events[date.to_s].each do |event| %>
        <li><%= event %></li>
      <% end %>
    </ul>
  <% end %>
<% end %>
```

## Contributing

1. Fork it ( https://github.com/rdiazv/rails_calendar/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
