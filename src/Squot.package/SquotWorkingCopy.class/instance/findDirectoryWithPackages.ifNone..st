initialize-release
findDirectoryWithPackages: directoryReference ifNone: absentBlock
	FSSelectVisitor breadthFirst: directoryReference select:
		[:each |
			(each basename = '.filetree' 
			and: [each reference parent directories anySatisfy:
					[:any | any basename endsWith: '.package']])
			ifTrue: [^ each reference parent].
			false].
	^ absentBlock value
			