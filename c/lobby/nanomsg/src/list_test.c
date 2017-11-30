#include <stdio.h>
#include "list.h"

struct d {
    list node;
    int data;
};

int main(void)
{
    list dlist;
    struct d d0;
    struct d d1;
    struct d d2;
    struct d d3;
    struct d d4;

    list_init(&dlist);

    list_add_tail(&dlist, &d0.node);
    printf("list size = %d\n", list_count(&dlist));
    list_add_tail(&dlist, &d1.node);
    printf("list size = %d\n", list_count(&dlist));
    list_add_tail(&dlist, &d2.node);
    printf("list size = %d\n", list_count(&dlist));
    list_add_tail(&dlist, &d3.node);
    printf("list size = %d\n", list_count(&dlist));
    list_add_tail(&dlist, &d4.node);
    printf("list size = %d\n", list_count(&dlist));

    return 0;
}
