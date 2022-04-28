// Ben Eli 319086435
#include <stdio.h>
#include <sys/types.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
	pid_t	pid;
	*char[100] command;
	int i=0;
	while(i<100||argv[i]==NULL){
		printf(" $ ");
		fflush(stdout);
        scanf(" %[^\n]", &command);
	if ((pid = fork()) < 0) 
		printf("fork error");	
	else	{ 
		if (pid == 0) {	/* first child */
			execvp(argv[i],$argv[i]);
			  string[0]=strtok(input," ");               //parce first string

			}
		}
		if (waitpid(pid, NULL, 0) != pid)	/* wait for first child */
			printf("waitpid error");
	}
		/** We're the parent (the original process); we continue executing, knowing that we're not the parent of the second child.*/
		printf("original parent done\n");
		exit(0);
	}
}

