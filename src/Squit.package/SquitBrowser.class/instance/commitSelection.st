ui
commitSelection
	^ commitSelection ifNil: [commitSelection := self commitList first]