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

    def approve
        current_floof_rental_request.approve!
        redirect_to floof_url(current_floof)
    end

    def deny
        current_floof_rental_request.deny!
        redirect_to floof_url(current_floof)
    end

    private

    def floof_rental_request_params
        params.require(:floof_rental_request).permit(:start_date,:end_date,:floof_id,:status)
    end

    def current_floof_rental_request
        @rental_request ||= FloofRentalRequest.includes(:floof).find(params[:id])
    end

    def current_floof
        current_floof_rental_request.floof
    end

end