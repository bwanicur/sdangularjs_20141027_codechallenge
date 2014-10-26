class Presentation < ActiveRecord::Base
  validates :title, :presenter, :info_links, presence: true

end
