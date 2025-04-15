THIS_FILE := $(lastword $(MAKEFILE_LIST))

start:
	@$(MAKE) -f $(THIS_FILE) stop
	@$(MAKE) -f $(THIS_FILE) up

start_debug:
	@$(MAKE) -f $(THIS_FILE) stop
	@$(MAKE) -f $(THIS_FILE) up
	@$(MAKE) -f $(THIS_FILE) start_app_debug

remove_pid:
	@docker compose exec -T store rm -f /rails/tmp/pids/server.pid || true

stop:
	@docker compose stop

up:
	@docker compose up
	
build:
	@docker compose up --build

start_app: remove_pid
	@docker compose exec -T app bundle exec rails s -p 4000 -b 0.0.0.0 || (docker compose logs app && exit 1)

bash:
	docker exec -it store /bin/bash
	
tailwind:
	@docker exec -it store /bin/bash -c "bin/rails tailwindcss:watch"

attach:
	docker attach store
