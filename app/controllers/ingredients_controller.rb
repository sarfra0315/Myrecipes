class IngredientsController < ApplicationController
	before_action :set_ingredient, only: [:show, :update, :edit]
	before_action :require_admin?, except: [:show, :index]

	def new
		@ingredient = Ingredient.new
	end

	def create
		@ingredient = Ingredient.new(ingredient_params)
		if @ingredient.save
			flash[:success] = "Ingredient was created successfully"
			redirect_to ingredient_path(@ingredient)
		else
			render 'new'
		end
	end

	def show
		@ingredient_recipes = @ingredient.recipes.paginate(page: params[:page], per_page: 5)
	end

	def index
		@ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
		
	end

	def update
		if @ingredient.update(ingredient_params)
			flash[:success] = "Ingredient updated successfully"
			redirect_to @ingredient
		else
			render 'edit'
		end

		
	end

	def edit

		
	end

	def ingredient_params
		params.require(:ingredient).permit(:name)
		
	end

	private
	def set_ingredient
		@ingredient = Ingredient.find(params[:id])
		
	end

	def require_admin?
		if !logged_in? || (logged_in? and !current_chef.admin?)
			flash[:danger] = "Only admin user can perform that action"
			redirect_to ingredients_path

		end
	end

end