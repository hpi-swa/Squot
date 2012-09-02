loading
loadName
	| tags |
	tags := commit tags.
	tags isEmpty 
		ifFalse: [ ^ tags first name ].
	^ commit sha1