class ContentForm < ActiveRecord::Base
  attr_accessible :content, :date, :title
end
