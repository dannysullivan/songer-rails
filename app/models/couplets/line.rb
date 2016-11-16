module Couplets; end

class Couplets::Line < ActiveRecord::Base
  belongs_to :rhyme_group
end
