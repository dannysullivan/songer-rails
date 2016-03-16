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

  def create
    @song = Song.create(song_params)
    flash.notice = "Song created"
    redirect_to song_path(@song)
  end

  def default_serializer_options
    {root: false}
  end

  private

  def song_params
    params.require(:song).permit(:pattern, :lyrics)
  end
end
