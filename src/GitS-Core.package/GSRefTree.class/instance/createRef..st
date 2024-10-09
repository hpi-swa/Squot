adding
createRef: aString
	^ GSRefWrapper new
		workingCopy: self workingCopy;
		label: aString;
		ref: self ref, aString;
		yourself