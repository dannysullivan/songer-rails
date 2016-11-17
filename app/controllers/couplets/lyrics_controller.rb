module Couplets; end

class Couplets::LyricsController < ApplicationController
  def index
    @lyric = Couplets::Lyric.new
  end
end
