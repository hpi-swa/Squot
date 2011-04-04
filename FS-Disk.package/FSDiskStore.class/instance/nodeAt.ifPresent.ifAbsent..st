private
nodeAt: aPath ifPresent: presentBlock ifAbsent: absentBlock
	| name |
	aPath isRoot ifTrue: [ ^ presentBlock value: self rootNode ].
	name := aPath basename.
	self
		directoryAt: aPath parent
		ifAbsent: absentBlock
		nodesDo: 
			[ :entry | 
			(self filename: (entry at: 1) matches: name)
				ifTrue: [ ^ presentBlock value: entry ] ].
	^ absentBlock value