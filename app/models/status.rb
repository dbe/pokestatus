class Status < ApplicationRecord
  enum status: [:up, :intermittent, :down]

  def pretty
    if self.status.up?
      "Up"
    elsif self.status.intermittent?
      "Intermittent"
    elsif
      self.status.down?
      "Down"
    end
  end
end
