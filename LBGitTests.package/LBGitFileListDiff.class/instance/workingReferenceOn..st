as yet unclassified
workingReferenceOn: aPath

	| workingReference |
	workingReference := self left rootDirectory fileSystem repository repository instVarNamed: #reference.
	^ workingReference resolve: aPath.