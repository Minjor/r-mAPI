class LocationsController < ApplicationController
    def show
        @residents_str = ""
        @location = JSON.parse(HTTP.get($global_url + '/location/' + params[:id]))
        @location['residents'].each{ |resident| @residents_str.concat(resident.split("/").last + ',') }
        @residents = JSON.parse(HTTP.get($global_url + '/character/' + @residents_str[0..-1]))
    end
end
