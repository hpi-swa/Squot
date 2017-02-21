public-accessing-references
resolveRef: name
"From the git-rev-parse manpage:
            1. if $GIT_DIR/<name> exists, that is what you mean (this is usually useful only for HEAD, FETCH_HEAD, ORIG_HEAD and MERGE_HEAD);
            2. otherwise, $GIT_DIR/refs/<name> if exists;
            3. otherwise, $GIT_DIR/refs/tags/<name> if exists;
            4. otherwise, $GIT_DIR/refs/heads/<name> if exists;
            5. otherwise, $GIT_DIR/refs/remotes/<name> if exists;
            6. otherwise, $GIT_DIR/refs/remotes/<name>/HEAD if exists."
	| havePackedRefs packedRefs basePath|	
	havePackedRefs := false.
	basePath := self baseDir .
	packedRefs := nil.
	#(	''
		'refs/'
		'refs/tags/'
		'refs/heads/'
		'refs/remotes/'
		"We don't do the last case (number 6) from the manual yet."
	) do: [ :prefix |
		(self resolveLooseRef: (basePath resolve: (prefix , name)))
			ifNotNilDo: [ :result | ^ result ].
		havePackedRefs ifFalse: [
				packedRefs := self packedRefs. 
				havePackedRefs := true ].
		packedRefs ifNotNil: [
			self packedRefs at: prefix , name 
					ifPresent: [ :result | ^ result ] ] ].
	self flag: 'raise exception instead of answering nil?'.
	^ nil