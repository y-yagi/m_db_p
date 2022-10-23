module PostgreSQLAdapterWrapper
  def active?
    read_only_setting = nil
    @lock.synchronize do
      read_only_setting = @connection.query("SHOW transaction_read_only").getvalue(0, 0)
    end

    replica? ? read_only_setting == "on" : read_only_setting == "off"
  rescue PG::Error
    false
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.prepend(PostgreSQLAdapterWrapper)
end
