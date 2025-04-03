#########################################################################
# Generate README.md for my github profile using
# https://github.com/muquit/github-profilegen-go
#########################################################################

all: 
	github-profilegen-go -user muquit -exclude exclude.txt -priority priority.txt -contact contact.txt \
		-ai-credits ai-credits.txt

