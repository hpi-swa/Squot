synchronizing
errorUpstreamBranchNotConfigured
	^ (SquitUpstreamUndefined historian: self) signal: 'Upstream branch is not configured'