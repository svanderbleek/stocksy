require 'test_helper'

class PricesJobTest < ActiveJob::TestCase
  test "queues" do
    assert_enqueued_jobs 0
    PricesJob.perform_later
    assert_enqueued_jobs 1
  end
end
