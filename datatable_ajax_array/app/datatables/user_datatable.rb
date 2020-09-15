class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  # assume columns are also custom
  def custom_columns
    [:first_name, :last_name, :email]
  end

  def view_columns
    view_columns_hash = {id: { source: 'Record.id' } }
    custom_columns.each do |column|
      view_columns_hash[column] = { source: 'Record.#{column}', searchable: false, orderable: false }
    end
    @view_columns ||= view_columns_hash
  end

  def data
    records.map do |record|
      record_hash = {
        id:         record.id,
        DT_RowId:   record.id
      }

      custom_columns.each do |column|
        record_hash[column] = record.send(column.to_s)
      end
      record_hash
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
