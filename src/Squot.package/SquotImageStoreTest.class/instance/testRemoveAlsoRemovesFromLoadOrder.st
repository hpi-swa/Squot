tests
testRemoveAlsoRemovesFromLoadOrder
	"Removing objects from the store also removes them from the load order."
	self flag: #notLoadedArtifacts. "unloading optional artifacts vs. removing them forever?"
	imageStore add: 1 at: '1'.
	imageStore add: 2 at: '2'.
	self assert: imageStore loadOrder asSet = #('1' '2') asSet.
	"when"
	imageStore remove: 1.
	"then"
	self assert: imageStore loadOrder asArray = #('2').
	"when"
	imageStore removeAt: '2'.
	"then"
	self assert: imageStore loadOrder asArray isEmpty.