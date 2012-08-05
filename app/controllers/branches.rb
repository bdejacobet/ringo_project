RingoProject.controllers :branches do

  get :index do
	@branches = Branch.all(:order => 'name desc')
    render 'branches/index'
  end

  get :show, :with => :id do
    @branch = Branch.find_by_id(params[:id])
    render 'branches/show'
  end

end
