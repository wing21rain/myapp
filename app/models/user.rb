class User < ApplicationRecord
  has_one :result, dependent: :destroy
end