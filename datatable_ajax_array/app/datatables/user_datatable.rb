class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id:         { source: 'Record.id' },
      first_name: { source: 'Record.first_name', searchable: false, orderable: false},
      last_name:  { source: 'Record.last_name', searchable: false, orderable: false },
      email:      { source: 'Record.email', searchable: false, orderable: false },
    }
  end

  def data
    records.map do |record|
      {
        id:         record.id,
        first_name: record.first_name,
        last_name:  record.last_name,
        email:      record.email,
        DT_RowId:   record.id
      }
    end
  end

  def get_raw_records
    records = Record.all
    order = params.fetch('order', {})
    if order.present? && order['0']['column'] != '0'
      column = params.fetch('columns', {}).fetch(order['0']['column'], {})
      records = records.joins(:active_dynamic_attributes)
             .where(active_dynamic_attributes: { name: column['data'] })
             .order("active_dynamic_attributes.value #{order['0']['dir']}")
    end
    records
  end

end
