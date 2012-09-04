instance creation
named: tagName for: aGitCommit message: message tagger: aGitStamp in: aGitRepository
	^ self new
		name: tagName;
		object: aGitCommit;
		message: message;
		tagger: aGitStamp;
		repository: aGitRepository;
		store;
		yourself