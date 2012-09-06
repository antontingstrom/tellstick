#TellStick
This is a Ruby wrapper for the Telldus Core C library, used to control a TellStick device.  

##Installing the GEM
Before using the GEM, make sure you have the Telldus Core C Library installed.  

`rake install`


##Example Usage

	require 'tellstick'

	TellStick.devices.each do |device|
		puts "ID: #{device.id}"
		puts "  Name: #{device.name}"
		puts "  Model: #{device.model}"
		puts "  Protocol: #{device.protocol}"
		puts "  Methods: #{device.supported_commands}"
		puts "  Last Command: #{device.last_command.inspect}"
		next unless device.has_command?(:turn_on)

		if device.last_command == :turn_on 
		  puts "  Turning device OFF - #{device.turn_off.inspect}"
		else
		  puts "  Turning device ON - #{device.turn_on.inspect}"
		end
	end
