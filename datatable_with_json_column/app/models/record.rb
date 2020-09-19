class Record < ApplicationRecord

  serialize :dynamic_fields, HashSerializer

end
