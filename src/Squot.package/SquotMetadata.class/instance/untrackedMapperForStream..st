untracked-mappers
untrackedMapperForStream: aStream
	^ (SquotAssetMapper
		chooseCompatibleMapper: aStream
		ifAmbiguous: [:mappers | SquotBlobMapper new])
			isTracked: false;
			yourself