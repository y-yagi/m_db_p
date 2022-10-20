if Rails.env.development?
  logger = ActiveSupport::Logger.new(File.join(Rails.root, "log", "notifications.log"))
  # database_selector.active_record.read_from_primary, database_selector.active_record.read_from_replica, database_selector.active_record.wrote_to_primary
  ActiveSupport::Notifications.subscribe(/database_selector/) do |event|
    logger.info("[#{event.name}] time: #{event.duration.to_f}")
  end
end
