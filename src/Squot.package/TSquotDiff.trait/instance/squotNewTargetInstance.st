Squot-diff-patching
squotNewTargetInstance
	"Answer a new live object to which I can be applied."
	self flag: #review. "This sounds fishy. Why do we apply a patch that refers to an object that does not even exist yet? Is something wrong with the patch?"
	^ self shouldBeImplemented