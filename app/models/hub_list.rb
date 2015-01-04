class HubList < ActiveRecord::Base
  belongs_to :user
  validates_formatting_of :github, using: :url
  validates_formatting_of :bitbucket, using: :url
  validates_formatting_of :codepen, using: :url
end
