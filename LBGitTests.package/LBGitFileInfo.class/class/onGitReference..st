as yet unclassified
onGitReference: aFSReference

	| workingReference gitReference path |
	workingReference := aFSReference fileSystem repository repository instVarNamed: #reference.
	gitReference := aFSReference parent.
	path := ''.
	aFSReference path do: [:each | path := path,'/',each].
	path := path copyFrom: 2 to: path size.
	^ self 
		on: path
		in: workingReference
		git: gitReference 