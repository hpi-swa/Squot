initialize-release
initializeClean
	"Clients that wish to have no defaults applied to the produced version should call this."
	(author := GitStamp new)
		name: '';
		email: ''.
	committer := author.
	message := ''.
	parents := OrderedCollection new.