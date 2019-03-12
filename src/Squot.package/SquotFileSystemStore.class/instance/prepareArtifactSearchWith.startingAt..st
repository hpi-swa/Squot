guessing
prepareArtifactSearchWith: locators startingAt: aFileOrDirectory
	| search |
	search := SquotFileSearchForArtifacts new.
	locators do: [:each | search visit: aFileOrDirectory with: each].
	^ search