merging
mergeWithAddition: anArtifactAddition
	"When there are two additions, each difference between them is a conflict."
	"double dispatch, initiated by #mergeWith:"
	SquotToggles useNewApi ifTrue: [self deprecated].
	^ anArtifactAddition right mergeWithoutBaseWith: self right