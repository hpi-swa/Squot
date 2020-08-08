private
isRemoteSupported: urlString
	^ urlString notNil and: [urlString beginsWith: 'http']