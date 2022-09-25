accessing
workingVersion
	"The version on which the working copy is based."
	^ workingVersion ifNil: [workingVersion := self workingCopy baseVersion]