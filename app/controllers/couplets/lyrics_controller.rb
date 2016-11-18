module Couplets; end

class Couplets::LyricsController < ApplicationController
  def index
    if Couplets::RhymeGroup.first
      @lyric = Couplets::Lyric.new
      @title = @lyric.lines.first.text.split(' ').sample.titleize
    end
  end
end
