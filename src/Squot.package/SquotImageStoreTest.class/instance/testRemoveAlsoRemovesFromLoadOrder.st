tests
testRemoveAlsoRemovesFromLoadOrder
	"Removing objects from the store also removes them from the load order."
	| first second |
	self flag: #notLoadedArtifacts. "unloading optional artifacts vs. removing them forever?"
	imageStore add: (first := Object new) at: '1'.
	imageStore add: (second := Object new) at: '2'.
	self assert: imageStore loadOrder asSet = #('1' '2') asSet.
	"when"
	imageStore remove: first.
	"then"
	self assert: imageStore loadOrder asArray = #('2').
	"when"
	imageStore removeAt: '2'.
	"then"
	self assert: imageStore loadOrder asArray isEmpty.