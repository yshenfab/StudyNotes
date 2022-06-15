default:
	git add .
	git ci -m "update repo"
	git push origin master
	mkdocs gh-deploy
	rm -rf site

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

