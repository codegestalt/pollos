require File.expand_path("../test_helper", __FILE__)

module Pollos
  class PollerTest < MiniTest::Test

    def setup
      stub_request(:get, "http://status.codegestalt.com/api/v1/apps").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => File.read("./test/fixtures/get_request.json"), :headers => {})

      stub_request(:post, "http://status.codegestalt.com/api/v1/messages").
        with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => File.read("./test/fixtures/post_answer.json"), :headers => {})

      @poller = Poller.new(5, "http://status.codegestalt.com/api/v1/apps", "http://status.codegestalt.com/api/v1/messages")
    end

    def test_initializer_returns_valid_poller
      assert_kind_of Poller, @poller
    end

    def test_get_apps
      assert_kind_of String, @poller.get_apps
    end

    def test_post_messages
      response = JSON.parse(File.read("./test/fixtures/post_answer.json"))
      assert_kind_of Net::HTTPOK, @poller.post_messages!(response)
    end

  end
end
