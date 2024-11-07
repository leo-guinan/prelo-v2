.PHONY: setup update deploy dev-up dev-down

setup:
	git submodule update --init --recursive
	make install-deps

update:
	git submodule foreach git pull origin main

install-deps:
	@for module in pitch-deck-review investor-dashboard; do \
		if [ -f "$$module/package.json" ]; then \
			echo "Installing dependencies for $$module..."; \
			cd $$module && npm install && cd ..; \
		fi \
	done

deploy:
	./deploy.sh

dev-up:
	docker-compose up -d

dev-down:
	docker-compose down