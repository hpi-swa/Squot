tests
testInitializeWithEverything
	| commit tree message author committer blob |
	blob := GitBlob bytes: 'aBlob' in: nil.
	message := 'a test message'.
	author := (GitStamp new
				email: 'mail@server.ext';
				name: 'Homer Simpson';
				timeStamp: TimeStamp now;
				yourself).
	committer := (GitStamp new
					email: 'homer@simpson.spr';
					name: 'Bart Simpson';
					timeStamp: TimeStamp now;
					yourself).
	tree := GitTree 
		entries: {
			GitTreeEntry 
				fileNamed: 'filename'
				hash: blob hash
				in: repository }
		in: nil.
	
	commit := GitCommit 
				withTree: tree
				message: message
				author: author
				committer: committer
				in: nil.
	
	self assert: commit tree = tree.
	self assert: commit message = message.
	self assert: commit author = author.
	self assert: commit committer = committer