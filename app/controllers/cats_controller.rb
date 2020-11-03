class CatsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :cat_params, only: [:create]
    before_action :set_cat, only: [:show]

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

    def destroy
        @cat = Cat.find(params[:id])
        if @cat.present?
          @cat.destroy
        end
        redirect_to root_url
    end
    
private

    def cat_params
        params.require(:cat).permit(:name, :breed, :age, :sex, :price, :description, :picture)
    end

    def set_cat
        @cat = Cat.find(params[:id])
    end
end
