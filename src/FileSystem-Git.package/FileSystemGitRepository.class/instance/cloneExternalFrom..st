git porcelain
cloneExternalFrom: aStringOrUrl
	| directory children |
	directory := repository workingDir.
	children := directory children.
	(children isEmpty or: [children size = 1 and: [children first basename = '.git']])
		ifFalse: [^ self error: 'Target directory is not empty'].
	directory deleteAll.
	self externalCommand: ('git clone "{1}" "{2}"' format: {aStringOrUrl. directory pathName}).