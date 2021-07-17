tests
testSetHashing
	"Sets are rehashed when they are reactivated, but this only works if they are not reactivated before the hashes of the materialized elements have settled. An array is first rematerialized with all elements nil, later the elements are filled in; this changes the hash of the array. If the array is put into the materialized Set too soon, there will be hash collisions and possibly distinct elements will be lost."
	| set1 set2 restoredSet1 restoredSet2 |
	set1 := Set with: {1} with: {nil}.
	set2 := Set with: {nil} with: {1}.
	restoredSet1 := self captureAndRestore: set1.
	restoredSet2 := self captureAndRestore: set2.
	self assert: (restoredSet1 includesAllOf: #((nil) (1)));
		assert: (restoredSet2 includesAllOf: #((nil) (1))).