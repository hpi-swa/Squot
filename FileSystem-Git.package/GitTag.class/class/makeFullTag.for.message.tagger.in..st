instance creation
makeFullTag: tagName for: aGitCommit message: message tagger: aGitStamp in: aGitRepository
	| tag |
	tag := self new
		name: tagName;
		object: aGitCommit;
		message: message;
		tagger: aGitStamp;
		repository: aGitRepository;
		yourself.
	tag store.
	^tag