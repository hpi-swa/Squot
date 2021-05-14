running
setLoadedHistorianFromHead
	| head |
	repository unitOfWork
		activateDuring:
			[head := (repository gitRepository unitOfWork ref: 'HEAD')
						ifNotNil: [:ref | ref isSymbolic
								ifTrue: [ref targetRef]].
			head ifNotNil: [:ref | (ref beginsWith: 'refs/heads/')
						ifTrue: [head := head allButFirst: 'refs/heads/' size]].
			workingCopy
				loadedHistorian: (repository historianNamed: (head ifNil: ['master']))]