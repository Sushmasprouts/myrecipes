class IncredientsController < ApplicationController
  before_action :set_incredient, only: [:edit, :update, :show]
   before_action :require_admin, except: [:show, :index]
  def new
    @incredient = Incredient.new
  end
  
  def create
    @incredient = Incredient.new(incredient_params)
    if @incredient.save
      flash[:success] = "Ingredient was successfully created"
      redirect_to incredient_path(@incredient)
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
      if @incredient.update(incredient_params)
      flash[:success] = "Ingredient name was updated successfully"
      redirect_to @incredient
    else
      render 'edit'
      end
  end
  
  def show
    @incredient_recipes = @incredient.recipes.paginate(page: params[:page], per_page: 5)
  end
  
  def index
    @incredients = Incredient.paginate(page: params[:page],per_page: 5)
  end
  
  private
  
   def incredient_params
    params.require(:incredient).permit(:name)
   end
  
  def set_incredient
    @incredient= Incredient.find(params[:id])
  end
  
  def require_admin
    if !logged_in? || (logged_in? and !current_chef.admin?)
      flash[:danger] = "Only admin users can perform that action"
      redirect_to incredients_path
    end
  end
  
end