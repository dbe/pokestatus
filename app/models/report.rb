class Report < ApplicationRecord
  enum status: [:up, :intermittent, :down]

  after_create :update_status


  protected

  def update_status
    #Status to value map

    status_to_value = {down: -1, intermittent: 0, up: 1}

    #Number of reports to consider in score
    num_reports = 10

    #Time in which value gets linearly reduced
    time_window = 60 * 60 * 24

    #Base factor to weight scores out of the time window
    base_factor = 0.1

    now = Time.zone.now


    #Pull reports and do scoring
    recent_reports = Report.last(num_reports)

    mapped_reports = recent_reports.map do |report|
      ago = now - report.time
      weight = 1 - (ago / time_window)
      score = [base_factor, weight].max 
      score * status_to_value[report.status.to_sym]
    end

    final_score = mapped_reports.sum

    final_status = :intermittent

    if final_score >= 1
      final_status = :up
    elsif final_score <= -1
      final_status = :down
    end

    last_status = Status.last

    if last_status.nil? || (last_status && last_status.status.to_sym != final_status)
      Status.create!(status: final_status, time: DateTime.now)
    end
  end
end
