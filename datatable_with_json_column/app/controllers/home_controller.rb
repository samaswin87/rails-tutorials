class HomeController < ApplicationController
  COLUMNS = ['name', 'email', 'phone']

  def index
  end

  def records
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context, custom_columns:  COLUMNS) }
    end
  end

  def create
    records = []
    (1...10000).each do |index|
      records << { dynamic_fields: { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, phone: Faker::PhoneNumber.unique.cell_phone } }
    end

    Record.import(records, on_duplicate_key_ignore: false, batch_size: 100, raise_error: true)

    redirect_to action: :index
  end


end
