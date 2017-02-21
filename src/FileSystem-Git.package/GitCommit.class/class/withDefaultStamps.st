instance creation
withDefaultStamps
	| s |
	s := GitStamp now.
	^ self new 
		author: s;
		committer: s;
		yourself