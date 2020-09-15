class HomeController < ApplicationController

  def index
  end

  def records
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context) }
    end
  end

end
