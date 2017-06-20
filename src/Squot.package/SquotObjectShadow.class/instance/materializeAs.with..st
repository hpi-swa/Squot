rematerializing
materializeAs: anObject with: aMaterializer
	"Fill anObject like my original"
	slots associationsDo: [:each | each materializeIn: anObject with: aMaterializer].
	^ anObject