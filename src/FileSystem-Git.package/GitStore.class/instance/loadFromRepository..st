internal
loadFromRepository: aPath
	"try to load the given path from the repositry into our cache"
	|currentGitTree|
	currentGitTree := self loadGitTreeAt: aPath.
	"path doesn't exist in the repository either"
	currentGitTree ifNil: [ ^ self ].
	
			