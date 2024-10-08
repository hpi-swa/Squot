accessing
promise
	^ promise ifNil: [promise := Promise new]