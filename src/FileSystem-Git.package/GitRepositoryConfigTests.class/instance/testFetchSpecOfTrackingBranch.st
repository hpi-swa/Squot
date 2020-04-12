tests
testFetchSpecOfTrackingBranch
	| fetchSpec remote |
	"given"
	remote := GitRemote name: 'origin' url: ''.
	remote addFetchSpecString: '+refs/heads/*:refs/remotes/origin/*'.
	self unitOfWork addRemote: remote.
	"when"
	fetchSpec := self unitOfWork fetchSpecOfTrackingBranch: 'refs/remotes/origin/master'.
	"then"
	self assert: 'origin' equals: fetchSpec remoteName;
		assert: 'refs/heads/*' equals: fetchSpec remoteRefPattern;
		assert: 'refs/remotes/origin/*' equals: fetchSpec trackingRefPattern.