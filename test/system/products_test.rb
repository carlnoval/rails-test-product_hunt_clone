require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  # def test_visiting_the_index
  # end

  # test below is the same method as above
  test "visiting the index" do
    # visit is a capybara method
    visit root_url
  
    # assert_selector is another capybara method that makes sure there is an h1 tag with text of Product in the page
    # returns true if test passed
    assert_selector "h1", text: "Awesome Products"
  end
end
