$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'version_fu'
require 'rspec'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
  config.order = 'random'
end
