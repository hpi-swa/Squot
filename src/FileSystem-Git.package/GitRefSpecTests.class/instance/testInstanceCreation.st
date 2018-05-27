testing
testInstanceCreation
	| refSpec |
	refSpec := GitRefSpec fromString: '+refs/heads/*:refs/remotes/origin/*'.
	self assert: refSpec areDestructiveUpdatesAllowed;
		assert: 'refs/heads/*' equals: refSpec leftRefPattern;
		assert: 'refs/remotes/origin/*' equals: refSpec rightRefPattern.
	refSpec := GitRefSpec fromString: 'refs/heads/*/from:refs/remotes/myremote/*/to'.
	self deny: refSpec areDestructiveUpdatesAllowed;
		assert: 'refs/heads/*/from' equals: refSpec leftRefPattern;
		assert: 'refs/remotes/myremote/*/to' equals: refSpec rightRefPattern.