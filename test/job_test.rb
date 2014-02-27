require File.expand_path("../test_helper", __FILE__)

module Pollos
  class JobTest < MiniTest::Test

    def setup
      @get_request = JSON.parse(File.read("./test/get_request.json"))
      @post_answer = JSON.parse(File.read("./test/post_answer.json"))
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

    def test_jobs_to_hash_should_match_get_request
      hash = @job.to_hash
      assert_equal @get_request, hash
    end

    def test_dispatch_should_return_array_with_target_objects
      dispatched_job = @job.dispatch!
      assert_kind_of Array, dispatched_job

    end

  end
end
