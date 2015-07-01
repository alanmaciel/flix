require_relative '../spec_helper'

describe "Viewing the list of movies" do

  it "shows the movies" do
    # Arrange
    movie1 = Movie.create(title:  "Iron Man",
                          rating: "PG-13",
                          total_gross:  318412101.00,
                          description:  "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on:  "2008-05-02",
                          cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
                          director: "Jon Favreau",
                          duration: "126 min",
                          image_file_name: "ironman.jpg"
                         )

    movie2 = Movie.create(title:  "Superman",
                          rating: "PG",
                          total_gross:  134218018.00,
                          description:  "Clark Kent grows to be the greatest hero of all times.",
                          released_on:  "1978-12-15")

    movie3 = Movie.create(title:  "Spider-Man",
                          rating: "PG-13",
                          total_gross:  403706375.00,
                          description:  "Peter Parker gets bit by a genetic spider",
                          released_on:  "2002-05-03")
    # Act
    visit movies_url

    # Assert
    expect(page).to have_text("3 Movies")
    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..9])
    expect(page).to have_text(movie1.released_on)
    expect(page).to have_text("$318,412,101.00")
    
    expect(page).to have_text(movie1.cast)
    expect(page).to have_text(movie1.director)
    expect(page).to have_text(movie1.duration)
    expect(page).to have_selector("img[src$='#{movie1.image_file_name}']")
  end

  it "does not show a movie that hasn't yet been released" do
    # Arrange
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

    # Act
    visit movies_path

    # Assert
    expect(page).not_to have_text(movie.title)
  end
end
