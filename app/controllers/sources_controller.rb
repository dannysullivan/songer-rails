class SourcesController < ApplicationController
  def new
  end

  def create
    @text = source_params[:text]
    lyricist = Lyricist.from_source(@text)
    @lyrics = 5.times.map{ lyricist.rhyming_lines_string(8).split("\n") }
    render :new
  end

  private

  def source_params
    params.require(:source).permit(:text)
  end
end
