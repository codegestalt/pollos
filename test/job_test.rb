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

  end
end
