class Project < ApplicationRecord
  belongs_to :portfolio
  has_many :screenshots, :dependent => :delete_all
end
