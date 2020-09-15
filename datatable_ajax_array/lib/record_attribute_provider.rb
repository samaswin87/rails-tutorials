class RecordAttributeProvider

  def initialize(model)
    @model = model
  end

  # Columns from external source
  def call
    ['first_name', 'last_name', 'email'].map do |column|
      ActiveDynamic::AttributeDefinition.new(column, datatype: ActiveDynamic::DataType::String)
    end
  end

  private

  attr_reader :model
end
