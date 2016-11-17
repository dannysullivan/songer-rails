module Couplets; end

class Couplets::LyricsController < ApplicationController
  def index
    @lyric = Couplets::Lyric.new if Couplets::RhymeGroup.first
  end
end
