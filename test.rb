#!/usr/bin/env ruby
# -*- ruby -*-
require('pry')
require('./demo')

def assert(condition)
  FailedAssertionError("Failed.") unless condition
  p 'passed'
  true
end

def assert_equal(expected, actual, context)
  p context
  msg ||= "Expected #{expected.inspect} to equal #{actual.inspect}"
  assert(expected == actual)
end


blank_title_post = Post.new('', '')
assert_equal blank_title_post.valid?, false, 'if title is blank'

blank_content_post = Post.new('title', '')
assert_equal blank_content_post.valid?, false, 'if content is blank'

normal_post = Post.new('title', 'content')
assert_equal normal_post.valid?, true, 'if all filled'


puts 'well done.'