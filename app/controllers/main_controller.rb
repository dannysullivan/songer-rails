class MainController < ApplicationController
  def index
    redirect_to new_song_path
  end

  def about
  end
end
