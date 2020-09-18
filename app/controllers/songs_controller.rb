class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)

        if @song.valid?
            @song.save
        else
            render new
        end
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params) == false
            render edit
        end
    end

    def destroy
    
    end

    private 

    def song_params
        require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end