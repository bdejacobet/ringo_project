RingoProject.controllers :environnements do

  get :index do
	@environnements = Environnement.all(:order => 'name desc')
    render 'environnements/index'
  end

  get :show, :with => :id do
    @environnement = Environnement.find_by_id(params[:id])
    render 'environnements/show'
  end

end
