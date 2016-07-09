class Report < ApplicationRecord
  enum status: [:up, :intermittent, :down]
end
