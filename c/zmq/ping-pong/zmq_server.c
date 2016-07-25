#include <zmq.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

#define MAX_MESSAGE_LENGTH 10

int main(int argc, char *arv[])
{
    void *context = zmq_ctx_new();
    void *responder = zmq_socket(context, ZMQ_REP);
    int rc = zmq_bind(responder, "tcp://*:5555");
    if (rc != 0) {
        fprintf(stderr, "[S] Could not bind responder to socket (error was: %s)\n", strerror(errno));
    }

    char buffer[MAX_MESSAGE_LENGTH];
    while (1) {
        memset(buffer, 0, MAX_MESSAGE_LENGTH);
        zmq_recv(responder, buffer, MAX_MESSAGE_LENGTH, 0);
        printf("[S] Received buffer: '%s'\n", buffer);
        sleep(1);
        zmq_send(responder, "pong", 5, 0);
    }

    zmq_close(responder);
    zmq_ctx_destroy(context);

    return 0;
}

