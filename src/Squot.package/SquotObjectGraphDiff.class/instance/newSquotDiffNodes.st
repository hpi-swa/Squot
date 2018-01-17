converting
newSquotDiffNodes
	^ self startDiff ifNil: [#()] ifNotNil: [:diff | diff newSquotDiffNodes]