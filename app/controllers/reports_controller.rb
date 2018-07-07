class ReportsController < ApplicationController
  def index
    # TODO: consider renaming these methods, it's kinda weird.
    @report = Report.new(BoulderTubing.new.conditions).conditions
  end
end
