class EarningRule < ApplicationRecord
  belongs_to :task
  belongs_to :token_type
end
