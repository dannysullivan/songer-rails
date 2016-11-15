module Couplets; end

class Couplets::SourcesController < ApplicationController
  def new
  end

  def create
    source = Couplets::Source.new(source_params)
    @syllable_groups = source.syllable_groups.sort
  end

  private

  def source_params
    params.require(:couplets_source).permit(:text)
  end
end
