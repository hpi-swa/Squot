accessing
remote: aString
	self remote = aString
		ifFalse:[
			remote := aString.
			self updateRemote ].