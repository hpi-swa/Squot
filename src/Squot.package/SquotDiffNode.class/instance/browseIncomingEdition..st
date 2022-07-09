browsing
browseIncomingEdition: aWorkingCopy 
	self browse:
		((((self content respondsTo: #isMerge) and: [self content isMerge])
				or: [(self content respondsTo: #isConflict) and: [self content isConflict]])
			ifTrue: [self content incoming]
			ifFalse: [self content right])