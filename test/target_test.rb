require File.expand_path("../test_helper", __FILE__)

module Pollos
  class TargetTest < MiniTest::Test

    def setup
      @valid_target = { id: 1,
                       endpoint_url: "http://codegestalt.com",
                       endpoint_http_method: "GET"
                      }
      @invalid_target = { id: 2,
                          endpoint_url: "http://nonexistenturl.ch",
                          endpoint_http_method: "GET"
                        }

      @post_answer = JSON.parse(File.read("./test/post_answer.json")).first
    end

    def test_target_object
      target = Target.new(@valid_target)
      assert_kind_of Target, target
    end

    def test_response_code
      target = Target.new(@valid_target)
      target.fetch!
      assert_equal "200", target.http_status_code
    end

    def test_response_time
      target = Target.new(@valid_target)
      target.fetch!
      assert_kind_of Float, target.response_time
    end

    def test_rescue_socket_errors
      target = Target.new(@invalid_target)
      assert_equal "Got socket error", target.fetch!
    end

    def test_to_hash_matches_answer_format
    end

  end
end
