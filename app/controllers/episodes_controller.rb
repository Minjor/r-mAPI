class EpisodesController < ApplicationController
    def index
        @episode_list = Array.new

        #pagina 1
        @episodes = JSON.parse(HTTP.get($global_url + '/episode'))
        @episodes['results'].each { |episode| @episode_list.push episode }

        #pagina 2
        @episodes = JSON.parse(HTTP.get($global_url + '/episode?page=2'))
        @episodes['results'].each { |episode| @episode_list.push episode }
    end

    def show
        @characters_str = ""

        @episode = JSON.parse(HTTP.get($global_url + '/episode/' + params[:id]))
        @episode['characters'].each{ |character| @characters_str.concat(character.split("/").last + ',') }
        @characters = JSON.parse(HTTP.get($global_url + '/character/' + @characters_str[0..-1]))

    end
end
