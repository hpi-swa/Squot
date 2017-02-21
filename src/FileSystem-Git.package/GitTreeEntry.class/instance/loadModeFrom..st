initialize-release
loadModeFrom: aStream
	| mode |
	mode := 
		Integer 
			readFrom: (aStream upTo: Character space asInteger) asString 
			base: 8.
	mode = self class fileMode ifTrue: [ ^ self beInFilemode ].
	mode = self class dirMode ifTrue: [ ^ self beInDirectorymode ].
	
	GitInvalidObjectError signal: 'This tree entry has an invalid filemode.'