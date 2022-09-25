testing
canStore: anArtifact
	"I can store packages that are serialized in the Cypress format."
	"content-type: application/*.smalltalk.cypress (* because could be x., or prs. or vnd. if registered with IANA one day)"
	^ anArtifact storeInfo references anySatisfy:
		[:each | (each at: 'type') = 'package'
			and: [((each at: 'content-type') beginsWith: 'application/') and: [(each at: 'content-type') endsWith: '.smalltalk.cypress']]]