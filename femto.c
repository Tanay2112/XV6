#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"

char buf[512];

void
femto(int fd,char* filename)
{
  int n;
  int fp;
  
  if ((fp = open(filename, O_CREATE | O_RDWR)) < 0) {                        // Open the file to be edited or in which you have to write 
    printf(1, "editor: error initializing file: %s\n", filename);            // your input
    exit();
  }

  while((n = read(fd, buf, sizeof(buf))) > 0){                               // if there is some thing on the terminal it will get written 
    // write(1, buf, n);                                                     // in file
    printf(fp, "%s", buf);
  }
  close(fp);
  if(n < 0){
    printf(1, "editor: read error\n");                                       // error message
    exit();
  }
}

int
main(int argc, char *argv[])
{

  if(argc <= 2){
    char* filename = "default.txt";                                           // Defalut file if user doesn't provide any file
    if(argv[1])
      filename = argv[1]; 
    femto(0,filename);                                                        // Calling the femto function 
    exit();
  }
  exit();
}
