temporary historians
metaHistorianForLastLoadedVersion
	"Answer a historian for the latest version loaded into this image"
	^ self historianNamed: 'meta/squot-loaded-', Smalltalk imageName asPath basename