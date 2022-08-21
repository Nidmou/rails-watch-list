class ListsController < ApplicationController
before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end


  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end
end

private

def list_params
  params.require(:list).permit(:name, :body, :photo [])
end

def set_list
  @list = List.find(params[:id])
end
