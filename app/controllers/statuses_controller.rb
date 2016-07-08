class StatusesController < ApplicationController
  def index
    #TODO: Change this logic
    @status = Status.last.pretty
  end
end
