class Api::V1::RecordsController < ApplicationController
   
    # GET /records
    # GET /records.json
    def index
        render json: Record.all
    end
    
    # GET /records/1
    # GET /records/1.json
    def show
        render json: Record.find(params[:id])
    end
    
    # POST /records
    # POST /records.json
    def create
        @record = Record.new(record_params)
    
        if @record.save
            render json: @record
        else
            render error: {error: "Unable to create record"}, status: :400
        end
    end
    
    # PATCH/PUT /records/1
    # PATCH/PUT /records/1.json
    def update
        @record = Record.find(params[:id])
        if @record.update(record_params)
            render json: {message: "Record updated"}, status: :ok
        else
            render json: {error: "Unable to update the record"}, status: :400
        end
    end
    
    # DELETE /records/1
    # DELETE /records/1.json
    def destroy
        @record = Record.find(params[:id])
        if @record
            @record.destroy
            render json: {message: "Record deleted"}, status: :ok
        else
            render json: {error: "Unable to delete the record"}, status: :400
        end
    end

    private

    def record_params
        params.require(:record).permit(:title, :description)
    end

end
