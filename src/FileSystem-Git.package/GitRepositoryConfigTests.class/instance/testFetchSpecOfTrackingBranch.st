testing
testFetchSpecOfTrackingBranch
	| fetchSpec remote |
	"given"
	remote := GitRemote name: 'origin' url: ''.
	remote addFetchSpecString: '+refs/heads/*:refs/remotes/origin/*'.
	repository addRemote: remote.
	"when"
	fetchSpec := repository fetchSpecOfTrackingBranch: 'refs/remotes/origin/master'.
	"then"
	self assert: 'origin' equals: fetchSpec remoteName;
		assert: 'refs/heads/*' equals: fetchSpec remoteRefPattern;
		assert: 'refs/remotes/origin/*' equals: fetchSpec trackingRefPattern.