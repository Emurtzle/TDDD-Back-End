require 'pry'

class ClientsController < ApplicationController
    skip_before_action :authorized, only: []

    def create
        @client = Client.create(client_params)
        if @client.valid?
            render json: { client: ClientSerializer.new(@client) }, status: :created
        else
            render json: { error: 'Failed to create client' }, status: :not_acceptable
        end
    end

    def csv
        data = params[:data]
        forms = params[:forms]
        clientsSucceded = []
        clientsFailed = []
        duedateSucceded = []
        duedateFailed = []

        data.each do |client|
            tempClient = Client.create(firstName: client['firstName'], lastName: client['lastName'], email: client['email'], phone: client['phone'], fax: client['fax'], dob: client['dob'], address: client['address'], occupation: client['occ'], ssn: client['ssn'], status: client['status'])

            if tempClient.valid?
                clientsSucceded.push(tempClient)
            else
                clientsFailed.push(client)
            end

            forms.each do |form|
                tempDuedate = Duedate.create(client_id: tempClient.id, name: form['name'], description: form['description'], dateDue: form['dateDue'], progress: '0', status: 'incomplete' )

                if tempDuedate.valid?
                    duedateSucceded.push(tempDuedate)
                else
                    duedateFailed.push(form)
                end
            end

        end

        render json: {data: {clients: {clientsSucceded: clientsSucceded, clientsFailed: clientsFailed}}, duedates: {duedateSucceded: duedateSucceded, duedateFailed: duedateFailed}}, status: :created
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
