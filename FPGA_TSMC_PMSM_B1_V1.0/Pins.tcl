	set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"
	set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF
	
	# Pins 
	set_location_assignment PIN_210 -to CLKIN
	set_location_assignment PIN_202 -to XINT3
	set_location_assignment PIN_224 -to RST
	
#	set_location_assignment PIN_37 -to DAC_ADD\[0\]
#	set_location_assignment PIN_38 -to DAC_ADD\[1\]
#	set_location_assignment PIN_55 -to DAC_DATA\[0\]
#	set_location_assignment PIN_56 -to DAC_DATA\[1\]
#	set_location_assignment PIN_51 -to DAC_DATA\[2\]
#	set_location_assignment PIN_52 -to DAC_DATA\[3\]
#	set_location_assignment PIN_49 -to DAC_DATA\[4\]
#	set_location_assignment PIN_50 -to DAC_DATA\[5\]
#	set_location_assignment PIN_45 -to DAC_DATA\[6\]
#	set_location_assignment PIN_46 -to DAC_DATA\[7\]
#	set_location_assignment PIN_43 -to DAC_DATA\[8\]
#	set_location_assignment PIN_44 -to DAC_DATA\[9\]
#	set_location_assignment PIN_39 -to DAC_DATA\[10\]
#	set_location_assignment PIN_41 -to DAC_DATA\[11\]
#	set_location_assignment PIN_63 -to LDAC
#	set_location_assignment PIN_57 -to DAC_RST
	
#	set_location_assignment PIN_80 -to ADC_DATA\[0\]	
#	set_location_assignment PIN_83 -to ADC_DATA\[1\]
#	set_location_assignment PIN_82 -to ADC_DATA\[2\]
#	set_location_assignment PIN_87 -to ADC_DATA\[3\]
#	set_location_assignment PIN_84 -to ADC_DATA\[4\]
#	set_location_assignment PIN_93 -to ADC_DATA\[5\]
#	set_location_assignment PIN_88 -to ADC_DATA\[6\]
#	set_location_assignment PIN_95 -to ADC_DATA\[7\]
#	set_location_assignment PIN_94 -to ADC_DATA\[8\]
#	set_location_assignment PIN_99 -to ADC_DATA\[9\]
#	set_location_assignment PIN_98 -to ADC_DATA\[10\]
#	set_location_assignment PIN_100 -to ADC_DATA\[11\]
#	set_location_assignment PIN_103 -to ADC_DATA\[12\]
#	set_location_assignment PIN_106 -to ADC_DATA\[13\]
#	set_location_assignment PIN_107 -to ADC_DATA\[14\]
#	set_location_assignment PIN_110 -to ADC_DATA\[15\]
	
#	set_location_assignment PIN_76 -to ADC_BUSY
#	set_location_assignment PIN_81 -to ADC_CS
#	set_location_assignment PIN_73 -to ADC_RST
#	set_location_assignment PIN_70 -to ADC_RD
#	set_location_assignment PIN_78 -to ADC_COV
#	set_location_assignment PIN_226 -to ADC_END

	set_location_assignment PIN_145 -to XA\[0\]
	set_location_assignment PIN_144 -to XA\[1\]
	set_location_assignment PIN_143 -to XA\[2\]
	set_location_assignment PIN_142 -to XA\[3\]
	set_location_assignment PIN_139 -to XA\[4\]		
	set_location_assignment PIN_137 -to XA\[5\]
	set_location_assignment PIN_135 -to XA\[6\]
	set_location_assignment PIN_134 -to XA\[7\]
	set_location_assignment PIN_133 -to XA\[8\]
	set_location_assignment PIN_132 -to XA\[9\]
	set_location_assignment PIN_131 -to XA\[10\]
	set_location_assignment PIN_128 -to XA\[11\]
	set_location_assignment PIN_127 -to XA\[12\]
	set_location_assignment PIN_126 -to XA\[13\]
	set_location_assignment PIN_118 -to XA\[14\]	
	set_location_assignment PIN_117 -to XA\[15\]
	set_location_assignment PIN_114 -to XA\[16\]
	set_location_assignment PIN_113 -to XA\[17\]
	set_location_assignment PIN_112 -to XA\[18\]
	set_location_assignment PIN_111 -to XA\[19\]

	set_location_assignment PIN_169 -to XD\[0\]
	set_location_assignment PIN_171 -to XD\[1\]
	set_location_assignment PIN_173 -to XD\[2\]	
	set_location_assignment PIN_176 -to XD\[3\]
	set_location_assignment PIN_177 -to XD\[4\]
	set_location_assignment PIN_183 -to XD\[5\]
	set_location_assignment PIN_184 -to XD\[6\]
	set_location_assignment PIN_185 -to XD\[7\]
	set_location_assignment PIN_186 -to XD\[8\]
	set_location_assignment PIN_187 -to XD\[9\]
	set_location_assignment PIN_188 -to XD\[10\]
	set_location_assignment PIN_189 -to XD\[11\]
	set_location_assignment PIN_194 -to XD\[12\]
	set_location_assignment PIN_195 -to XD\[13\]
	set_location_assignment PIN_196 -to XD\[14\]	
	set_location_assignment PIN_197 -to XD\[15\]	
	
	set_location_assignment PIN_166 -to XWE0	
	set_location_assignment PIN_159 -to XRD
#	set_location_assignment PIN_207 -to XADC


	set_location_assignment PIN_106 -to LED3
	set_location_assignment PIN_107 -to LED4

	set_location_assignment PIN_38 -to PWMA1
	set_location_assignment PIN_37 -to PWMA2
	set_location_assignment PIN_41 -to PWMA3
	set_location_assignment PIN_39 -to PWMA4
	set_location_assignment PIN_44 -to PWMA5
	set_location_assignment PIN_43 -to PWMA6
	set_location_assignment PIN_46 -to PWMA7
	set_location_assignment PIN_45 -to PWMA8

	set_location_assignment PIN_50 -to PWMB1
	set_location_assignment PIN_49 -to PWMB2
	set_location_assignment PIN_52 -to PWMB3
	set_location_assignment PIN_51 -to PWMB4
	set_location_assignment PIN_56 -to PWMB5
	set_location_assignment PIN_55 -to PWMB6
	set_location_assignment PIN_63 -to PWMB7
	set_location_assignment PIN_57 -to PWMB8

	set_location_assignment PIN_69 -to PWMC1
	set_location_assignment PIN_68 -to PWMC2
	set_location_assignment PIN_73 -to PWMC3
	set_location_assignment PIN_70 -to PWMC4
	set_location_assignment PIN_78 -to PWMC5
	set_location_assignment PIN_76 -to PWMC6
	set_location_assignment PIN_81 -to PWMC7
	set_location_assignment PIN_80 -to PWMC8


	set_location_assignment PIN_83 -to PWMD1
	set_location_assignment PIN_82 -to PWMD2
	set_location_assignment PIN_87 -to PWMD3
	set_location_assignment PIN_84 -to PWMD4
	set_location_assignment PIN_93 -to PWMD5
	set_location_assignment PIN_95 -to PWMD6
	set_location_assignment PIN_94 -to PWMD7
	set_location_assignment PIN_201 -to SD

	set_location_assignment PIN_203 -to DOV

