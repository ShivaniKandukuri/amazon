class PaysController < ApplicationController
  def new
    @pay=Pay.new
  end
  def create
    @pay=Pay.new(params.reuire(:pay).permit(:paytype))
    if @pay.save
      flash[:notice]="pay created successfully"
      redirect_to @pay
    else
      render 'new'
    end
  end
  def index
    @pays=pay.all
  end
end
