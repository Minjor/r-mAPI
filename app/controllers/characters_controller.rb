class CharactersController < ApplicationController
    def show
        @episodes_str = ""
        @character = JSON.parse(HTTP.get($global_url + '/character/' + params[:id]))
        @character['episode'].each{ |episode| @episodes_str.concat(episode.split("/").last + ',') }
        @episodes = JSON.parse(HTTP.get($global_url + '/episode/' + @episodes_str[0..-1]))
    end
end
