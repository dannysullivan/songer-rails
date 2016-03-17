class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html
      format.mid { send_file @song.to_midi, type: "audio/midi" }
    end
  end

  def update
    song = Song.find(params[:id])
    song.update_attributes(song_params)
    redirect_to song_path(song)
  end

  def create
    @song = Song.create(song_params)
    flash.notice = "Song created"
    redirect_to song_path(@song)
  end

  private

  def song_params
    params.require(:song).permit(:rhythm1, :rhythm2, sections_attributes: [:pattern])
  end
end
