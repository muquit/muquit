#########################################################################
# Generate README.md for my github profile using
# https://github.com/muquit/github-profilegen-go
# updated: must have GITHUB_TOKEN set in order to generate the README.
# Jun-22-2026 
#########################################################################

all:  check_github_token
	github-profilegen-go -user muquit \
		-exclude exclude.txt \
		-priority priority.txt \
		-contact contact.txt \
		-ai-credits ai-credits.txt


# check if GITHUB_TOKEN is set and valid, fail the build otherwise
check_github_token:
	@if [ -z "$(GITHUB_TOKEN)" ]; then \
        echo "*** ERROR: GITHUB_TOKEN is not set"; \
        exit 1; \
    fi
	@status=$$(curl -s -o /tmp/check_github_token.$$$$.json -w '%{http_code}' \
        -H "Authorization: token $(GITHUB_TOKEN)" https://api.github.com/user); \
    if [ "$$status" != "200" ]; then \
        echo "*** ERROR: GITHUB_TOKEN is not valid (HTTP $$status)"; \
        cat /tmp/check_github_token.$$$$.json; \
        rm -f /tmp/check_github_token.$$$$.json; \
        exit 1; \
    fi; \
    jq '{login, name, type}' < /tmp/check_github_token.$$$$.json; \
    rm -f /tmp/check_github_token.$$$$.json
	@curl -sI -H "Authorization: token $(GITHUB_TOKEN)" \
        https://api.github.com/user | grep -i x-oauth-scopes
