instance creation
makeFullTag: tagName for: aGitCommit message: message in: aGitRepository
	^ self
		makeFullTag: tagName
		for: aGitCommit
		message: message
		tagger: GitStamp now
		in: aGitRepository