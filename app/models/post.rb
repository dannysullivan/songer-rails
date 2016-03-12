class Post < ActiveRecord::Base
  has_many :upvotes
end
