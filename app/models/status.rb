class Status < ApplicationRecord
  enum status: [:up, :intermittent, :down]
end
