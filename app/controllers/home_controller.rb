class HomeController < ApplicationController

	def top
		@search_genres = Genre.all
	end

	def about
	end
	
end
