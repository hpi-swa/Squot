internal
loadGitTreeEntryAt: aPath
	| parentGitTree |
	parentGitTree := self loadGitTreeAt: aPath parent.
	"path doesn't exist in the repository either"
	parentGitTree ifNil: [ ^ nil ].
	^ parentGitTree entryAt: aPath basename ifAbsent: []