ui
projectList
	^ #('-- Projects --'),
		((SquitSettings useNewApi
			ifTrue: [SquotWorkingCopy2]
			ifFalse: [SquotWorkingCopy]) registered collect: [:each | each name])