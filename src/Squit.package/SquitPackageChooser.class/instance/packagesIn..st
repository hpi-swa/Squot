choosing packages
packagesIn: aWorkingCopy
	^ OrderedCollection streamContents:
		[:packageNames |
		aWorkingCopy store objectsWithPathsDo:
			[:object :path |
			(object respondsTo: #packageName) ifTrue:
				[packageNames nextPut: object packageName]]]