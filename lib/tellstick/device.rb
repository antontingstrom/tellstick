class Device
  attr_reader :id

  def initialize(device_id)
    @id = device_id
  end

  def name
    read_string TellStick.device_name(id)
  end

  def name=(name)
    TellStick.set_device_name(id, name)
  end

  def model
    read_string TellStick.device_model(id)
  end

  def protocol
    read_string TellStick.protocol(id)
  end      

  def supported_commands
    methods = TellStick.device_methods(id, TellStick.all_device_methods)
    TellStick::METHODS.to_hash.select { |k,v| (methods & v) != 0 }.keys
  end
  
  def has_command?(command)
    supported_commands.include? command
  end

  def last_command
    cmd = TellStick.last_sent_commmand(id, TellStick.all_device_methods)
    TellStick::METHODS[cmd]
  end

  # def dim_value
  #   value = read_string TellStick.last_sent_value(id)
  #   value == '' ? nil : value
  # end

  def learn
    TellStick.learn(id)
  end

  def turn_on
    TellStick.turn_on(id)
   end

  def turn_off
    TellStick.turn_off(id)
  end

  def sound_bell
    TellStick.sound_bell(id)
  end

  private

  def read_string(pointer)
    string = pointer.read_string_to_null
    TellStick.release_string pointer
    string
  end
end
