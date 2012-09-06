 module TellStick
  extend FFI::Library

  ffi_lib ['/Library/Frameworks/TelldusCore.framework/TelldusCore', 'TelldusCore', 'telldus-core']

  METHODS = enum( :turn_on,   1,
                  :turn_off,  2,
                  :bell,      4,
                  :toggle,    8,
                  :dim,       16,
                  :learn,     32,
                  :execute,   64,
                  :up,        128,
                  :down,      256,
                  :stop,      512 )

  enum :error_code, [:success, 0,
                     :not_found, -1,
                     :permission_denied, -2,
                     :device_not_found, -3,
                     :method_not_supported, -4,
                     :communitation, -5,
                     :connecting_service, -6,
                     :unkown_response, -7,
                     :syntax, -8,
                     :broken_pipe, -9,
                     :communicating_service, -10,
                     :unkown, -99]

  #int WINAPI tdGetNumberOfDevices()
  attach_function :number_of_devices, :tdGetNumberOfDevices, [], :int
  
  #int WINAPI tdGetDeviceId(int intDeviceIndex)
  attach_function :device_id_for_index, :tdGetDeviceId, [:int], :int
  
  #char * WINAPI tdGetName(int intDeviceId)
  attach_function :device_name, :tdGetName, [:int], :pointer

  #bool WINAPI tdSetName(int intDeviceId, const char* chNewName)
  attach_function :set_device_name, :tdSetName, [:int, :string], :bool

  #char * WINAPI tdGetProtocol(int intDeviceId)
  attach_function :protocol, :tdGetProtocol, [:int], :pointer

  #bool WINAPI tdSetProtocol(int intDeviceId, const char* strProtocol)
  attach_function :set_protocol, :tdSetProtocol, [:int, :string], :bool

  #char * WINAPI tdGetModel(int intDeviceId)
  attach_function :device_model, :tdGetModel, [:int], :pointer

  #bool WINAPI tdSetModel(int intDeviceId, const char *intModel)
  attach_function :set_device_model, :tdSetModel, [:int, :string], :bool

  #int WINAPI tdLastSentCommand(int intDeviceId, int methodsSupported)
  attach_function :last_sent_commmand, :tdLastSentCommand, [:int, :int], :int

  #char *WINAPI tdLastSentValue(int intDeviceId)
  attach_function :last_sent_value, :tdLastSentValue, [:int], :pointer

  #int WINAPI tdMethods(int id, int methodsSupported)
  attach_function :device_methods, :tdMethods, [:int, :int], :int

  #char * WINAPI tdGetErrorString(int intErrorNo)
  attach_function :error, :tdGetErrorString, [:int], :pointer

  #int WINAPI tdLearn(int intDeviceId)
  attach_function :learn, :tdLearn, [:int], :error_code

  #int WINAPI tdTurnOn(int intDeviceId)
  attach_function :turn_on, :tdTurnOn, [:int], :error_code
 
  #int WINAPI tdTurnOff(int intDeviceId)
  attach_function :turn_off, :tdTurnOff, [:int], :error_code

  #int WINAPI tdBell(int intDeviceId)
  attach_function :sound_bell, :tdBell, [:int], :error_code

  #int WINAPI tdDim(int intDeviceId, unsigned char level)
  attach_function :dim, :tdDim, [:int, :char], :error_code

  #No idea what this actualy does..
  #int WINAPI tdUp(int intDeviceId)
  # attach_function :up, :tdUp, [:int], :error_code

  #No idea what this actualy does..
  #int WINAPI tdDown(int intDeviceId)
  # attach_function :down, :tdDown, [:int], :error_code

  #char * WINAPI tdGetDeviceParameter(int intDeviceId, const char *strName, const char *defaultValue)
  attach_function :device_parameters, :tdGetDeviceParameter, [:int, :string, :string], :pointer

  #bool WINAPI tdSetDeviceParameter(int intDeviceId, const char *strName, const char* strValue)
  attach_function :set_device_parameters, :tdSetDeviceParameter, [:int, :string, :string], :bool  

  #void WINAPI tdReleaseString(char *string)
  attach_function :release_string, :tdReleaseString, [:pointer], :void

end
