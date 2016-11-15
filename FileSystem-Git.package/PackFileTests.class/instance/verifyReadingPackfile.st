verifying
verifyReadingPackfile
	| workingCopy|
	workingCopy := repository head.
	self assert: 'blah2' equals: workingCopy message withBlanksTrimmed.
	
	self assert: 1 equals: workingCopy parents size.
	workingCopy := workingCopy parents first.
	self assert: 'blah' equals: workingCopy message withBlanksTrimmed.
	
	"I reset HEAD to the second to last commit. So the last commit is not reachable"
	workingCopy := repository objectNamed: 'fea21a7e0e910cf24f3c455cc6e0ea86d589a0db'.
	self assert: 'blah3' equals: workingCopy message withBlanksTrimmed.
	
	"see if all object types are accessable"
	self 
		shouldnt: [ repository objectNamed: '98564e36d46a682f13e716b6f5e13d94cd9461b7' ] "tree"
		raise: Error.
	self 
		shouldnt: [ repository objectNamed: 'e1f6defb3f5b3e6d851165c8c38c18ba42b5649b' ] "tree"
		raise: Error.
	self 
		shouldnt: [ repository objectNamed: 'ea511757325072abacc21fc749c7000461dbc857' ] "tree"
		raise: Error.
	self 
		shouldnt: [ repository objectNamed: '370101a2d57b40c37da9b42b688e61eb968f943e' ] "original blob"
		raise: Error.
	self 
		shouldnt: [ repository objectNamed: 'd8bf7c56584e5e2a7d51f27ea9eec36cc2695b72' ] "blob in second commit (delta)"
		raise: Error.
	self 
		shouldnt: [ repository objectNamed: '286064b187da14ddaab211e6579a225f179083e7' ] "blob in third commit (delta)"
		raise: Error