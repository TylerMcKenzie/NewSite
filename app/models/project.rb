class Project < ApplicationRecord
  belongs_to :user
  has_many :screenshots, :dependent => :delete_all
end
