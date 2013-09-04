class MainController < ApplicationController

  def root
    redirect_to "/houses" and return
  end

  def index
    @houses = House.order(:id)
    render :index and return
  end

  def show
    @house = House.where(id: params[:id]).first
    render :show and return
  end

end
