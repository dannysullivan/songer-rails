class SongsController < ApplicationController
  def new
    @lyrics_sources = allowed_sources
  end

  def create
    lyricist = Lyricist.from_source(lyrics_source)

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

  private

  def lyrics_source
    source = params[:lyrics_source]
    source if allowed_sources.include?(source)
  end

  def allowed_sources
    ['Dog (Wiki Page)', 'Moby Dick', 'Edgar Allen Poe']
  end
end
