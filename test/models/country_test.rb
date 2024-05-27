require "test_helper"

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save article without title" do
    country = Country.new
    assert_not country.save
  end
end
