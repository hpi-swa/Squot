private
classNameOf: anArtifact
	^ (anArtifact storeInfo firstReferenceOfType: 'class') value at: 'className'