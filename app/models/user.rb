class User < ActiveRecord::Base 
 has_many :subscriptions
 has_many :podcasts, through: :subscriptions
end