module Couplets; end

class Couplets::RhymeGroup < ActiveRecord::Base
  has_many :lines
end
