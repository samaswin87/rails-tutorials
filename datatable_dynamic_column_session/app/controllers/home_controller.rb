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
    custom_columns do
      Record.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, phone: Faker::PhoneNumber.unique.cell_phone)
    end

    redirect_to action: :index
  end

  private

  def custom_columns
    custom_columns = COLUMNS.map do |column|
      ActiveDynamic::AttributeDefinition.new(column, datatype: ActiveDynamic::DataType::String)
    end
    Thread.current[:custom_columns] = custom_columns
    begin
      yield
    ensure
      Thread.current[:custom_columns] = nil
    end
  end



end
