Admin.controllers :environnements do

  get :index do
    @environnements = Environnement.all
    render 'environnements/index'
  end

  get :new do
    @environnement = Environnement.new
    @projets = Projet.all
    render 'environnements/new'
  end

  post :create do
    @environnement = Environnement.new(params[:environnement])
    @projets = Projet.all
    if @environnement.save
      flash[:notice] = 'Environnement was successfully created.'
      redirect url(:environnements, :edit, :id => @environnement.id)
    else
      render 'environnements/new'
    end
  end

  get :edit, :with => :id do
    @environnement = Environnement.find(params[:id])
    @projets = Projet.all
    render 'environnements/edit'
  end

  put :update, :with => :id do
    @environnement = Environnement.find(params[:id])
    if @environnement.update_attributes(params[:environnement])
      flash[:notice] = 'Environnement was successfully updated.'
      redirect url(:environnements, :edit, :id => @environnement.id)
    else
      render 'environnements/edit'
    end
  end

  delete :destroy, :with => :id do
    environnement = Environnement.find(params[:id])
    if environnement.destroy
      flash[:notice] = 'Environnement was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Environnement!'
    end
    redirect url(:environnements, :index)
  end
end
