class User < ActiveRecord::Base
  has_many :news_items
end
