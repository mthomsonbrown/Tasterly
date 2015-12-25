class BeersController < ApplicationController
  def create
    @beer = current_user.beers.create! params[:beer].permit(:name)
  end
  
  def destroy
  end
  
  def show 
  end 
  
  def new
    @beer = current_user.beers.new name: "Duff"
    @beerName = @beer.name
    @user = current_user.email
  end
end
