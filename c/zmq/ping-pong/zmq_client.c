#include <zmq.h>
#include <stdio.h>
#include <unistd.h>

#define MAX_MESSAGE_LENGTH 10

int main(int argc, char *argv[])
{
    printf("++ Connecting to ping server ...\n");
    void *context = zmq_ctx_new();
    void *requester = zmq_socket(context, ZMQ_REQ);
    zmq_connect(requester, "tcp://localhost:5555");

    char buffer[MAX_MESSAGE_LENGTH];
    for (int requestIt = 0; requestIt < 10; requestIt++) {
        printf("[C] [%d] Sending ping ...\n", requestIt);
        zmq_send(requester, "ping", 5, 0);
        zmq_recv(requester, buffer, MAX_MESSAGE_LENGTH, 0);
        printf("[C] [%d] Received: '%s'\n", requestIt, buffer);
    }

    zmq_close(requester);
    zmq_ctx_destroy(context);

    return 0;
}

