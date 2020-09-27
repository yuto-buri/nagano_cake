class HomesController < ApplicationController

	def top
		@items = Item.where(is_active: "販売中").page(params[:page]).per(4)
		@genres = Genre.where(is_active: true)# ジャンルが有効のみ
	end

	def about
	end

end
