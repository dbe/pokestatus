#For time_ago_in_words...a bit hacky
include ActionView::Helpers::DateHelper

class ReportsController < ApplicationController

  def create
    timeout = Rails.env == "production" ? 10.minutes : 5.seconds
    #Get reports from same IP within an hour
    previous_reports = Report.where(ip: request.remote_ip, time: timeout.ago..DateTime.now)

    if previous_reports.any?
      return head :too_many_requests
    end

    if !Report.statuses.has_key? params[:report_status]
      return head :forbidden
    end

    report = Report.create(time: DateTime.now, status: params[:report_status], ip: request.remote_ip)

    if report
      return head :ok 
    end
  end


  def reports_since
    puts "OREO"
    puts time_ago_in_words(Report.first.time)
    if(params[:last])
      reports = Report.where("id > #{params[:last]}")
      reports = reports.map do |report|
        {time: "#{time_ago_in_words(report.time)} ago", status: report.status.titleize}
      end
    else
      reports = []
    end

    render json: reports.to_json
  end
end
