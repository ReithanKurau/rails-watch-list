class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List created.'
    else
      flash.now[:alert] = @list.errors.full_messages.to_sentence
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    if @list.destroy
      redirect_to lists_path, notice: 'List was succesfully delete.'
    else
      redirect_to lists_path, alert: 'Failed to delete list.'
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
