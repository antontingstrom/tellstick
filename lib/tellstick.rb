require 'tellstick/version'

require 'ffi'
require 'tellstick/ffi_mapping'
require 'tellstick/device'

module TellStick
  def self.all_device_methods
    METHODS.to_hash.values.inject(0) { |result, element| result | element }
  end

  def self.devices
    devices = []
    number_of_devices.times do |i|
      devices << TellStick::Device.new(device_id_for_index(i))
    end
    devices
  end 
end
