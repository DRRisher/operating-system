#include "types.h"
#include "stat.h"
#include "user.h"

#define RUNS 100000

int
main(int argc, char *argv[])
{
    int pipe1[2]; // parent -> child
    int pipe2[2]; // child -> parent

    pipe(pipe1);
    pipe(pipe2);

    int pid = fork(); //new process

    char byte = 'a'; // single byte to be sent each time

    if(pid == 0){
        // CHILD is always == 0
        for(int i = 0; i < RUNS; i++){ // child pipe: p2 --> p1
            read(pipe1[0], &byte, 1);
            write(pipe2[1], &byte, 1);
        }
        exit(); //end
    }
    else{
        // PARENT

        int start = uptime(); // start time

        for(int i = 0; i < RUNS; i++){ // paent pipe: p1 --> p2
            write(pipe1[1], &byte, 1);
            read(pipe2[0], &byte, 1);
        }

        int end = uptime(); // end time 

        wait(); //join

        int time = end - start;

        if (time == 0) {
            time = 1;
        }

        int exchanges_per_sec = (RUNS /time) * 100; //1 second = 100 ticks; (exchanges/#of ticks) = exchanges per tick * 100 ~= exchanges per second

        printf(1, "Exchanges per second: %d\n", exchanges_per_sec);
    }

    exit();
}