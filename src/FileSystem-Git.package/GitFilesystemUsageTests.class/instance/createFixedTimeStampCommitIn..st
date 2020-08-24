helpers
createFixedTimeStampCommitIn: anFSReference
	| repository blob tree commit committer author |
	repository := GitRepository on: anFSReference.
	repository withUnitOfWork: [
		
	blob := GitBlob bytes: 'blob1' in: repository.
	blob store.
	
	tree := GitTree 
		entries: {
			GitTreeEntry
				fileNamed: 'first blob'
				hash: blob hash
				in: repository }
		in: repository.
	tree store.
		
	committer := (GitStamp new
		email: 'mail@server.ext';
		name: 'Homer Simpson';
		timeStamp: (DateAndTime year: 2011 month: 06 day: 28 hour: 22 minute: 10) asTimeStamp;
		yourself).
	author := (GitStamp new
		email: 'mail@server.ext';
		name: 'Homer Simpson';
		timeStamp: (DateAndTime year: 2010 month: 06 day: 27 hour: 21 minute: 11) asTimeStamp;
		yourself). 
					
	commit := GitCommit
		withTree: tree
		message: 'aMessage'
		author: author
		committer: committer
		in: repository.
	commit parents: OrderedCollection new.
	commit store.

	repository unitOfWork updateRef: 'refs/heads/master' to: commit hexHash.
	GitFSCK validate: repository.
	].