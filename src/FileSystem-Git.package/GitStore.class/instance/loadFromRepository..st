internal
loadFromRepository: aPath
	"try to load the given path from the repositry into our cache"
	|currentGitTree|
	currentGitTree := self loadGitTreeAt: aPath parent.
	"path doesn't exist in the repository either"
	currentGitTree ifNil: [ ^ self ].
	currentGitTree entryAt: aPath basename
		ifPresent: [:entry |
			entry isInDirectorymode ifTrue: [self loadGitTreeAt: aPath].
			entry isInFilemode ifTrue: [ | blob |
				blob := entry object.
				self updateCacheAt: aPath with: blob]]
		ifAbsent: ["nothing to be loaded here"]
