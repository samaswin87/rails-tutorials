class Record < ApplicationRecord
  has_dynamic_attributes

  def self.custom_columns
    Thread.current[:custom_columns]
  end

  def dynamic_attributes
    if self.class.custom_columns.present?
      self.class.custom_columns
    else
      super
    end
  end

end
