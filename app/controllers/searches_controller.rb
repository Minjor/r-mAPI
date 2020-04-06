class SearchesController < ApplicationController
    def show
        @word = params[:keyword]

        @episodes = JSON.parse(HTTP.get($global_url + '/episode/?name=' + @word))
        if @episodes['results']
            @episode_list = Array.new
            @episodes['results'].each { |episode| @episode_list.push episode }
        end
        
        @characters = JSON.parse(HTTP.get($global_url + '/character/?name=' + @word))
        if @characters['results']
            @character_list = Array.new
            @characters['results'].each { |character| @character_list.push character }
        end

        @locations = JSON.parse(HTTP.get($global_url + '/location/?name=' + @word))
        if @locations['results']
            @location_list = Array.new
            @locations['results'].each { |location| @location_list.push location }
        end

    end
end
