# ProgressBar

`ProgressBar` is a simple Ruby module designed to create progress bars for iterables. It provides an easy and visually appealing way to track the progress of operations over any enumerable object in Ruby.

## Installation

To install ProgressBar, simply add the following line to your application's Gemfile:

```ruby
gem 'aria_progress_bar'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install aria_progress_bar
```

## Usage

Using `ProgressBar` is straightforward. Here is a basic example:

```ruby
require 'aria_progress_bar'

# Create an array as an iterable
array = [1, 2, 3, 4, 5]

# Create a progress bar for the array
AriaProgressBar.bar(array) do |element|
  # Perform your operation
  puts "Processing element #{element}"
end
```

You can also customize the title and the number of bars:

```ruby
AriaProgressBar.bar(array, title: 'Processing: ', n_bars: 30) do |element|
  # Your code here
end
```

## Contributing

Contributions to `ProgressBar` are always welcome! Whether it's bug reports, feature requests, or pull requests, all contributions help make `ProgressBar` better.

To contribute:

1. Fork the project (https://github.com/ariasdiniz/progressbar/fork)
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -am 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a new Pull Request

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.
