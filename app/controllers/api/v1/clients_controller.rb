require 'pry'

class Api::V1::ClientsController < ApplicationController
    skip_before_action :authorized, only: []

    def create

    end

    def index
        @clients = Client.all
        render :json => @clients
    end

    def show
        binding.pry
        @client = Client.all.find_by(id: params[:id])
        render :json => @client
    end

    private

    def client_params
        params.require(:client).permit(:id, :firstName, :lastName, :phone, :email, :fax, :dob, :occupation, :ssn, :status)
    end
end
