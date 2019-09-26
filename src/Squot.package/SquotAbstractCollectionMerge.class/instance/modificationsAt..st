accessing
modificationsAt: key
	^ Array with:
		(containerModifications at: key 
			ifAbsent: [^ (self mergeAt: key) modifications])