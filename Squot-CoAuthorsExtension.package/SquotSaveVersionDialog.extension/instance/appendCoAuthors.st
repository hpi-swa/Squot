*Squot-CoAuthorsExtension
appendCoAuthors

	CoAuthorList default select
		ifNotNil: [ :selection | selection
			ifNotEmpty: [
				self message: (self message, String crlfcrlf, String crlf,
					(String streamContents: [:s | (selection
						collect: [ :gitStamp | self coAuthorString, gitStamp asStringWithoutTimestamp])
						asStringOn: s delimiter: String crlf])).
				self changed: #message]].