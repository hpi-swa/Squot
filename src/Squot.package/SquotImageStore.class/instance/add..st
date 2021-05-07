adding and removing
add: anArtifact
	"materialize anArtifact and track the materialized object from now on"
	(self restoreObjectFrom: anArtifact) ifNil: [^ nil].
	^ self artifactAt: anArtifact path