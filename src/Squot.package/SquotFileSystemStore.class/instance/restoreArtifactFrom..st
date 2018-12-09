private
restoreArtifactFrom: aFileOrDirectory
	| artifact artifactClass metadata |
	"self assert: aFileOrDirectory exists"
	metadata := self metadataForObjectAt: aFileOrDirectory.
	metadata isPresent ifFalse: [(SquotNoMetadataFileFound for: aFileOrDirectory) signal].
	artifactClass := metadata artifactClass.
	artifact := artifactClass new.
	artifact path: (self pathOf: aFileOrDirectory).
	metadata applyTo: artifact.
	self deserialize: artifact in: aFileOrDirectory.
	^ artifact