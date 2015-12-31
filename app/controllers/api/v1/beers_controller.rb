class Api::V1::BeersController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  
  def create
    @beer = @current_user.beers.create! beer_params
    @beer.flavors.create! flavor_params

    render json: { success: "Added " + beer_params[:name] + "!" }
  end

  private

    def beer_params
      params.require(:beer).permit(:abv, :name, :flavors)
    end
    
    def flavor_params
      params.permit(flavors:[:name, :rating])[:flavors]
    end
end