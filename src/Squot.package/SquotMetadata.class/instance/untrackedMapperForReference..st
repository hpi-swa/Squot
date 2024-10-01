untracked-mappers
untrackedMapperForReference: aReference
	^ (aReference readStreamDo: [:stream | self untrackedMapperForStream: stream])
		path: aReference path;
		yourself