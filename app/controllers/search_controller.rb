class SearchController < ApplicationController

  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @method = params["search"]["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
     model == 'item'
      
        Item.where('name LIKE ?', '%'+content+'%')

    
  end
end
