instance creation
makeLightWeightTag: aString for: aGitCommit in: aGitRepository
	| tag |
	self assert: aGitCommit species = GitCommit.
	tag := self new
		name: aString;
		object: aGitCommit;
		repository: aGitRepository;
		yourself.
	tag store.
	^tag
		