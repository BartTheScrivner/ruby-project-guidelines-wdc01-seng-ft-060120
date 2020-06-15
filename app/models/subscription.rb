class Subscription < ActiveRecord::Base 
  has_many :podcasts
  has_many :users
end