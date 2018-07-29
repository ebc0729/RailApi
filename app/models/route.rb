class Route < ApplicationRecord
  enum status: [:using, :abandoned]
end
