private creating new versions
handlePathChangesDuring: aBlock
	self flag: #todo.
	"SquotPathChanged is only needed to catch changes made in #validatePath,
	which is deprecated. Remove the signal handling and SquotPathChanged when validatePath
	is removed."
	^ aBlock
		on: SquotPathChanged doAndResume: [:changed |
			store moveObjectAt: changed previousPath to: changed newPath]