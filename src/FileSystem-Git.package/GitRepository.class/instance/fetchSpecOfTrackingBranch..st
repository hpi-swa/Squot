public-configuration
fetchSpecOfTrackingBranch: remoteTrackingBranchString
	"Answer the fetch spec that constitutes the given remote-tracking branch
	or nil if no remote has a fitting fetch spec."
	| fetchSpecValue remoteName remote firstDotIndex remoteFetchSpecAssoc secondDotIndex |
	self privateDeprecatedUseUnitOfWork.
	remoteFetchSpecAssoc := 
		(((self configSubsetWithPrefix: 'remote')
			select: [:each | each key endsWith: '.fetch'])
			detect: [:each | (each value copyAfter: $:) match: remoteTrackingBranchString]
			ifNone: [^ nil]).
	firstDotIndex := remoteFetchSpecAssoc key indexOf: $..
	secondDotIndex := remoteFetchSpecAssoc key indexOf: $. startingAt: firstDotIndex + 1.
	remoteName := remoteFetchSpecAssoc key copyFrom: firstDotIndex + 1 to: secondDotIndex - 1.
	remote := self remoteNamed: remoteName.
	fetchSpecValue := remoteFetchSpecAssoc value.
	^ GitFetchSpec fromString: fetchSpecValue forRemote: remote.