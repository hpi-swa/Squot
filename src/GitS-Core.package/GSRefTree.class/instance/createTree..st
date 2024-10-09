adding
createTree: aString
	^ GSRefTree new
		workingCopy: self workingCopy;
		label: aString;
		ref: self ref, aString, $/;
		yourself