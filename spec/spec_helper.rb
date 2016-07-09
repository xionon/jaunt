$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'jaunt'

Jaunt::ROOT = Pathname.new(
  File.expand_path(File.join(File.basename(__FILE__), '..'))
)
