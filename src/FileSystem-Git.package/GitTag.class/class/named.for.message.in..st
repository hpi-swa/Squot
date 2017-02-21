instance creation
named: tagName for: aGitCommit message: message in: aGitRepository
	^ self
		named: tagName 
		for: aGitCommit
		message: message 
		tagger: GitStamp now
		in: aGitRepository 