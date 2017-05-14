initialize-release
loadModeFrom: aStream
	| mode |
	mode := 
		Integer 
			readFrom: (aStream upTo: Character space asInteger) asString 
			base: 8.
	mode = self class fileMode ifTrue: [ ^ self beInFileMode ].
	mode = self class executableFileMode ifTrue: [ ^ self beInExecutableFileMode ].
	mode = self class dirMode ifTrue: [ ^ self beInDirectoryMode ].
	mode = self class submoduleMode ifTrue: [ ^ self beInSubmoduleMode ].
	mode = self class symlinkMode ifTrue: [ ^ self beInSymlinkMode ].
	
	GitInvalidObjectError signal: 'This tree entry has an invalid filemode.'