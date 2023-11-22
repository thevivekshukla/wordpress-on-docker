
dev:
	docker compose up -d

deploy:
	docker compose -f docker-compose-production.yml up --remove-orphans --force-recreate --detach

logs:
	docker compose logs -f --tail 100
