private
looseObjectNamesDo: aBlock 
	repository objectDirectoriesDo: [ :dirReference | 
		dirReference files do: [ :fileReference | | hash |
			hash := dirReference basename , fileReference basename.
			aBlock value: hash ] ]