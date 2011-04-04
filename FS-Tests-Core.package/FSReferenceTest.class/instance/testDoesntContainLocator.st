tests
testDoesntContainLocator
	| ref |
	ref := filesystem referenceTo: 'griffle'. 
	self deny: (ref contains: FSLocator image)