*Squot-Tests
withNewIdValueHeldAtPath: aString
	^ self withNewId
		at: 'path' put: aString;
		at: 'references' put: (Dictionary newFrom:
				{'object_1' -> (Dictionary newFrom:
					{'type' -> 'ValueHolder'.
					'content-type' -> 'application/octet-stream'.
					'codec-class' -> 'SmartRefStream'})});
		yourself