private
newTreeFrom: aTree
	self haltIf: repository isNil.
	^ GitTree 
		entries: aTree entries 
		in: repository