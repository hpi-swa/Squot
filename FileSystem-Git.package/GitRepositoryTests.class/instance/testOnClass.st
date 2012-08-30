class-tests
testOnClass
	self should: [ GitRepository on: FileSystem onDisk ]
		raise: Error
		description: 'Please provide an instance of a filesystem, not a class.'.