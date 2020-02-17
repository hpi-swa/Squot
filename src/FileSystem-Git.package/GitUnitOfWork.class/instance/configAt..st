accessing
configAt: aNameString
	^ self configAt: aNameString ifAbsent: [repository defaultValueForConfigOption: aNameString].