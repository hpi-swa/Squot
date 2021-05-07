initialize-release
initializeClean
	"Clients that wish to have no defaults applied to the produced version should call this."
	author := nil.
	committer := nil.
	message := ''.
	parents := OrderedCollection new.