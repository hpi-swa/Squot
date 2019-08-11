patching
mergeWithAddition: anArtifactAddition
	"When there are two additions, each difference between them is a conflict."
	"double dispatch, initiated by #mergeWith:"
	^ anArtifactAddition right mergeWithoutBaseWith: self right