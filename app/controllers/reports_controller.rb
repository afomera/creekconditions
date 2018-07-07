class ReportsController < ApplicationController
  def index
    render json: BoulderTubing.new.conditions
  end
end
