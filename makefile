IP ?= 127.0.0.1
SERVICE ?= unit
hosts: unhosts # маппинг доменов на локалку
	echo "$(IP) test.ru" >> /mnt/c/Windows/System32/drivers/etc/hosts
unhosts:
	sed -i '/test.ru/d' /mnt/c/Windows/System32/drivers/etc/hosts
u: # запуск контейнеров
	IP=$(shell ip -4 addr | sed -ne 's|^.* inet \([^/]*\)/.* scope global.*$$|\1|p' | awk '{print $1}' | head -1) RELEASE=$(shell lsb_release -rs) SYSTEM=$(shell lsb_release -is | tr '[:upper:]' '[:lower:]') docker compose up -d --build --force-recreate
# 	sleep 1
# 	docker compose logs unit wg ss proxy
d: # остановка контейнеров
	docker compose down
r: d u
ps: # список контейнеров
	docker compose ps
l: # логи из контейнеров
	docker compose logs $(SERVICE)
unit: # консоль сервиса
	docker compose exec unit bash
wg: # консоль сервиса
	docker compose exec wg bash
ss: # консоль сервиса
	docker compose exec ss bash
ng: # консоль сервиса
	docker compose exec ng bash
doh: # консоль сервиса
	docker compose exec doh bash
ad: # консоль сервиса
	docker compose exec ad bash
proxy: # консоль сервиса
	docker compose exec proxy bash
tg: # консоль сервиса
	docker compose exec tg bash
