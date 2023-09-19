registering
named: aString
	^ self registry at: aString ifAbsent: [
		^ self error: ('No project with the name ''{1}'' was registered.' format: {aString})]