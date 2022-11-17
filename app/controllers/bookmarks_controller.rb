class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:comment))
    @bookmark.list = @list
    if @bookmark.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find[params[:id]]
    @bookmark.destroy
  end

private

  def set_list
    @list = List.find(params[:list_id])
  end

end
