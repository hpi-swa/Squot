*Squot-Tests
withNewIdValueHeldAtPath: aString
	^ self withNewId
		at: 'path' put: aString;
		at: 'references' put: 
			{'object_1' -> (OrderedDictionary newFrom:
					{'type' -> 'ValueHolder'.
					'content-type' -> 'application/octet-stream'.
					'codec-class' -> 'SmartRefStream'})};
		yourself