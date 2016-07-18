CC=gcc
INC=-I/home/agarciam/apps/include/
CFLAGS=-c -Wall -std=c11 -g -o0 $(INC)
LDFLAGS=-L/home/agarciam/apps/lib/ -lzmq

.PHONY: zmq_server zmq_client
all: zmq_server zmq_client

zmq_server: zmq_server.o
	$(CC) -Wall $? $(LDFLAGS) -o $@

zmq_client: zmq_client.o
	$(CC) -Wall $? $(LDFLAGS) -o $@

