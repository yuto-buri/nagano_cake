class HomeController < ApplicationController

	def top
		@search_genres = Genre.all
		@items = Item.all
	end

	def about
	end
	
end
