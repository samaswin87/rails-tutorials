class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable

  def initialize(params, opts = {})
    @view = opts[:view_context]
    @custom_columns = opts[:custom_columns]
    super
  end

  # assume columns are also custom
  def custom_columns
    @custom_columns
  end

  def view_columns
    view_columns_hash = {id: { source: 'Record.id', searchable: false } }
    custom_columns.each do |column|
      view_columns_hash[column.to_sym] = { source: 'Record.#{column}', searchable: false, orderable: false }
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
        record_hash[column] = record.dynamic_fields[column]
      end

      record_hash
    end
  end

  # Solved the search association issue with https://stackoverflow.com/a/63572159
  def get_raw_records
    records = Record.all
    order = params.fetch('order', {})
    if order.present? && order['0']['column'] != '0'
      column = params.fetch('columns', {}).fetch(order['0']['column'], {})
      records = records.order("(dynamic_fields ->> '#{column['data']}') #{order['0']['dir']}")
    end

    search = params.fetch('search', {})
    if search && search['value'].present?
      record_ids = []
      custom_columns.each do |column|
        record_ids << Record.where("dynamic_fields ->> 'name' LIKE ?", "%er%").map(&:id)
      end
      records = records.where('id IN (?)', record_ids.flatten.uniq)
    end

    records
  end

end
