class Article < ApplicationRecord

  serialize :custom_fields, JSON

  def custom_fields
    YAML.load(super)
  end

end
