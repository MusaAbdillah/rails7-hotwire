require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#total_price return the total_price of all line items" do
    assert_equal 2500, quotes(:first).total_price
  end
end
