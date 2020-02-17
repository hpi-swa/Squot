accessing
configI18nCommitEncoding: anEncodingName
	^ self configAt: 'i18n.commitEncoding' put: anEncodingName
	