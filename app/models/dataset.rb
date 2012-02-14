class Dataset < ActiveRecord::Base
  has_many :data, dependent: :destroy
  belongs_to :user
end
