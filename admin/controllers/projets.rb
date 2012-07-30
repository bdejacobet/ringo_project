Admin.controllers :projets do

  get :index do
    @projets = Projet.all
    render 'projets/index'
  end

  get :new do
    @projet = Projet.new
    render 'projets/new'
  end

  post :create do
    @projet = Projet.new(params[:projet])
    if @projet.save
      flash[:notice] = 'Projet was successfully created.'
      redirect url(:projets, :edit, :id => @projet.id)
    else
      render 'projets/new'
    end
  end

  get :edit, :with => :id do
    @projet = Projet.find(params[:id])
    render 'projets/edit'
  end

  put :update, :with => :id do
    @projet = Projet.find(params[:id])
    if @projet.update_attributes(params[:projet])
      flash[:notice] = 'Projet was successfully updated.'
      redirect url(:projets, :edit, :id => @projet.id)
    else
      render 'projets/edit'
    end
  end

  delete :destroy, :with => :id do
    projet = Projet.find(params[:id])
    if projet.destroy
      flash[:notice] = 'Projet was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Projet!'
    end
    redirect url(:projets, :index)
  end
end
