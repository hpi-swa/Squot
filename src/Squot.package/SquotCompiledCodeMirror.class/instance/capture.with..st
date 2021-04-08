capturing
capture: anObject with: aSquotObjectCapturer
	"Skip check for isBits."
	^ aSquotObjectCapturer capture: anObject in: self