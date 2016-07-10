class ReportsController < ApplicationController
  def create
    #Get reports from same IP within an hour
    #TODO: CHange this back from 10 seconds when going to prod
    previous_reports = Report.where(ip: request.remote_ip, time: 10.seconds.ago..DateTime.now)

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
    reports = Report.where("id > #{params[:last]}")
    render json: reports.to_json
  end
end
