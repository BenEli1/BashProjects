// Ben Eli 319086435
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(int argc, char* argv[])
{
    int stat,waited,ret_code;
    pid_t pid;
     char* pwd = getenv("PATH");
     for(int i = 0;i<argc;i++){
         strcat(pwd,":");
         strcat(pwd,argv[i]);
         }

    char command[100]={};
    char* s;
    char* arr[1000]={};
    int i=0;
     setenv("PATH",pwd,0);
    while(1) {
        i=0;
        printf(" $ ");
        fflush(stdout);
        scanf("%[^\n]%*c", command);
        arr[0] = strtok(command, " ");
        i++;
        while ((arr[i - 1] != NULL)) {
            arr[i] = strtok(NULL, " ");
            i++;
        }
        if (strcmp(arr[0], "exit") == 0) {
            exit(0);
        }
        else if (strcmp(arr[0], "cd") == 0) {
            ret_code = execvp("cd", arr);
            if (ret_code == -1) {
                perror(strcat(arr[0]," failed"));
            } 
        }
        else if (strcmp(arr[0], "history") == 0) {

        }
        else{
        pid = fork();
        if (pid == 0) {  /* Child */
            ret_code = execvp(arr[0], arr);
            if (ret_code == -1) {
                perror(strcat(arr[0]," failed"));
                exit(-1);
            } else
                printf("Banana");
        } else {  /* Parent */
            waited = wait(&stat);   /* stat can tell what happened */
        }
        }
    }

}

/*
int main(int argc, char* argv[])
{
    int stat,waited,ret_code;
    pid_t pid;
    pid = fork();
    char* pwd = getenv("PATH");
    for(int i = 0;i<argc;i++){
        strcat(pwd,":");
        strcat(pwd,argv[i]);
    }
    char* command[100];
    char* s;
    char* arr[1000];
    int i=0;
    setenv("PATH",pwd,0);
    while(1) {
        printf(" $ ");
        fflush(stdout);
        scanf(" %[^\n]", &command);
        s = strtok(command, " ");
        while (arr[i] = strtok(command, " ") != NULL) {
            i++;
        }
        if (strcmp(s, "exit") == 0) {
            exit(0);
        }
        if (pid == 0) {  /* Child */
