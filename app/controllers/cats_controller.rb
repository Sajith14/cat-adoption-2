class CatsController < ApplicationController
    before_action :authenticate_user!
    before_action :cat_params, only: [:create]

    def index
        @cats = Cat.all
    end

    def new 
        @cat = Cat.new
    end
    
    def create
      current_user.cats.create(cat_params) #this wont work until devise done
      redirect_to cats_path
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :breed, :age, :sex, :price, :description)
    end

    def set_cat
        @cat = Cat.find(params[:id])
    end
end
