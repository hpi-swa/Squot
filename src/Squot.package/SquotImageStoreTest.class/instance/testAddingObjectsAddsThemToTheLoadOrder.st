tests
testAddingObjectsAddsThemToTheLoadOrder
	"When an object is added, its path is appended to the load order."
	| object |
	object := StringHolder new contents: 'test'.
	self assert: imageStore loadOrder isEmpty.
	imageStore add: object at: 'object1'.
	self assert: imageStore loadOrder asArray = #('object1').
	imageStore add: object copy at: 'object2'.
	self assert: imageStore loadOrder asArray = #('object1' 'object2').