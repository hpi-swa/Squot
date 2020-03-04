helpers-verifying
packFileForDeltificationBase
	| newRepository |
	newRepository := self newRepositoryForDeltificationBase.
	^ self packFileForDeltificationBaseIn: newRepository