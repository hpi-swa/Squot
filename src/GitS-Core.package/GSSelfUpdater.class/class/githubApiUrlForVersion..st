accessing
githubApiUrlForVersion: aString
	^ 'https://api.github.com/repos/{1}/commits/{2}' format: {self fullRepositoryName. aString}