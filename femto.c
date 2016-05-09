#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"

char buf[512];

void
cat(int fd,char* filename)
{
  int n;
  int fp;
  
  if ((fp = open(filename, O_CREATE | O_RDWR)) < 0) {
    printf(1, "counter_init: error initializing file: %s\n", filename);
    exit();
  }

  while((n = read(fd, buf, sizeof(buf))) > 0){
    // write(1, buf, n);
    printf(fp, "%s", buf);
  }
  close(fp);
  if(n < 0){
    printf(1, "cat: read error\n");
    exit();
  }
}

int
main(int argc, char *argv[])
{

  if(argc <= 2){
    char* filename = "default.txt";                                              
    if(argv[1])
      filename = argv[1]; 
    cat(0,filename);
    exit();
  }
  exit();
}
