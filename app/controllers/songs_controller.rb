class SongsController < ApplicationController
  def new
  end

  def create
    song = Song.new
    song.build_default_sections
    song.save
    redirect_to song_path(song)
  end

  def show
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html
      format.mid { send_file @song.to_midi, type: "audio/midi" }
    end
  end
end
