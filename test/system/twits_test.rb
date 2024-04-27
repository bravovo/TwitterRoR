require "application_system_test_case"

class TwitsTest < ApplicationSystemTestCase
  setup do
    @twit = twits(:one)
  end

  test "visiting the index" do
    visit twits_url
    assert_selector "h1", text: "Twits"
  end

  test "should create twit" do
    visit twits_url
    click_on "New twit"

    check "Allow comments" if @twit.allow_comments
    fill_in "Caption", with: @twit.caption
    fill_in "Latitude", with: @twit.latitude
    fill_in "Longitude", with: @twit.longitude
    check "Show likes count" if @twit.show_likes_count
    fill_in "User", with: @twit.user_id
    click_on "Create Twit"

    assert_text "Twit was successfully created"
    click_on "Back"
  end

  test "should update Twit" do
    visit twit_url(@twit)
    click_on "Edit this twit", match: :first

    check "Allow comments" if @twit.allow_comments
    fill_in "Caption", with: @twit.caption
    fill_in "Latitude", with: @twit.latitude
    fill_in "Longitude", with: @twit.longitude
    check "Show likes count" if @twit.show_likes_count
    fill_in "User", with: @twit.user_id
    click_on "Update Twit"

    assert_text "Twit was successfully updated"
    click_on "Back"
  end

  test "should destroy Twit" do
    visit twit_url(@twit)
    click_on "Destroy this twit", match: :first

    assert_text "Twit was successfully destroyed"
  end
end
