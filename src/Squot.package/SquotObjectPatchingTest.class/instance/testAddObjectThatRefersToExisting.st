testing
testAddObjectThatRefersToExisting
	"Existing objects referenced by new objects should not be duplicated just because the 
	new objects are created new."
	| object existing new patched |
	object := Array with: (existing := ValueHolder new) with: nil.
	patched := self patchedCopyOf: object toReproduce:
		[object at: 2 put: (new := ValueHolder new contents: existing)].
	self assert: (patched startObject at: 1) == (patched startObject at: 2) contents.
	self flag: #TODO.
	"There is a performance problem here: the unmodified ValueHolder is also materialized 
	anew. The object stays the same, but its variables are needlessly filled again. That should
	be done by the diff, if any. This is caused because the SquotObjectPatcher hands over to
	its SquotShadowMaterializer, which continues with the referenced objects of the added
	ValueHolder. For the existing ValueHolder, the task is not given back to the 
	SquotObjectPatcher."