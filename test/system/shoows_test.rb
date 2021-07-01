require "application_system_test_case"

class ShoowsTest < ApplicationSystemTestCase
  setup do
    @shoow = shoows(:one)
  end

  test "visiting the index" do
    visit shoows_url
    assert_selector "h1", text: "Shoows"
  end

  test "creating a Shoow" do
    visit shoows_url
    click_on "New Shoow"

    click_on "Create Shoow"

    assert_text "Shoow was successfully created"
    click_on "Back"
  end

  test "updating a Shoow" do
    visit shoows_url
    click_on "Edit", match: :first

    click_on "Update Shoow"

    assert_text "Shoow was successfully updated"
    click_on "Back"
  end

  test "destroying a Shoow" do
    visit shoows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shoow was successfully destroyed"
  end
end
