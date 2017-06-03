private configuration
defaultValueForConfigOption: aString
	^ ConfigDefaults at: aString ifAbsent: nil