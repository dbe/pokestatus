class StatusesController < ApplicationController
  def index
    @statuses = Status.all
    @status = @statuses.first
  end
end
