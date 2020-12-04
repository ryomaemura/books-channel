class BooksController < ApplicationController
  require 'net/http'

  def create
    if params[:keyword] != ''
      url = "https://www.googleapis.com/books/v1/volumes?q=#{params[:keyword]}&country=JP"
      @books_data = JSON.parse(Net::HTTP.get(URI.parse(URI.encode(url))))
    end
    render new_board_path
  end

  def destroy
  end
end
