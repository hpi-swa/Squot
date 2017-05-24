Squot repository
metaHistorianForLastLoadedVersion
	"Answer a historian for the latest version loaded into this image"
	^ self historianNamed: 'refs/meta/squot-loaded-', Smalltalk imageName asPath basename