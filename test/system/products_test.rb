require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  # def test_visiting_the_index
  # end

  # test below is the same method as above
  test "visiting the index" do
    # visit is a capybara method
    visit root_url
  
    # save_and_open_screenshot  # use only if needed

    # assert_selector is another capybara method that makes sure there is an h1 tag with text of Product in the page
    # returns true if test passed
    assert_selector "h1", text: "Awesome Products"
  end

  test "displays as much cards on index as much as in db" do
    visit root_url
    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end
end
