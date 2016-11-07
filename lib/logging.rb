module Logging

  def self.included mod
    mod.extend self
  end

  private

  def logger
    Rails.logger
  end

  def logger_debug(message=nil, &block)
    message = "[#{self.class.name}] #{message}"
    if block_given?
      message += yield
    end
    logger.debug(message)
  end

end