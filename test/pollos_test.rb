require File.expand_path("../test_helper", __FILE__)

module Pollos
  class PollosTest < MiniTest::Test

    def setup
      @poller = Poller.new(300)
    end

    def test_initialize_poller
      assert_equal @poller.class, Poller
    end

  end
end
