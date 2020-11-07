class FloofRentalRequestsController < ApplicationController

    def new
        @rental_request = FloofRentalRequest.new
        render :new
    end

    def create
        @rental_request = FloofRentalRequest.new(floof_rental_request_params)
        if @rental_request.save
            redirect_to floof_url(@rental_request.floof)
        else
            render :new
        end
    end

    private

    def floof_rental_request_params
        params.require(:floof_rental_request).permit(:start_date,:end_date,:floof_id,:status)
    end

end