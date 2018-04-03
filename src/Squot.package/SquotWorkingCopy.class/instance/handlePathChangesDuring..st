private creating new versions
handlePathChangesDuring: aBlock
	^ aBlock
		on: SquotPathChanged doAndResume: [:changed |
			store moveObjectAt: changed previousPath to: changed newPath]