class StatusesController < ApplicationController
  def index
    @statuses = Status.order(time: :desc)
    @status = @statuses.first

    @reports = Report.order(time: :desc)
    @last_report_id = @reports.first && @reports.first.id
  end
end
