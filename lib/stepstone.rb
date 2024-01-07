# frozen_string_literal: true

require_relative 'stepstone/version'

##
# StepStone is a simple module to create
# progress bars for your iterables.
module Stepstone
  ##
  # Creates a progress bar for your iterable.
  # @param iterable [Enumerable] The iterable to create a progress bar for.
  # @param title [String] The title of the progress bar.
  # @param n_bars [Integer] The number of bars to display.
  # @param block [Proc] The block to execute for each element in the iterable.
  def self.bar(iterable, title: 'Progress: ', n_bars: 20, &block)
    raise 'Iterable can\'t be empty for progress bar!' if iterable.empty?

    bar_percentage = n_bars / iterable.length.to_f
    bar = bar_percentage
    multiplier = 100 / n_bars.to_f
    print "\r#{title}[#{'=' * bar_percentage.round}#{' ' * (n_bars - bar_percentage.round)}] #{
(bar_percentage * multiplier).round(2)}%"
    iterable.each do |*args|
      block.call(*args)
      print "\r#{title}[#{'=' * bar_percentage.round}#{' ' * (n_bars - bar_percentage.round)}] #{
(bar_percentage * multiplier).round(2)}%"
      bar_percentage += bar
    end
  end
end
