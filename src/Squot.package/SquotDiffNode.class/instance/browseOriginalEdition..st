browsing
browseOriginalEdition: aWorkingCopy
	self browse:
		((((self content respondsTo: #isMerge) and: [self content isMerge])
				or: [(self content respondsTo: #isConflict) and: [self content isConflict]])
			ifTrue: [self content base]
			ifFalse: [self content left]).