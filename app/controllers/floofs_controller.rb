class FloofsController < ApplicationController
    def index
        @floofs = Floof.all
        render :index
    end
end