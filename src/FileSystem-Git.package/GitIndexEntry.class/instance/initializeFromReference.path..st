initialize-release
initializeFromReference: aFSReference path: aRelativePath
	| shortNameLength |
	aFSReference exists
		ifTrue: [self updateFromReference: aFSReference]
		ifFalse: [ctime := DateAndTime epoch.
				mtime := DateAndTime epoch.
				size := 0.
				objectHash := #[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]].
	uid := 0.
	gid := 0.
	inode := 0.
	device := 0.
	self flag: #stub. "Squeak cannot determine whether a file is executable or a symlink"
	mode := (self objectTypeRegularFile bitShift: 12) bitOr: self posixPermissionsNonExecutable.
	path := (aRelativePath printWithDelimiter: $/) asByteArray.
	shortNameLength := path size >= 16rFFF
		ifTrue: [16rFFF]
		ifFalse: [path size].
	flags := ByteArray
		"leave assume-valid (1b), extended (1b) and stage (2b) flags at 0"
		with: ((shortNameLength bitAnd: 16rF00) bitShift: -8)
		with: (shortNameLength bitAnd: 16r0FF).