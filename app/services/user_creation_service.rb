class UserCreationService

  def initialize(params)
    @user_params = { name: params[:name], email: params[:email], about: params[:about], profile_image: params[:profile_image] }
    @skills = params[:skills_attributes]
    @projects = params[:projects_attributes]
    @contact_types = params[:contact_types_attributes]
  end

  def save
    user = User.new(@user_params)

    if user.save
      if @skills
        @skills.each do |k, skill|
          user.skills.create({name: skill[:name], proficiency: skill[:proficiency]})
        end
      end

      if @projects
        @projects.each do |k, project|
          new_project = Project.new({name: project[:name], url: project[:url], completed: project[:completed]})

          if project[:screenshots]
            project[:screenshots].each do |k, screenshot|
              new_project.screenshots.create({image: screenshot[:image]})
            end
          end

          user.projects << new_project
        end


      end

      if @contact_types
        @contact_types.each do |k, contact_type|
          user.contact_types.create({name: contact_type[:name], url: contact_type[:url]})
        end
      end

      return user
    else
      user
    end

  end

end
