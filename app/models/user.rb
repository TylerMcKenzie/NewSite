class User < ApplicationRecord
  has_attached_file :profile_image, styles: { large: "500X500>", medium: "300X300>", thumb: "100X100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\z/
  has_many :projects
  has_many :skills
  has_many :contact_types
  accepts_nested_attributes_for :projects, :skills, :contact_types, allow_destroy: true, reject_if: :all_blank 
end
