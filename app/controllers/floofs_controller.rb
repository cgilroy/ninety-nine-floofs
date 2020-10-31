class FloofsController < ApplicationController
    def index
        @floofs = Floof.all
        render :index
    end
    
    def show
        @floof = Floof.find(params[:id])
        render :show
    end
end