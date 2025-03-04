THIS_FILE := $(lastword $(MAKEFILE_LIST))

start:
	@$(MAKE) -f $(THIS_FILE) stop
	@$(MAKE) -f $(THIS_FILE) up
	@$(MAKE) -f $(THIS_FILE) start_app

start_debug:
	@$(MAKE) -f $(THIS_FILE) stop
	@$(MAKE) -f $(THIS_FILE) up
	@$(MAKE) -f $(THIS_FILE) start_app_debug

stop:
	@docker compose stop

up:
	@docker compose up -d --remove-orphans

remove_pid:
	@docker compose exec -T app rm -f /rails/tmp/pids/server.pid || true

start_app: remove_pid
	@docker compose exec -T app bundle exec rails s -p 4000 -b 0.0.0.0 || (docker compose logs app && exit 1)

bash:
	docker exec -it store /bin/bash
