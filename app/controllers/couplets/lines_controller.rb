module Couplets; end

class Couplets::LinesController < ApplicationController
  def index
    @rhyme_groups = Couplets::RhymeGroup.all
  end
end
