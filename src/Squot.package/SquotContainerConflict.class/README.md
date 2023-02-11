A conflict where the object was removed in one edition and modified in others.

Instance Variables
	base:		<SquotArtifact>
	incoming:		<SquotArtifactDiff> between base and the other container
	resolution:		<SquotArtifactDiff> that patches the working copy to the chosen state
	working:		<SquotArtifactDiff> between base and working copy
	preparedResolution:	<SquotArtifactDiff> between working copy and the other container, modifable