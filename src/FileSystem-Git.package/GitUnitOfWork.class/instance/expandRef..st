accessing
expandRef: name
	"Answer the full name of a reference."
"From the git-rev-parse manpage:
            1. if $GIT_DIR/<name> exists, that is what you mean (this is usually useful only for HEAD, FETCH_HEAD, ORIG_HEAD and MERGE_HEAD);
            2. otherwise, $GIT_DIR/refs/<name> if exists;
            3. otherwise, $GIT_DIR/refs/tags/<name> if exists;
            4. otherwise, $GIT_DIR/refs/heads/<name> if exists;
            5. otherwise, $GIT_DIR/refs/remotes/<name> if exists;
            6. otherwise, $GIT_DIR/refs/remotes/<name>/HEAD if exists."
	#(	''
		'refs/'
		'refs/tags/'
		'refs/heads/'
		'refs/remotes/'
		"We don't do the last case (number 6) from the manual yet."
	) do: [ :prefix |
		refStores do: [:each | (each includes: prefix, name) ifTrue: [^ prefix, name]]].
	self flag: 'raise exception instead of answering nil?'.
	^ nil