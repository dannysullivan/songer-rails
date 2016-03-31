class SongsController < ApplicationController
  def new
  end

  def create
    source_material = File.read(Rails.root.join('config', 'sources', 'moby_dick.txt'))
    lyricist = Lyricist.new(source_material)

    songwriter = Songwriter.new(lyricist)
    songwriter.build_default_sections
    redirect_to song_path(songwriter.song)
  end

  def show
    @song = Song.find(params[:id])
    respond_to do |format|
      format.html
      format.mid { send_file @song.to_midi, type: "audio/midi" }
    end
  end
end
