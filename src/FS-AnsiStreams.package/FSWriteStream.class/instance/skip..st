as yet unclassified
skip: anInteger
	isBinary
		ifTrue: [position := position + anInteger min: handle size max: 0]
		ifFalse: [anInteger timesRepeat: [
				self atEnd ifTrue: [^ self].
				self converter nextFromStream: self].
			anInteger negative timesRepeat: [
				self atStart ifTrue: [^ self].
				self converter backFromStream: self]]