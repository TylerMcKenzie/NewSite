class UserPortfolioCreationService

  def initialize(user_id, params)
    @portfolio_params = { name: params[:name], about: params[:about], user_id: user_id }
    @skills = params[:skills_attributes]
    @projects = params[:projects_attributes]
    @contact_types = params[:contact_types_attributes]
  end

  def save
    portfolio = Portfolio.new(@portfolio_params)

    if portfolio.save
      if @skills
        @skills.each do |k, skill|
          portfolio.skills.create({name: skill[:name], proficiency: skill[:proficiency]})
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

          portfolio.projects << new_project
        end

      end

      if @contact_types
        @contact_types.each do |k, contact_type|
          portfolio.contact_types.create({name: contact_type[:name], url: contact_type[:url]})
        end
      end

      return portfolio
    else
      portfolio
    end

  end

end
