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
    click_on "Новий твіт"

    check "Дозволити коментарі" if @twit.allow_comments
    fill_in "Опис твіта", with: @twit.caption
    fill_in "Latitude", with: @twit.latitude
    fill_in "Longitude", with: @twit.longitude
    check "Показувати кількість лайків" if @twit.show_likes_count
    fill_in "Користувач", with: @twit.user_id
    click_on "Створити твіт"

    assert_text "Твіт успішно створений"
    click_on "Назад"
  end

  test "should update Twit" do
    visit twit_url(@twit)
    click_on "Редагувати твіт", match: :first

    check "Дозволити коментарі" if @twit.allow_comments
    fill_in "Опис твіта", with: @twit.caption
    fill_in "Latitude", with: @twit.latitude
    fill_in "Longitude", with: @twit.longitude
    check "Показати кількість лайків" if @twit.show_likes_count
    fill_in "Користувач", with: @twit.user_id
    click_on "Відредагувати твіт"

    assert_text "Твіт успішно оновлено"
    click_on "Назад"
  end

  test "should destroy Twit" do
    visit twit_url(@twit)
    click_on "Видалити твіт", match: :first

    assert_text "Твіт успішно видалено"
  end
end
