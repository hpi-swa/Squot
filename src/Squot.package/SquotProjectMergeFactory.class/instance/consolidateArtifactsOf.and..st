private
consolidateArtifactsOf: workingSquotProject and: incomingSquotProject
	"Ensure that artifacts with the same path have the same id. Answer a project where this is the case in relation to the working copy."
	| mapping workingIds |
	mapping := OrderedDictionary new.
	workingIds := workingSquotProject artifacts values collect: [:each | each path -> each id] as: Dictionary.
	incomingSquotProject artifacts do:
		[:each | | incomingId workingId storeInfo |
		incomingId := each id.
		workingId := workingIds at: each path ifAbsent: [incomingId].
		incomingId ~= workingId
			ifTrue:
				[storeInfo := each storeInfo copy.
				storeInfo at: #id put: workingId.
				mapping at: (SquotArtifact storeInfo: storeInfo) put: each]
			ifFalse: [mapping at: each put: each]].
	^ mapping