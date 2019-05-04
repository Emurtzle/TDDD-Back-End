require 'pry'

class Api::V1::ClientsController < ApplicationController
    skip_before_action :authorized, only: []

    def create
        @client = Client.create(client_params)
        if @client.valid?
            render json: { client: ClientSerializer.new(@client) }, status: :created
        else
            render json: { error: 'failed to create client' }, status: :not_acceptable
        end
    end

    def index
        @clients = Client.all
        render :json => @clients
    end

    def show
        @client = Client.all.find_by(id: params[:id])
        render :json => @client
    end

    private

    def client_params
        params.require(:client).permit(:id, :firstName, :lastName, :address, :phone, :email, :fax, :dob, :occupation, :ssn, :status)
    end
end
