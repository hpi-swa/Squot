git porcelain
addRemote: name url: anUrl
	repository configAt: (repository remoteConfigNameFor: name option: 'url') put: anUrl.
	"maybe we should also add the default fetch instructions"