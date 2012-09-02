tests
testDelete
	self assert: repository exists description: 'Need a repository to delete.'.
	[ repository delete ]
		on: GitRepositoryDeleteRequest 
		do: [ :req | req resume: false].
	self assert: repository exists.
	
	[ repository delete ]
		on: GitRepositoryDeleteRequest 
		do: [ :req | req resume: true].
	self deny: repository exists description: 'Deletion of repository failed.'