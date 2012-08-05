Admin.controllers :branches do

  get :index do
    @branches = Branche.all
    render 'branches/index'
  end

  get :new do
    @branche = Branche.new
    @environnements = Environnement.all
    render 'branches/new'
  end

  post :create do
    @branche = Branche.new(params[:branche])
    @environnements = Environnement.all
    if @branche.save
      flash[:notice] = 'Branche was successfully created.'
      redirect url(:branches, :edit, :id => @branche.id)
    else
      render 'branches/new'
    end
  end

  get :edit, :with => :id do
    @branche = Branche.find(params[:id])
    @environnements = Environnement.all
    render 'branches/edit'
  end

  put :update, :with => :id do
    @branche = Branche.find(params[:id])
    if @branche.update_attributes(params[:branche])
      flash[:notice] = 'Branche was successfully updated.'
      redirect url(:branches, :edit, :id => @branche.id)
    else
      render 'branches/edit'
    end
  end

  delete :destroy, :with => :id do
    branche = Branche.find(params[:id])
    if branche.destroy
      flash[:notice] = 'Branche was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Branche!'
    end
    redirect url(:branches, :index)
  end
end
