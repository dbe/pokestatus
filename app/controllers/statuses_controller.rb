class StatusesController < ApplicationController
  def index
    @statuses = Status.all
    @status = @statuses.first

    @reports = Report.order(time: :desc)
    @last_report_id = @reports.first.id
  end
end
