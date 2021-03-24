#include "neotui.h"
#include <sys/ioctl.h>
#include <unistd.h>
#include <stdio.h>

window* nt_getWindow(window* window) 
{
    
    struct winsize ws;

    if (window == NULL)
        fprintf(stderr,"window must not be be NULL");

    if (ioctl(STDOUT_FILENO,TIOCGWINSZ,&ws) == -1)
        fprintf(stderr,"Could not get size of terminal");
    
    window->height = ws.ws_col;
    window->width = ws.ws_row; 
}
