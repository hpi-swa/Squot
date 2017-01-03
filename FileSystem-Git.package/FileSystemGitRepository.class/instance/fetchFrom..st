git porcelain
fetchFrom: aRemoteName
	| url fetchConfig localRemoteRefPattern packFile protocol remoteRefPattern remoteRefs wantRefs wantSignatures packFileData |
	url := (repository remoteConfigFor: aRemoteName option: 'url') asUrl.
	fetchConfig := repository remoteConfigFor: aRemoteName option: 'fetch'.
	(fetchConfig splitBy: ':') in: [:parts | remoteRefPattern := parts first. localRemoteRefPattern := parts second].
	remoteRefPattern := remoteRefPattern allButFirst: 1. "+"
	protocol := GitAbstractProtocol url: url.
	protocol withOpenConnection: [
		remoteRefs := protocol refs.
		wantRefs := remoteRefs keys select: [:each | remoteRefPattern match: each].
		wantSignatures := wantRefs collect: [:each | remoteRefs at: each].
		packFileData := protocol wantAll: wantSignatures.
		packFile := GitPackFile readFrom: packFileData readStream].
	packFile repository: repository.
	packFile unpack.
	wantRefs do: [:each | repository updateRef: each to: (remoteRefs at: each)].