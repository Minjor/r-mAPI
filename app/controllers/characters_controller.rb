class CharactersController < ApplicationController
    def show
        @episodes_str = ""
        @character = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/character/' + params[:id]))
        @character['episode'].each{ |episode| @episodes_str.concat(episode.split("/").last + ',') }
        @episodes = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/episode/' + @episodes_str[0..-1]))
        @image = HTTP.get(@character['image'])
    end
end
