$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'pollos'
require 'minitest/autorun'
require 'webmock/minitest'

WebMock.disable_net_connect!(allow_localhost: true)
