loading
loadWith: imageStore replacing: anObject
	"Invoke a load operation in imageStore depending on the type of the stored content"
	^ content asLoadedBySquot: imageStore from: self replacing: anObject