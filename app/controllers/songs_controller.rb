class SongsController < ApplicationController
  def new
    @lyrics_sources = allowed_sources.keys
  end

  def create
    lyricist = Lyricist.from_source_file(lyrics_source)

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
    return unless allowed_sources.keys.include?(source)
    allowed_sources[source]
  end

  def allowed_sources
    {
      'Dog (Wiki Page)' => :dog_wiki_page,
      'Moby Dick' => :moby_dick,
      'Edgar Allen Poe' => 'edgar_allen_poe'
    }
  end
end
