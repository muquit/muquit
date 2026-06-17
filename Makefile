#########################################################################
# Generate README.md for my github profile using
# https://github.com/muquit/github-profilegen-go
#########################################################################

all: 
	github-profilegen-go -user muquit \
		-exclude exclude.txt \
		-priority priority.txt \
		-contact contact.txt \
		-ai-credits ai-credits.txt


# check if GITHUB_TOKEN is valid
check_github_token:
	@curl -s -H "Authorization: token $(GITHUB_TOKEN)" \
        https://api.github.com/user | jq '{login, name, type}'
	@curl -sI -H "Authorization: token $(GITHUB_TOKEN)" \
        https://api.github.com/user | grep -i x-oauth-scopes
