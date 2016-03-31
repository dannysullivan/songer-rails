class SongsController < ApplicationController
  def new
    @lyrics_sources = allowed_sources
  end

  def create
    source_material = load_source_from_file(lyrics_source)
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

  private

  def lyrics_source
    source = params[:lyrics_source]
    source if allowed_sources.include?(source)
  end

  def allowed_sources
    ['Dog (Wiki Page)', 'Moby Dick', 'Edgar Allen Poe']
  end

  def load_source_from_file(file_name)
    file_name = file_name.gsub(/\ /, '_').gsub(/\(|\)/, '').downcase
    file = File.read(Rails.root.join('config', 'sources', "#{file_name.underscore}"))
    Marshal.load(file)
  end
end
