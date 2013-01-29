as yet unclassified
isSmartRepository: aUrl
	|head|
	"https://raw.github.com/git/gitscm/master/public/docs/http-protocol.txt"
	self flag: 'we should fix this username/password thing'.
	head := ZnClient new
		url: aUrl asZnUrl / 'info' / 'refs';
		queryAt: 'service' put: 'git-upload-pack';
		"username: 'admin' password: 'admin';"
		enforceHttpSuccess: true;
		head;
		response.
	^ head contentType matches: ZnMimeType applicationGitUploadPackAdvertisement