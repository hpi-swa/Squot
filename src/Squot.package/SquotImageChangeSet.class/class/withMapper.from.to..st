instance creation
withMapper: aMapper from: aForm to: anotherForm
	^ (self withMapper: aMapper)
		from: aForm;
		to: anotherForm;
		yourself