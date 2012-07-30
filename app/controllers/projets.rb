RingoProject.controllers :projets do

  get :index do
	@projets = Projet.all(:order => 'created_at desc')
  end

  get :show, :with => :id do
    @projet = Projet.find_by_id(params[:id])
    render 'projets/show'
  end

end
