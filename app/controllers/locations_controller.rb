class LocationsController < ApplicationController
    def show
        @residents_str = ""
        @location = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/location/' + params[:id]))
        @location['residents'].each{ |resident| @residents_str.concat(resident.split("/").last + ',') }
        @residents = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/character/' + @residents_str[0..-1]))
    end
end
