module FormHelper
  def setup_user(user)
    user.skills.new
    user.projects.new
    user.contact_types.new
    return user
  end
end
