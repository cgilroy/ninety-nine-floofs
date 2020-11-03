class FloofsController < ApplicationController
    def index
        @floofs = Floof.all
        render :index
    end
    
    def show
        @floof = Floof.find(params[:id])
        render :show
    end

    def new
        @floof = Floof.new
        render :new
    end

    def create
        @floof = Floof.new(floof_params)
        if @floof.save
            redirect_to floof_url(@floof)
        else
            render :new
        end
    end

    def edit
        @floof = Floof.find(params[:id])
        render :edit
    end

    def update
        @floof = Floof.find(params[:id])
        if @floof.update_attributes(floof_params)
            redirect_to floof_url(@floof)
        else
            render :edit
        end
    end

    private

    def floof_params
        params.require(:floof).permit(:color,:description,:name,:birth_date,:sex)
    end
end