Admin.controllers :branches do

  get :index do
    @branches = Branch.all
    render 'branches/index'
  end

  get :new do
    @branch = Branch.new
    @environnements = Environnement.all
    render 'branches/new'
  end

  post :create do
    @branch = Branch.new(params[:branch])
    @environnements = Environnement.all
    if @branch.save
      flash[:notice] = 'Branch was successfully created.'
      redirect url(:branches, :edit, :id => @branch.id)
    else
      render 'branches/new'
    end
  end

  get :edit, :with => :id do
    @branch = Branch.find(params[:id])
    @environnements = Environnement.all
    render 'branches/edit'
  end

  put :update, :with => :id do
    @branch = Branch.find(params[:id])
    if @branch.update_attributes(params[:branch])
      flash[:notice] = 'Branch was successfully updated.'
      redirect url(:branches, :edit, :id => @branche.id)
    else
      render 'branches/edit'
    end
  end

  delete :destroy, :with => :id do
    branch = Branch.find(params[:id])
    if branch.destroy
      flash[:notice] = 'Branch was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Branch!'
    end
    redirect url(:branches, :index)
  end
end
