parsing
fromSton: aSTONReader
	| versionAssoc instVarStream |
	instVarStream := Generator on: [:gen | aSTONReader parseMapDo: [:name :value | gen yield: name -> value]].
	versionAssoc := instVarStream next.
	self
		assert: versionAssoc key = #version description: 'expected the first instVar to be version';
		version: versionAssoc value;
		fromInstVarStream: instVarStream version: versionAssoc value.