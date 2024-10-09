metadata-loading
untrackedMapperForStream: aStream
	^ (GSAssetMapper
		chooseCompatibleMapper: aStream
		ifAmbiguous: [:mappers | GSBlobMapper new])
			isTracked: false;
			yourself