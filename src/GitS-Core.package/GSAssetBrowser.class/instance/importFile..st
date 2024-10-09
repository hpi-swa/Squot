importing
importFile: aReference
	self
		importFile: aReference
		getPath: [self
					requestPathWithSuffix: aReference path basename
					title: 'Path of the imported asset in the repository:'].