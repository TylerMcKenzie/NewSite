class Screenshot < ApplicationRecord
  belongs_to :project
  has_attached_file :image, styles: { large: "500X500>", medium: "300X300>", thumb: "100X100>" }, default_url: "/images/missing.png"

end
