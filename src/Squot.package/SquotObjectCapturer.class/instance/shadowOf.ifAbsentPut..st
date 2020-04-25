accessing
shadowOf: anObject ifAbsentPut: shadowBlock
	"Answer the shadow that I already know for anObject. Create one with shadowBlock if I have none yet, and add it."
	"This is a way for objects that do not want to be captured as ordinary shadows to register their results with me."
	^ convertedObjects at: anObject
		ifAbsentPut: [ | shadow |
			shadow := shadowBlock value.
			objectGraph addShadow: shadow of: anObject.
			shadow]