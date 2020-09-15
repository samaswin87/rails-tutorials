class RecordAttributeProvider

  def initialize(model)
    @model = model
  end

  def call
    [
      ActiveDynamic::AttributeDefinition.new('first_name'),
      ActiveDynamic::AttributeDefinition.new('last_name'),
      ActiveDynamic::AttributeDefinition.new('email')
    ]
  end

end
