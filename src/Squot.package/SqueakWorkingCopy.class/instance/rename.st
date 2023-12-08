accessing
rename
	self name:
		((self class
			requestUnregisteredNameFrom: self name
			title:
				('Rename project ''{1}''. Beware that this name is used for identifying the project, ',
				'e. g. when loading assets via {2} for: ''project-name-here''. ',
				'Make sure the other users and team members of your project use the same name. New name:'
					format: {self name. GitAssetLoader printString}))
			ifNil: [^ self]).