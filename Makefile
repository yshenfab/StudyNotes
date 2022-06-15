push:
	git push origin master

serve:
	mkdocs serve

build:
	mkdocs build

deploy:
	git push origin master
	mkdocs gh-deploy --ignore-version

clean:
	rm -rf site

