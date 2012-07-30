RingoProject.controllers :branches do

  get :index do
	@branches = Branche.all(:order => 'created_at desc')
  end

  get :show, :with => :id do
    @branche = Branche.find_by_id(params[:id])
    render 'branches/show'
  end

end
