require "rails_helper"

RSpec.feature "Editing Exercise" do
  before do
    @john = User.create(email: "john@example.com", password: "password")
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 48,
                                  workout: "My body building activity",
                                  workout_date: Date.today)

    login_as(@john)
  end

  scenario "with valid data" do
    visit "/"
    click_link "My Lounge"

    path = "/users/#{@john.id}/exercises/#{@e1.id}/edit"
    link = "a[href=\'#{path}\']"
    find(link).click

    fill_in "Duration", with: 45
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(45)
    expect(page).not_to have_content(48)
  end
end
