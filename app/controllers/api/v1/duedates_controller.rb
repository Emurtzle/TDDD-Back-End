require 'pry'

class Api::V1::DuedatesController < ApplicationController
    skip_before_action :authorized, only: []

    def create

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
        params.require(:due_date).permit(:id, :client_id, :name, :description, :progress, :status)
    end
end
