// Ben Eli 319086435
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(int argc, char *argv[])
{
    int stat, waited, ret_code;
    pid_t pid;
    char *pwd = getenv("PATH");
    int p=0;
    for(; p < argc; p++)
    {
        strcat(pwd, ":");
        strcat(pwd, argv[p]);
    }

    char command[100] = {};
    char* arr[1000] = {};
    char historyArr[100][100] = {};
    pid_t pidArr[10000] = {};
    int i = 0;
    int j = 0;
    int k = 0;
    setenv("PATH", pwd, 0);
    while (1)
    {
        i = 0;
        printf("$ ");
        fflush(stdout);
        scanf("%[^\n]%*c", command);
        strcpy(historyArr[j], command);
        arr[0] = strtok(command, " ");
        i++;
        while ((arr[i - 1] != NULL))
        {
            arr[i] = strtok(NULL, " ");
            i++;
        }
        if (strcmp(arr[0], "exit") == 0)
        {
            exit(0);
        }
        else if (strcmp(arr[0], "cd") == 0)
        {
            if(chdir(arr[1])!=0){
                perror(strcat(arr[0], " failed"));
            }
            pidArr[j] = getpid();
            j++;
            if (ret_code == -1)
            {
                perror(strcat(arr[0], " failed"));
            }
        }
        else if (strcmp(arr[0], "history") == 0)
        {
            pidArr[j] = getpid();
            j++;
            for(k = 0; k < j; k++)
            {
                printf("%d %s\n", pidArr[k], historyArr[k]);
            }
        }
        else
        {
            pid = fork();
            if (pid == 0)
            { /* Child */
                ret_code = execvp(arr[0], arr);
                if (ret_code == -1)
                {
                    perror(strcat(arr[0], " failed"));
                    exit(-1);
                }
            }
            else
            { /* Parent */
                waited = wait(&stat);
                pidArr[j] = pid;
                j++;
            }
        }
    }
}