require File.expand_path("../test_helper", __FILE__)

module Pollos
  class JobTest < MiniTest::Test

    def setup
      @apps_response = JSON.parse(File.read("./test/get_request.json"))
    end

    def test_job_from_hash_returns_array
      jobs = Job.from_hash(@apps_response)
      assert_equal Array, jobs.class
    end

    def test_job_from_hash_array_includes_job_object
      jobs = Job.from_hash(@apps_response)
      assert_equal jobs.first.class, Job
    end

    def test_job_attributes
      job = Job.new(@apps_response.first)
      assert_equal job.id, 3301395
    end

  end
end
