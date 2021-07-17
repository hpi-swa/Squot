capturing
replacementFor: anObject using: aCapturer
	"Answer an object that shall take the place of anObject in the captured object graph."
	^ anObject objectForDataStream: aCapturer