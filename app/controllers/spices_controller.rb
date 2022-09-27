class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    #GET /spices
    def index
        spice=Spice.all
        render json:spice
    end

    # #GET /spices/:id
    # def show
    #     spice=find_by_id
    #     render json:spice
    # end

  

    #POST /create
    def create
        spice=Spice.create(permitted_params)
        render json:spice,status: :created
    end

    #PATCH /update/:id
    def update
        spice=find_by_id
        spice.update(permitted_params)
        render json: spice
    end

    #DELETE 
    def destroy
        spice=find_by_id
        spice.destroy
    end

    private
    #Helpers
    def find_by_id
        Spice.find(params[:id])
    end

    def not_found
        render json:{error:"Spice not found"}
    end

    def permitted_params
        params.permit(:title,:image, :description,:notes,:rating)
    end
end
