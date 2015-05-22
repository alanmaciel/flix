require 'spec_helper'

describe "Adding a movie" do
  it "creates the movie and shows the movie's details" do
    # Arrange
    visit movies_url
    
    click_link 'Add New Movie'
    
    expect(current_path).to eq(new_movie_path)
    # Act

    fill_in "Title", with: "New Movie Title"
    fill_in "Description", with: "Superheroes saving the world form villains"
    fill_in "Rating", with: "PG-13"
    fill_in "Total gross", with: "75000000"
    select (Time.now.year - 1).to_s, :from => "movie_released_on_1i"
    # Assert

    click_button 'Create Movie'

    expect(current_path).to eq(movie_path(Movie.last))
    expect(page).to have_text('New Movie Title')
  end
end
