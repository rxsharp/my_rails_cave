class HubList < ActiveRecord::Base
  belongs_to :user
  validates_formatting_of :github, using: :url
end
