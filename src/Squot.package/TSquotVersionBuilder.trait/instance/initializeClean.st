initialize-release
initializeClean
	"Clients that wish to have no defaults applied to the produced version should call this."
	self author: ''.
	self committer: ''.
	self message: ''.
	self parents: OrderedCollection new.