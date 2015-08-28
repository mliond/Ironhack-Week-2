require_relative '../lib/imdb_search'

RSpec.describe ImdbSearch do
  before :each do
  end

  describe "#check_imdb" do
  	it "should look on IMDB for a given keyword and return a movie array" do
  		@imdb_search = ImdbSearch.new.check_imdb("funny")
  		expect(@imdb_search).to be(Array)
		end
	end

  describe "#check_for_movies" do
  	it "should return a poster's URL for a given movie" do
  		@imdb_search = ImdbSearch.new.fetch_poster_URL
  		expect(@imdb_search).to eq("http://ia.media-imdb.com/images/M/MV5BMTY4ODM0OTc2M15BMl5BanBnXkFtZTcwNzE0MTk3OA@@.jpg")
		end
	end
end
