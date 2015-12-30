class BeersController < ApplicationController
  @@flavorNames = ['Hops', 'Malt', 'Other']
  
  def new
    @beer = current_user.beers.new name: "Duff"
    
    @@flavorNames.each do |flavorName|
      @beer.flavors.build name: flavorName, rating: 0
    end
    
    @flavors = @beer.flavors
  end

  def create
    puts "IN CREATEEEE"
    @beer = current_user.beers.create! beer_params
  end
  
  def destroy
  end
  
  def show
  end 
  
  def beer_params
    params.require(:beer).permit(:id, :name, :abv, flavors_attributes: [:id, :name, :rating])
  end
  
  def update
  end
end
