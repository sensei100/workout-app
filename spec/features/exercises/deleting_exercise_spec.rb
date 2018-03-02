require "rails_helper"

RSpec.feature "Deleting Exercise" do
  before do
    @john = User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 48,
                                  workout: "My body building activity",
                                  workout_date: Date.today)

    login_as(@john)
  end

  scenario do
    visit "/"
    click_link "My Lounge"

    path = "/users/#{@john.id}/exercises/#{@e1.id}"
    link = ".//
    a[@href='/users/#{@john.id}/exercises/#{@e1.id}' and @data-method='delete']"

    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end
