public-configuration
configAt: aNameString
	^ self configAt: aNameString ifAbsent: [self defaultValueForConfigOption: aNameString].