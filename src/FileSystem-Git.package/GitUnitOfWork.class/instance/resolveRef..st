accessing
resolveRef: name
"Answers a hex hash or nil.
From the git-rev-parse manpage:
            1. if $GIT_DIR/<name> exists, that is what you mean (this is usually useful only for HEAD, FETCH_HEAD, ORIG_HEAD and MERGE_HEAD);
            2. otherwise, $GIT_DIR/refs/<name> if exists;
            3. otherwise, $GIT_DIR/refs/tags/<name> if exists;
            4. otherwise, $GIT_DIR/refs/heads/<name> if exists;
            5. otherwise, $GIT_DIR/refs/remotes/<name> if exists;
            6. otherwise, $GIT_DIR/refs/remotes/<name>/HEAD if exists."
	repository validateReferenceOrReferenceName: name.
	self flag: #todo. "Couldn't we just use expandRef: here? If no, why not?"
	resolvedRefs at: name ifPresent: [:hexHash | ^ hexHash].
	#(	''
		'refs/'
		'refs/tags/'
		'refs/heads/'
		'refs/remotes/'
		"We don't do the last case (number 6) from the manual yet."
	) do: [ :prefix | | aliases properRefName |
		aliases := OrderedCollection new: (name = 'HEAD' ifTrue: [2] ifFalse: [1]).
		properRefName := self followSymbolicRefs: prefix, name
			do: [:each | aliases add: each].
		(refs at: properRefName) ifNotNil:
			[:ref |
			aliases do: [:eachAlias | resolvedRefs at: eachAlias put: ref signature].
			resolvedRefs at: name put: ref signature.
			^ ref signature]].
	self flag: 'raise exception instead of answering nil?'.
	^ nil