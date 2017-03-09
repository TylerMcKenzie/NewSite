class Portfolio < ApplicationRecord
  belongs_to :user, dependent: :destroy

  has_many :projects, :dependent => :delete_all

  has_many :skills, :dependent => :delete_all

  has_many :contact_types, :dependent => :delete_all
  
  accepts_nested_attributes_for :projects, :skills, :contact_types, allow_destroy: true, reject_if: :all_blank
end
