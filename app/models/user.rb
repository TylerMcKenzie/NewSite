class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :profile_image, styles: { large: "500X500>", medium: "300X300>", thumb: "100X100>" }, default_url: "/missing.png"

  validates_attachment_content_type :profile_image, { content_type: ["image/jpeg", "image/png"] }

  has_one :portfolio, dependent: :destroy

  validates :name, presence: true

  after_create :set_role

  def completed_projects
    completed_array = []

    self.portfolio.projects.each do |project|
      if project.completed
        completed_array << project
      end
    end
    completed_array
  end

  def incomplete_projects
    incomplete_array = []

    self.portfolio.projects.each do |project|
      if !project.completed
        incomplete_array << project
      end
    end
    incomplete_array
  end

  # private

  def set_role

      self.update_attribute(:role, 'admin')
    # self.update_attribute(:role, 'subscriber')
  end

end
