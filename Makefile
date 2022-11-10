IMAGE=profile-svelte
CONTAINER=profile-svelte
LOCAL_PORT=8080
REMOTE_PORT=8043
SRC=.

.PHONY: run
run:
	docker container run --name $(CONTAINER) -p $(LOCAL_PORT):$(REMOTE_PORT) -d $(IMAGE)

.PHONY: build
build:
	docker image build -t $(IMAGE) $(SRC)

.PHONY: clean
clean:
	docker container rm -f $(CONTAINER)
	docker image rm -f $(IMAGE)