class Article < ApplicationRecord

  serialize :custom_fields, JSON

  def custom_fields
    if super.is_a?(String)
      return YAML.load(super)
    end
    super
  end

end
