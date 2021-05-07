synchronizing
importFromUpstream
	"Fetch from the remote tracked by this branch"
	repository importFromAll:
		{self upstreamRemoteName ifNil: [^ self errorUpstreamBranchNotConfigured]}.
	self flag: #todo. "In the future, might collect all updated refs and return that (to resolve the promise with that)."