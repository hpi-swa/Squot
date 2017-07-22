rematerializing
materializeAs: anObject with: aMaterializer
	"Fill anObject like my original"
	anObject class ~= capturedClass ifTrue:
		[^ aMaterializer materialize: self in: self createMaterializedInstance].
	anObject basicSize ~= self basicSizeOfMaterializedInstance ifTrue:
		[^ aMaterializer materialize: self in: self createMaterializedInstance].
	slots associationsDo: [:each | each materializeIn: anObject with: aMaterializer].
	^ anObject