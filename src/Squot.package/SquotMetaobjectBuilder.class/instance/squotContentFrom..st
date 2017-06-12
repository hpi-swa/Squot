converting
squotContentFrom: anObject
	"If the object was copied when the root object was copied (or it does not have identity),
	then convert it, otherwise omit it."
	| copyOfAnObject |
	copyOfAnObject := copiedObjects at: anObject
		ifAbsent: ["shallow-copied (unowned, transient, value-object?) or primitive"
			anObject == anObject shallowCopy "primitive"
				ifTrue: [anObject]
				ifFalse: [^ nil]].
	^ convertedObjects at: anObject
		ifAbsentPut: [anObject asSquotContentWith: self andCopy: copyOfAnObject]