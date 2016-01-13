class SearchesController < ApplicationController
  #GET
  #/searches/new
  def new
    @search = Search.new
    @categories = Book.uniq.pluck(:category)
  end

  #POST
  #/searches (but it runs when you are leaving /searches/new)
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  #GET
  #/searches/1
  def show
    @search = Search.find(params[:id])
    @books = @search.search_books
  end

  private
  def search_params
    params.require(:search).permit(:keywords, :category, :min_price, :max_price, :isbn)
  end
end
