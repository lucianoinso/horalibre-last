run:
	python manage.py runserver

clean:
	rm -rf records/migrations
	rm -rf commentary/migrations
	rm -rf login/migrations
	rm -rf administration/migrations
	rm -rf news/migrations
	rm */*.pyc

update_models:
	python manage.py makemigrations "login" "records" "commentary" "administration" "news"
	python manage.py migrate
