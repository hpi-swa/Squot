public-configuration
configI18nCommitEncoding: anEncodingName
	self privateDeprecatedUseUnitOfWork.
	^ self configAt: 'i18n.commitEncoding' put: anEncodingName
	