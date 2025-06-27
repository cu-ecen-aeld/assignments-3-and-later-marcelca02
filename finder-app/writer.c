#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <writefile> <writestr>\n", argv[0]);
        syslog(LOG_ERR, "Invalid number of arguments");
        return 1;
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    openlog("writer", LOG_PID, LOG_USER);

    FILE *fp = fopen(writefile, "w");
    if (fp == NULL) {
        syslog(LOG_ERR, "Error opening file %s: %s", writefile, strerror(errno));
        return 1;
    }

    if (fputs(writestr, fp) == EOF) {
        syslog(LOG_ERR, "Error writing to file %s: %s", writefile, strerror(errno));
        fclose(fp);
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    fclose(fp);
    closelog();

    return 0;
}

