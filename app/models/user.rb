class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :profile_image, styles: { large: "500X500>", medium: "300X300>", thumb: "100X100>" }, default_url: "/missing.png"

  validates_attachment_content_type :profile_image, { content_type: ["image/jpeg", "image/png"] }

  has_many :projects, :dependent => :delete_all
  has_many :skills, :dependent => :delete_all
  has_many :contact_types, :dependent => :delete_all
  accepts_nested_attributes_for :projects, :skills, :contact_types, allow_destroy: true, reject_if: :all_blank

  def completed_projects
    completed_array = []

    self.projects.each do |project|
      if project.completed
        completed_array << project
      end
    end
    completed_array
  end

  def incomplete_projects
    incomplete_array = []

    self.projects.each do |project|
      if !project.completed
        incomplete_array << project
      end
    end
    incomplete_array
  end
end
