class StatusesController < ApplicationController
  def index
    @statuses = Status.all

    @status = @statuses.last
  end
end
