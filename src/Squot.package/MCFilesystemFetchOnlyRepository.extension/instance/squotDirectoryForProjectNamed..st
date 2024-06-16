*Squot-Mapper-Assets
squotDirectoryForProjectNamed: aString
	(self projectPath endsWith: '/', aString) ifFalse: [^ nil].
	^ (self
		projectDirectoryFrom: self projectPath
		version: self projectVersion) asFSReference