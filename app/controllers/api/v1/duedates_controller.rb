require 'pry'

class Api::V1::DuedatesController < ApplicationController
    skip_before_action :authorized, only: []

    def create
        @duedate = Duedate.Create(duedate_params)
        if @due_date.valid?
            render json: { duedate: DuedateSerializer.new(@duedate) }, status: :created
        else
            render json: { error: 'failed to create duedate' }, status: :not_acceptable
        end
    end

    def createMany
        succeded = []
        failed = []

        params[:data].each do |dd|
            tempdd = Duedate.create(client_id: dd[:client_id], name: dd[:name], description: dd[:description], dateDue: dd[:dateDue], progress: dd[:progress], status: dd[:status])

            if tempdd.valid?
                succeded.push(DuedateSerializer.new(tempdd))
            else
                failed.push(dd)
            end
        end
        render json: {data: {succeded: succeded, failed: failed}}, status: :created
    end

    def delete

    end

    def deleteAll

    end

    def getAll
        @duedates = Duedate.all
        render :json => @duedates
    end

    def index
        @duedates = Duedate.all.where(client_id: params[:client_id])
        render :json => @duedates
    end

    def show
        @duedate = Duedate.all.find_by(client_id: params[:client_id], id: params[:id])
        render :json => @duedate
    end

    private

    def duedate_params
        params.require(:due_date).permit(:id, :client_id, :name, :description, :dateDue, :progress, :status)
    end

end
