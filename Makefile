site:
	python3 makesite.py

serve: site
	if python3 -c 'import http.server' 2> /dev/null; then \
	    echo Running Python3 http.server ...; \
	    cd _site && python3 -m http.server; \
	elif python -c 'import http.server' 2> /dev/null; then \
	    echo Running Python http.server ...; \
	    cd _site && python -m http.server; \
	else \
	    echo Cannot find Python http.server or SimpleHTTPServer; \
	fi

clean:
	find . -name "__pycache__" -exec rm -r {} +
	find . -name "*.pyc" -exec rm {} +
	rm -rf .coverage htmlcov

REV = cat /tmp/rev.txt
loc:
	grep -vE '^[[:space:]]*#|^[[:space:]]*$$|^[[:space:]]*"""' makesite.py | wc -l

FORCE:
