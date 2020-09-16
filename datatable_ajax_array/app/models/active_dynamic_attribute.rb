class ActiveDynamicAttribute < ApplicationRecord
  belongs_to :customizable, polymorphic: true

end
