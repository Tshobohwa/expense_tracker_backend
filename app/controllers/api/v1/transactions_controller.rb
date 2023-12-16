class Api::V1::TransactionsController < ApplicationController
    before_action :authenticate_user!
    def index
        render json: { current_user: ""}
    end

    def new

    end

    def create

    end
end
