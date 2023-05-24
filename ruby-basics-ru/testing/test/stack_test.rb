# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

require 'minitest/autorun'

class StackTest < Minitest::Test
  # BEGIN

  def setup
    @stack = Stack.new
  end

  def teardown
    @stack.clear!
  end

  def test_adding
    @stack.push!(1)
    @stack.push!(2)
    @stack.push!(3)
    expected_array = [1, 2, 3]
    assert(@stack.to_a == expected_array)
  end

  def test_removing
    @stack.push!(1)
    @stack.push!(2)
    @stack.push!(3)
    @stack.pop!
    expected_array = [1, 2]
    assert(@stack.to_a == expected_array)
  end

  def test_clear
    @stack.push!(1)
    @stack.pop!
    assert(@stack.empty?)
  end

  def test_is_empty
    assert(@stack.empty?)
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
