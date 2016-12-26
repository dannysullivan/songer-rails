class SourcesController < ApplicationController
  def new
  end

  def create
    Couplets::Source.new(source_params.to_h).create_lines
    redirect_to lines_path
  end

  private

  def source_params
    params.require(:couplets_source).permit(:text)
  end
end
