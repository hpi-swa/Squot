running
setUp
	"byte N records the number of objects with names <= N.
	Consequence: byte 255 records the *total* number of objects in the pack"
	super setUp.
	sortedHashes := {
		#[0 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 217 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[20 217 1 54 99 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[235 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[236 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger.
		#[255 216 1 54 98 69 148 164 244 71 189 82 48 250 53 240 85 4 72 81] asInteger }.
	
	self setUpRepository.
	
	creator := GitPackFileCreator new
		repository: repository;
		instVarNamed: 'sortedHashes' put: sortedHashes;
		yourself.
	"create hashDict with correct offsets"
	ByteArray streamContents: [ :stream | 
		creator 
			writePackFileHeaderOn: stream;
			writeObjectsOn: stream ].