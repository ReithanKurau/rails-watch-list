class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Movie created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
