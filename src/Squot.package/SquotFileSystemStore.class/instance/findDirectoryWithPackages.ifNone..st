private package finding
findDirectoryWithPackages: directoryReference ifNone: absentBlock
	"look for .filetree"
	FSSelectVisitor breadthFirst: directoryReference select:
		[:each |
			(each basename = '.filetree' 
			and: [each reference parent parent directories anySatisfy:
					[:any | any basename endsWith: '.package']])
			ifTrue: [^ each reference parent parent].
			false].
	"look for .project"
	(directoryReference / '.project') exists ifTrue:
		[ | project srcDirectoryString |
		directoryReference / '.project' readStreamDo:
			[:projectStream |
				project := STON fromString: (projectStream text; contents)].
		srcDirectoryString := project at: 'srcDirectory' ifAbsent: [].
		srcDirectoryString ifNotNil:
			[^ directoryReference resolve: srcDirectoryString]].
	^ absentBlock value
