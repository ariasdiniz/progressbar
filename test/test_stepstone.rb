# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/stepstone'

class StepstoneTest < Minitest::Test
  def setup
    @iterable = [1, 2, 3, 4, 5]
  end

  def capture_output
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end

  def test_progress_bar_with_default_params
    output = capture_output do
      Stepstone.bar(@iterable) { |element| element * 2 }
    end
    assert_match(/Progress: \[=+\] 100.0%/, output,
                 'Progress bar with default parameters did not match expected output')
  end

  def test_progress_bar_with_custom_title
    output = capture_output do
      Stepstone.bar(@iterable, title: 'Loading: ') { |element| element * 2 }
    end
    assert_match(/Loading: \[=+\] 100.0%/, output, 'Progress bar with custom title did not match expected output')
  end

  def test_progress_bar_with_custom_n_bars
    output = capture_output do
      Stepstone.bar(@iterable, n_bars: 10) { |element| element * 2 }
    end
    assert_match(/\[=+\] 100.0%/, output, 'Progress bar with custom number of bars did not match expected output')
  end

  def test_progress_bar_with_empty_iterable
    empty_iterable = []
    msg = assert_raises(StandardError) { Stepstone.bar(empty_iterable) }
    assert_equal(msg.to_s, 'Iterable can\'t be empty for progress bar!')
  end
end
