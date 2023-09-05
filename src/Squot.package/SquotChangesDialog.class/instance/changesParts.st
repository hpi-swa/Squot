accessing
changesParts
	^ changesParts ifNil: [changesParts := self computeChangesParts]