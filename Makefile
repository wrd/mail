
# appengine Makefile

default: serve

HTML_STATIC_REPO="https://github.com/wrdrd/wrdrd.github.io"
setup:
	#git submodule add -f ./public $(HTML_STATIC_REPO)
	git submodule update --init


test-appengine:
	/usr/local/google_appengine/run_tests.py


serve:
	/usr/local/google_appengine/dev_appserver.py ./app.yaml


OPEN_HTML_CMD="x-www-browser"
# darwin
OPEN_HTML_CMD="open"
open:
	$(OPEN_HTML_CMD) http://localhost:8000/ & \
		$(OPEN_HTML_CMD) http://localhost:8080/

serve-open:
	$(MAKE) serve & sleep 5 && $(MAKE) open

APPENGINE_EMAIL=''
update:
	/usr/local/google_appengine/appcfg.py update -e $(APPENGINE_EMAIL) .


pull:
	git pull
	(cd public; git pull)

push:
	git push
