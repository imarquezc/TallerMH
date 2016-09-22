class PagesController < ApplicationController
    def home
        if params[:search] and params[:search] != ""
            @clients = Client.search(params[:search])
            @cars = Car.search(params[:search])
        end
    render :layout => false
    end

    def index
        render :layout => false
    end
end
