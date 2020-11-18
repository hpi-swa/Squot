failures
expectedFailures
	^ super expectedFailures, {#testUnloadedArtifactsAdorned "Merge targets are still assumed to be always loaded"}