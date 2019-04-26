class Api::V1::ClientsController < ApplicationController
    skip_before_action :authorized, only: []

    def create

    end

    def index
        @clients = Client.all
        render :json => @clients
    end

    def show
        @client = Client.all.find_by(id: params[:id])
        puts @client
        render :json => @client
    end

    private

    def client_params
        params.require(:client).permit(:id, :firstName, :lastName, :phone, :email, :fax, :dob, :occupation, :ssn, :status)
    end
end
