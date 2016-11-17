writing
fileOut: aVersion on: aStream
	| inst workingCopyEnvironment |
	inst := self on: aStream.
	workingCopyEnvironment := aVersion package hasWorkingCopy
		ifTrue: [aVersion package workingCopy package environment]
		ifFalse: [Environment current].
	workingCopyEnvironment beCurrentDuring: [inst writeVersion: aVersion].