instance creation
fromString: aString forRemote: aGitRemote
	^ self new
		remote: aGitRemote;
		parseString: aString;
		yourself