class EpisodesController < ApplicationController
    def index
        @episode_list = Array.new

        #pagina 1
        @episodes = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/episode'))
        @episodes['results'].each { |episode| @episode_list.push episode }

        #pagina 2
        @episodes = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/episode?page=2'))
        @episodes['results'].each { |episode| @episode_list.push episode }
    end

    def show
        @characters_str = ""

        @episode = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/episode/' + params[:id]))
        @episode['characters'].each{ |character| @characters_str.concat(character.split("/").last + ',') }
        @characters = JSON.parse(HTTP.get('https://rickandmortyapi.com/api/character/' + @characters_str[0..-1]))

    end
end
