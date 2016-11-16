module Couplets; end

class Couplets::SourcesController < ApplicationController
  def new
  end

  def create
    source = Couplets::Source.new(source_params.to_h)
    @syllable_groups = source.syllable_groups.sort_by(&:syllables)
  end

  private

  def source_params
    params.require(:couplets_source).permit(:text)
  end
end
