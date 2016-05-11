class FlavorStatsController < InheritedResources::Base

  private

    def flavor_stat_params
      params.require(:flavor_stat).permit()
    end
end

