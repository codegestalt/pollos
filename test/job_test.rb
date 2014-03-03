require File.expand_path("../test_helper", __FILE__)

module Pollos
  class JobTest < MiniTest::Test

    def setup
      @get_request = File.read("./test/fixtures/get_request.json")
      @post_answer = File.read("./test/fixtures/post_answer.json")
      @job = Job.new(@get_request)
    end

    def test_initialize_from_hash
      assert_equal 3, @job.targets.count
    end

    def test_jobs_targets_should_return_array
      assert_kind_of Array, @job.targets
    end

    def test_jobs_targets_should_be_of_type_target
      assert_kind_of Target, @job.targets[0]
    end

    def test_fetch_targets_returns_same_amount_of_targets
      @job.fetch_targets!
      job_to_hash_count = @job.to_hash.count
      assert_equal 3, job_to_hash_count
    end

    def test_fetch_targets_should_update_target_objects
      @job.fetch_targets!
      @job.targets.each {|t|
        assert_kind_of Float, t.response_time
        assert_kind_of String, t.http_status_code
      }
    end

    # TODO: Check if the Hash matches the requirements
    # def test_fetch_targets_to_hash_should_match_answer
    #   @job.fetch_targets!
    #   assert_match @post_answer, @job.to_hash
    # end

  end
end
