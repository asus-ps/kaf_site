class HistoriesController < ApplicationController
  def index
    @history = Historie.find(1)
  end

end
