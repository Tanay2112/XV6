
_sem:     file format elf32-i386


Disassembly of section .text:

00000000 <counter_init>:
#define TARGET_COUNT_PER_CHILD 10
#define COUNTER_FILE "counter"
#define SEMAPHORE_NUM 0

int counter_init(char *filename, int value)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
	int fd;

	if ((fd = open(filename, O_CREATE | O_RDWR)) < 0) {
   6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
   d:	00 
   e:	8b 45 08             	mov    0x8(%ebp),%eax
  11:	89 04 24             	mov    %eax,(%esp)
  14:	e8 f2 05 00 00       	call   60b <open>
  19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20:	79 20                	jns    42 <counter_init+0x42>
		printf(1, "counter_init: error initializing file: %s\n", filename);
  22:	8b 45 08             	mov    0x8(%ebp),%eax
  25:	89 44 24 08          	mov    %eax,0x8(%esp)
  29:	c7 44 24 04 50 0b 00 	movl   $0xb50,0x4(%esp)
  30:	00 
  31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  38:	e8 46 07 00 00       	call   783 <printf>
		exit();
  3d:	e8 89 05 00 00       	call   5cb <exit>
	}

	printf(fd, "%d\n", value);
  42:	8b 45 0c             	mov    0xc(%ebp),%eax
  45:	89 44 24 08          	mov    %eax,0x8(%esp)
  49:	c7 44 24 04 7b 0b 00 	movl   $0xb7b,0x4(%esp)
  50:	00 
  51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 27 07 00 00       	call   783 <printf>
	close(fd);
  5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5f:	89 04 24             	mov    %eax,(%esp)
  62:	e8 8c 05 00 00       	call   5f3 <close>

	return 0;
  67:	b8 00 00 00 00       	mov    $0x0,%eax
}
  6c:	c9                   	leave  
  6d:	c3                   	ret    

0000006e <counter_get>:

int counter_get(char *filename)
{
  6e:	55                   	push   %ebp
  6f:	89 e5                	mov    %esp,%ebp
  71:	83 ec 48             	sub    $0x48,%esp
	int fd, n, value;
	char buffer[32];

	if ((fd = open(filename, O_CREATE | O_RDWR)) < 0) {
  74:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  7b:	00 
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	89 04 24             	mov    %eax,(%esp)
  82:	e8 84 05 00 00       	call   60b <open>
  87:	89 45 f4             	mov    %eax,-0xc(%ebp)
  8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  8e:	79 20                	jns    b0 <counter_get+0x42>
		printf(1, "counter_get: error opening file: %s\n", filename);
  90:	8b 45 08             	mov    0x8(%ebp),%eax
  93:	89 44 24 08          	mov    %eax,0x8(%esp)
  97:	c7 44 24 04 80 0b 00 	movl   $0xb80,0x4(%esp)
  9e:	00 
  9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a6:	e8 d8 06 00 00       	call   783 <printf>
		exit();
  ab:	e8 1b 05 00 00       	call   5cb <exit>
	}

	n = read(fd, buffer, 31);
  b0:	c7 44 24 08 1f 00 00 	movl   $0x1f,0x8(%esp)
  b7:	00 
  b8:	8d 45 cc             	lea    -0x34(%ebp),%eax
  bb:	89 44 24 04          	mov    %eax,0x4(%esp)
  bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c2:	89 04 24             	mov    %eax,(%esp)
  c5:	e8 19 05 00 00       	call   5e3 <read>
  ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
	buffer[n] = '\0';
  cd:	8d 55 cc             	lea    -0x34(%ebp),%edx
  d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  d3:	01 d0                	add    %edx,%eax
  d5:	c6 00 00             	movb   $0x0,(%eax)
	value = atoi(buffer);
  d8:	8d 45 cc             	lea    -0x34(%ebp),%eax
  db:	89 04 24             	mov    %eax,(%esp)
  de:	e8 56 04 00 00       	call   539 <atoi>
  e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
	close(fd);
  e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  e9:	89 04 24             	mov    %eax,(%esp)
  ec:	e8 02 05 00 00       	call   5f3 <close>

	return value;
  f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
}
  f4:	c9                   	leave  
  f5:	c3                   	ret    

000000f6 <counter_set>:

int counter_set(char *filename, int value)
{
  f6:	55                   	push   %ebp
  f7:	89 e5                	mov    %esp,%ebp
  f9:	83 ec 28             	sub    $0x28,%esp
	int fd;

	if ((fd = open(filename, O_CREATE | O_RDWR)) < 0) {
  fc:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
 103:	00 
 104:	8b 45 08             	mov    0x8(%ebp),%eax
 107:	89 04 24             	mov    %eax,(%esp)
 10a:	e8 fc 04 00 00       	call   60b <open>
 10f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 112:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 116:	79 20                	jns    138 <counter_set+0x42>
		printf(1, "counter_set: error opening file: %s\n", filename);
 118:	8b 45 08             	mov    0x8(%ebp),%eax
 11b:	89 44 24 08          	mov    %eax,0x8(%esp)
 11f:	c7 44 24 04 a8 0b 00 	movl   $0xba8,0x4(%esp)
 126:	00 
 127:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 12e:	e8 50 06 00 00       	call   783 <printf>
		exit();
 133:	e8 93 04 00 00       	call   5cb <exit>
	}

	printf(fd, "%d\n", value);
 138:	8b 45 0c             	mov    0xc(%ebp),%eax
 13b:	89 44 24 08          	mov    %eax,0x8(%esp)
 13f:	c7 44 24 04 7b 0b 00 	movl   $0xb7b,0x4(%esp)
 146:	00 
 147:	8b 45 f4             	mov    -0xc(%ebp),%eax
 14a:	89 04 24             	mov    %eax,(%esp)
 14d:	e8 31 06 00 00       	call   783 <printf>
	close(fd);
 152:	8b 45 f4             	mov    -0xc(%ebp),%eax
 155:	89 04 24             	mov    %eax,(%esp)
 158:	e8 96 04 00 00       	call   5f3 <close>

	return value;
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
}
 160:	c9                   	leave  
 161:	c3                   	ret    

00000162 <child>:

void child(void)
{
 162:	55                   	push   %ebp
 163:	89 e5                	mov    %esp,%ebp
 165:	83 ec 28             	sub    $0x28,%esp
	int i;
	int counter;

	printf(1, "Process started...\n");
 168:	c7 44 24 04 cd 0b 00 	movl   $0xbcd,0x4(%esp)
 16f:	00 
 170:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 177:	e8 07 06 00 00       	call   783 <printf>
	sleep(10);
 17c:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
 183:	e8 d3 04 00 00       	call   65b <sleep>

	for (i=0; i<TARGET_COUNT_PER_CHILD; i++) {
 188:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18f:	eb 52                	jmp    1e3 <child+0x81>
		sem_wait(SEMAPHORE_NUM, 1);
 191:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 198:	00 
 199:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a0:	e8 de 04 00 00       	call   683 <sem_wait>
		
		counter = counter_get("counter");
 1a5:	c7 04 24 e1 0b 00 00 	movl   $0xbe1,(%esp)
 1ac:	e8 bd fe ff ff       	call   6e <counter_get>
 1b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
		counter++;
 1b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
		counter_set("counter", counter);
 1b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 e1 0b 00 00 	movl   $0xbe1,(%esp)
 1c6:	e8 2b ff ff ff       	call   f6 <counter_set>

		sem_signal(SEMAPHORE_NUM, 1);
 1cb:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 1d2:	00 
 1d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1da:	e8 ac 04 00 00       	call   68b <sem_signal>
	int counter;

	printf(1, "Process started...\n");
	sleep(10);

	for (i=0; i<TARGET_COUNT_PER_CHILD; i++) {
 1df:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1e3:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
 1e7:	7e a8                	jle    191 <child+0x2f>
		counter_set("counter", counter);

		sem_signal(SEMAPHORE_NUM, 1);
	}

	exit();
 1e9:	e8 dd 03 00 00       	call   5cb <exit>

000001ee <main>:
}

int main(int argc, char **argv)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 e4 f0             	and    $0xfffffff0,%esp
 1f4:	83 ec 30             	sub    $0x30,%esp
	int i;
	int sem_size;
	int final_counter;
	int final_target = NUM_CHILDREN*TARGET_COUNT_PER_CHILD;
 1f7:	c7 44 24 24 14 00 00 	movl   $0x14,0x24(%esp)
 1fe:	00 

	if (argc >= 2)
 1ff:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 203:	7e 0a                	jle    20f <main+0x21>
		sem_size = NUM_CHILDREN;
 205:	c7 44 24 28 02 00 00 	movl   $0x2,0x28(%esp)
 20c:	00 
 20d:	eb 08                	jmp    217 <main+0x29>
	else
		sem_size = 1;
 20f:	c7 44 24 28 01 00 00 	movl   $0x1,0x28(%esp)
 216:	00 

	// Initialize semaphore to 1
	if (sem_init(SEMAPHORE_NUM, sem_size) < 0)
 217:	8b 44 24 28          	mov    0x28(%esp),%eax
 21b:	89 44 24 04          	mov    %eax,0x4(%esp)
 21f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 226:	e8 48 04 00 00       	call   673 <sem_init>
 22b:	85 c0                	test   %eax,%eax
 22d:	79 21                	jns    250 <main+0x62>
	{
		printf(1, "main: error initializing semaphore %d\n", SEMAPHORE_NUM);
 22f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 236:	00 
 237:	c7 44 24 04 ec 0b 00 	movl   $0xbec,0x4(%esp)
 23e:	00 
 23f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 246:	e8 38 05 00 00       	call   783 <printf>
		exit();
 24b:	e8 7b 03 00 00       	call   5cb <exit>
	}

	printf(1, "main: initialized semaphore %d to %d\n", SEMAPHORE_NUM, sem_size);
 250:	8b 44 24 28          	mov    0x28(%esp),%eax
 254:	89 44 24 0c          	mov    %eax,0xc(%esp)
 258:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 25f:	00 
 260:	c7 44 24 04 14 0c 00 	movl   $0xc14,0x4(%esp)
 267:	00 
 268:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26f:	e8 0f 05 00 00       	call   783 <printf>

	// Initialize counter
	counter_init(COUNTER_FILE, 0);
 274:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 27b:	00 
 27c:	c7 04 24 e1 0b 00 00 	movl   $0xbe1,(%esp)
 283:	e8 78 fd ff ff       	call   0 <counter_init>

	printf(1, "Running with %d processes...\n", NUM_CHILDREN);
 288:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
 28f:	00 
 290:	c7 44 24 04 3a 0c 00 	movl   $0xc3a,0x4(%esp)
 297:	00 
 298:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 29f:	e8 df 04 00 00       	call   783 <printf>

	// Start all children
	for (i=0; i<NUM_CHILDREN; i++) {
 2a4:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 2ab:	00 
 2ac:	eb 1a                	jmp    2c8 <main+0xda>
		int pid = fork();
 2ae:	e8 10 03 00 00       	call   5c3 <fork>
 2b3:	89 44 24 20          	mov    %eax,0x20(%esp)
		if (pid == 0)
 2b7:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
 2bc:	75 05                	jne    2c3 <main+0xd5>
			child();
 2be:	e8 9f fe ff ff       	call   162 <child>
	counter_init(COUNTER_FILE, 0);

	printf(1, "Running with %d processes...\n", NUM_CHILDREN);

	// Start all children
	for (i=0; i<NUM_CHILDREN; i++) {
 2c3:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
 2c8:	83 7c 24 2c 01       	cmpl   $0x1,0x2c(%esp)
 2cd:	7e df                	jle    2ae <main+0xc0>
		if (pid == 0)
			child();
	}
	
	// Wait for all children
	for (i=0; i<NUM_CHILDREN; i++) {
 2cf:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 2d6:	00 
 2d7:	eb 0a                	jmp    2e3 <main+0xf5>
		wait();
 2d9:	e8 f5 02 00 00       	call   5d3 <wait>
		if (pid == 0)
			child();
	}
	
	// Wait for all children
	for (i=0; i<NUM_CHILDREN; i++) {
 2de:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
 2e3:	83 7c 24 2c 01       	cmpl   $0x1,0x2c(%esp)
 2e8:	7e ef                	jle    2d9 <main+0xeb>
		wait();
	}

	// Check the result
	final_counter = counter_get(COUNTER_FILE);
 2ea:	c7 04 24 e1 0b 00 00 	movl   $0xbe1,(%esp)
 2f1:	e8 78 fd ff ff       	call   6e <counter_get>
 2f6:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	printf(1, "Final counter is %d, target is %d\n", final_counter, final_target);
 2fa:	8b 44 24 24          	mov    0x24(%esp),%eax
 2fe:	89 44 24 0c          	mov    %eax,0xc(%esp)
 302:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 306:	89 44 24 08          	mov    %eax,0x8(%esp)
 30a:	c7 44 24 04 58 0c 00 	movl   $0xc58,0x4(%esp)
 311:	00 
 312:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 319:	e8 65 04 00 00       	call   783 <printf>
	if (final_counter == final_target)
 31e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 322:	3b 44 24 24          	cmp    0x24(%esp),%eax
 326:	75 16                	jne    33e <main+0x150>
		printf(1, "TEST PASSED!\n");
 328:	c7 44 24 04 7b 0c 00 	movl   $0xc7b,0x4(%esp)
 32f:	00 
 330:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 337:	e8 47 04 00 00       	call   783 <printf>
 33c:	eb 14                	jmp    352 <main+0x164>
	else
		printf(1, "TEST FAILED!\n");
 33e:	c7 44 24 04 89 0c 00 	movl   $0xc89,0x4(%esp)
 345:	00 
 346:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 34d:	e8 31 04 00 00       	call   783 <printf>
	
	// Clean up semaphore
	sem_destroy(SEMAPHORE_NUM);
 352:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 359:	e8 1d 03 00 00       	call   67b <sem_destroy>
	
	// Exit
	exit();
 35e:	e8 68 02 00 00       	call   5cb <exit>

00000363 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	57                   	push   %edi
 367:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 368:	8b 4d 08             	mov    0x8(%ebp),%ecx
 36b:	8b 55 10             	mov    0x10(%ebp),%edx
 36e:	8b 45 0c             	mov    0xc(%ebp),%eax
 371:	89 cb                	mov    %ecx,%ebx
 373:	89 df                	mov    %ebx,%edi
 375:	89 d1                	mov    %edx,%ecx
 377:	fc                   	cld    
 378:	f3 aa                	rep stos %al,%es:(%edi)
 37a:	89 ca                	mov    %ecx,%edx
 37c:	89 fb                	mov    %edi,%ebx
 37e:	89 5d 08             	mov    %ebx,0x8(%ebp)
 381:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 384:	5b                   	pop    %ebx
 385:	5f                   	pop    %edi
 386:	5d                   	pop    %ebp
 387:	c3                   	ret    

00000388 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38e:	8b 45 08             	mov    0x8(%ebp),%eax
 391:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 394:	90                   	nop
 395:	8b 45 08             	mov    0x8(%ebp),%eax
 398:	8d 50 01             	lea    0x1(%eax),%edx
 39b:	89 55 08             	mov    %edx,0x8(%ebp)
 39e:	8b 55 0c             	mov    0xc(%ebp),%edx
 3a1:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a7:	0f b6 12             	movzbl (%edx),%edx
 3aa:	88 10                	mov    %dl,(%eax)
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	84 c0                	test   %al,%al
 3b1:	75 e2                	jne    395 <strcpy+0xd>
    ;
  return os;
 3b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b6:	c9                   	leave  
 3b7:	c3                   	ret    

000003b8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3bb:	eb 08                	jmp    3c5 <strcmp+0xd>
    p++, q++;
 3bd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3c1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c5:	8b 45 08             	mov    0x8(%ebp),%eax
 3c8:	0f b6 00             	movzbl (%eax),%eax
 3cb:	84 c0                	test   %al,%al
 3cd:	74 10                	je     3df <strcmp+0x27>
 3cf:	8b 45 08             	mov    0x8(%ebp),%eax
 3d2:	0f b6 10             	movzbl (%eax),%edx
 3d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d8:	0f b6 00             	movzbl (%eax),%eax
 3db:	38 c2                	cmp    %al,%dl
 3dd:	74 de                	je     3bd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	0f b6 00             	movzbl (%eax),%eax
 3e5:	0f b6 d0             	movzbl %al,%edx
 3e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3eb:	0f b6 00             	movzbl (%eax),%eax
 3ee:	0f b6 c0             	movzbl %al,%eax
 3f1:	29 c2                	sub    %eax,%edx
 3f3:	89 d0                	mov    %edx,%eax
}
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    

000003f7 <strlen>:

uint
strlen(char *s)
{
 3f7:	55                   	push   %ebp
 3f8:	89 e5                	mov    %esp,%ebp
 3fa:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 404:	eb 04                	jmp    40a <strlen+0x13>
 406:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 40a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
 410:	01 d0                	add    %edx,%eax
 412:	0f b6 00             	movzbl (%eax),%eax
 415:	84 c0                	test   %al,%al
 417:	75 ed                	jne    406 <strlen+0xf>
    ;
  return n;
 419:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 41c:	c9                   	leave  
 41d:	c3                   	ret    

0000041e <memset>:

void*
memset(void *dst, int c, uint n)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 424:	8b 45 10             	mov    0x10(%ebp),%eax
 427:	89 44 24 08          	mov    %eax,0x8(%esp)
 42b:	8b 45 0c             	mov    0xc(%ebp),%eax
 42e:	89 44 24 04          	mov    %eax,0x4(%esp)
 432:	8b 45 08             	mov    0x8(%ebp),%eax
 435:	89 04 24             	mov    %eax,(%esp)
 438:	e8 26 ff ff ff       	call   363 <stosb>
  return dst;
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 440:	c9                   	leave  
 441:	c3                   	ret    

00000442 <strchr>:

char*
strchr(const char *s, char c)
{
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	83 ec 04             	sub    $0x4,%esp
 448:	8b 45 0c             	mov    0xc(%ebp),%eax
 44b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 44e:	eb 14                	jmp    464 <strchr+0x22>
    if(*s == c)
 450:	8b 45 08             	mov    0x8(%ebp),%eax
 453:	0f b6 00             	movzbl (%eax),%eax
 456:	3a 45 fc             	cmp    -0x4(%ebp),%al
 459:	75 05                	jne    460 <strchr+0x1e>
      return (char*)s;
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
 45e:	eb 13                	jmp    473 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 460:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	0f b6 00             	movzbl (%eax),%eax
 46a:	84 c0                	test   %al,%al
 46c:	75 e2                	jne    450 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 46e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 473:	c9                   	leave  
 474:	c3                   	ret    

00000475 <gets>:

char*
gets(char *buf, int max)
{
 475:	55                   	push   %ebp
 476:	89 e5                	mov    %esp,%ebp
 478:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 47b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 482:	eb 4c                	jmp    4d0 <gets+0x5b>
    cc = read(0, &c, 1);
 484:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48b:	00 
 48c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 48f:	89 44 24 04          	mov    %eax,0x4(%esp)
 493:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 49a:	e8 44 01 00 00       	call   5e3 <read>
 49f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 4a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a6:	7f 02                	jg     4aa <gets+0x35>
      break;
 4a8:	eb 31                	jmp    4db <gets+0x66>
    buf[i++] = c;
 4aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ad:	8d 50 01             	lea    0x1(%eax),%edx
 4b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b3:	89 c2                	mov    %eax,%edx
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	01 c2                	add    %eax,%edx
 4ba:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4be:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0a                	cmp    $0xa,%al
 4c6:	74 13                	je     4db <gets+0x66>
 4c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4cc:	3c 0d                	cmp    $0xd,%al
 4ce:	74 0b                	je     4db <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d3:	83 c0 01             	add    $0x1,%eax
 4d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d9:	7c a9                	jl     484 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4db:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	01 d0                	add    %edx,%eax
 4e3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e9:	c9                   	leave  
 4ea:	c3                   	ret    

000004eb <stat>:

int
stat(char *n, struct stat *st)
{
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f8:	00 
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	89 04 24             	mov    %eax,(%esp)
 4ff:	e8 07 01 00 00       	call   60b <open>
 504:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 507:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50b:	79 07                	jns    514 <stat+0x29>
    return -1;
 50d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 512:	eb 23                	jmp    537 <stat+0x4c>
  r = fstat(fd, st);
 514:	8b 45 0c             	mov    0xc(%ebp),%eax
 517:	89 44 24 04          	mov    %eax,0x4(%esp)
 51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51e:	89 04 24             	mov    %eax,(%esp)
 521:	e8 fd 00 00 00       	call   623 <fstat>
 526:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 529:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52c:	89 04 24             	mov    %eax,(%esp)
 52f:	e8 bf 00 00 00       	call   5f3 <close>
  return r;
 534:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 537:	c9                   	leave  
 538:	c3                   	ret    

00000539 <atoi>:

int
atoi(const char *s)
{
 539:	55                   	push   %ebp
 53a:	89 e5                	mov    %esp,%ebp
 53c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 546:	eb 25                	jmp    56d <atoi+0x34>
    n = n*10 + *s++ - '0';
 548:	8b 55 fc             	mov    -0x4(%ebp),%edx
 54b:	89 d0                	mov    %edx,%eax
 54d:	c1 e0 02             	shl    $0x2,%eax
 550:	01 d0                	add    %edx,%eax
 552:	01 c0                	add    %eax,%eax
 554:	89 c1                	mov    %eax,%ecx
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	8d 50 01             	lea    0x1(%eax),%edx
 55c:	89 55 08             	mov    %edx,0x8(%ebp)
 55f:	0f b6 00             	movzbl (%eax),%eax
 562:	0f be c0             	movsbl %al,%eax
 565:	01 c8                	add    %ecx,%eax
 567:	83 e8 30             	sub    $0x30,%eax
 56a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	0f b6 00             	movzbl (%eax),%eax
 573:	3c 2f                	cmp    $0x2f,%al
 575:	7e 0a                	jle    581 <atoi+0x48>
 577:	8b 45 08             	mov    0x8(%ebp),%eax
 57a:	0f b6 00             	movzbl (%eax),%eax
 57d:	3c 39                	cmp    $0x39,%al
 57f:	7e c7                	jle    548 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 581:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 584:	c9                   	leave  
 585:	c3                   	ret    

00000586 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 586:	55                   	push   %ebp
 587:	89 e5                	mov    %esp,%ebp
 589:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 592:	8b 45 0c             	mov    0xc(%ebp),%eax
 595:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 598:	eb 17                	jmp    5b1 <memmove+0x2b>
    *dst++ = *src++;
 59a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59d:	8d 50 01             	lea    0x1(%eax),%edx
 5a0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a6:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5ac:	0f b6 12             	movzbl (%edx),%edx
 5af:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5b1:	8b 45 10             	mov    0x10(%ebp),%eax
 5b4:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b7:	89 55 10             	mov    %edx,0x10(%ebp)
 5ba:	85 c0                	test   %eax,%eax
 5bc:	7f dc                	jg     59a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5c1:	c9                   	leave  
 5c2:	c3                   	ret    

000005c3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c3:	b8 01 00 00 00       	mov    $0x1,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <exit>:
SYSCALL(exit)
 5cb:	b8 02 00 00 00       	mov    $0x2,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <wait>:
SYSCALL(wait)
 5d3:	b8 03 00 00 00       	mov    $0x3,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <pipe>:
SYSCALL(pipe)
 5db:	b8 04 00 00 00       	mov    $0x4,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <read>:
SYSCALL(read)
 5e3:	b8 05 00 00 00       	mov    $0x5,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <write>:
SYSCALL(write)
 5eb:	b8 10 00 00 00       	mov    $0x10,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <close>:
SYSCALL(close)
 5f3:	b8 15 00 00 00       	mov    $0x15,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <kill>:
SYSCALL(kill)
 5fb:	b8 06 00 00 00       	mov    $0x6,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <exec>:
SYSCALL(exec)
 603:	b8 07 00 00 00       	mov    $0x7,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <open>:
SYSCALL(open)
 60b:	b8 0f 00 00 00       	mov    $0xf,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <mknod>:
SYSCALL(mknod)
 613:	b8 11 00 00 00       	mov    $0x11,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <unlink>:
SYSCALL(unlink)
 61b:	b8 12 00 00 00       	mov    $0x12,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <fstat>:
SYSCALL(fstat)
 623:	b8 08 00 00 00       	mov    $0x8,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <link>:
SYSCALL(link)
 62b:	b8 13 00 00 00       	mov    $0x13,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <mkdir>:
SYSCALL(mkdir)
 633:	b8 14 00 00 00       	mov    $0x14,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <chdir>:
SYSCALL(chdir)
 63b:	b8 09 00 00 00       	mov    $0x9,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <dup>:
SYSCALL(dup)
 643:	b8 0a 00 00 00       	mov    $0xa,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <getpid>:
SYSCALL(getpid)
 64b:	b8 0b 00 00 00       	mov    $0xb,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <sbrk>:
SYSCALL(sbrk)
 653:	b8 0c 00 00 00       	mov    $0xc,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <sleep>:
SYSCALL(sleep)
 65b:	b8 0d 00 00 00       	mov    $0xd,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <uptime>:
SYSCALL(uptime)
 663:	b8 0e 00 00 00       	mov    $0xe,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <getcwd>:
SYSCALL(getcwd)
 66b:	b8 16 00 00 00       	mov    $0x16,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <sem_init>:
SYSCALL(sem_init)
 673:	b8 17 00 00 00       	mov    $0x17,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <sem_destroy>:
SYSCALL(sem_destroy)
 67b:	b8 18 00 00 00       	mov    $0x18,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <sem_wait>:
SYSCALL(sem_wait)
 683:	b8 19 00 00 00       	mov    $0x19,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <sem_signal>:
SYSCALL(sem_signal)
 68b:	b8 1a 00 00 00       	mov    $0x1a,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <clone>:
SYSCALL(clone)
 693:	b8 1b 00 00 00       	mov    $0x1b,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <join>:
SYSCALL(join)
 69b:	b8 1c 00 00 00       	mov    $0x1c,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6a3:	55                   	push   %ebp
 6a4:	89 e5                	mov    %esp,%ebp
 6a6:	83 ec 18             	sub    $0x18,%esp
 6a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ac:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 6af:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b6:	00 
 6b7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 6be:	8b 45 08             	mov    0x8(%ebp),%eax
 6c1:	89 04 24             	mov    %eax,(%esp)
 6c4:	e8 22 ff ff ff       	call   5eb <write>
}
 6c9:	c9                   	leave  
 6ca:	c3                   	ret    

000006cb <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6cb:	55                   	push   %ebp
 6cc:	89 e5                	mov    %esp,%ebp
 6ce:	56                   	push   %esi
 6cf:	53                   	push   %ebx
 6d0:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6da:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6de:	74 17                	je     6f7 <printint+0x2c>
 6e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6e4:	79 11                	jns    6f7 <printint+0x2c>
    neg = 1;
 6e6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f0:	f7 d8                	neg    %eax
 6f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6f5:	eb 06                	jmp    6fd <printint+0x32>
  } else {
    x = xx;
 6f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 704:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 707:	8d 41 01             	lea    0x1(%ecx),%eax
 70a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 70d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 710:	8b 45 ec             	mov    -0x14(%ebp),%eax
 713:	ba 00 00 00 00       	mov    $0x0,%edx
 718:	f7 f3                	div    %ebx
 71a:	89 d0                	mov    %edx,%eax
 71c:	0f b6 80 60 0f 00 00 	movzbl 0xf60(%eax),%eax
 723:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 727:	8b 75 10             	mov    0x10(%ebp),%esi
 72a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 72d:	ba 00 00 00 00       	mov    $0x0,%edx
 732:	f7 f6                	div    %esi
 734:	89 45 ec             	mov    %eax,-0x14(%ebp)
 737:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 73b:	75 c7                	jne    704 <printint+0x39>
  if(neg)
 73d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 741:	74 10                	je     753 <printint+0x88>
    buf[i++] = '-';
 743:	8b 45 f4             	mov    -0xc(%ebp),%eax
 746:	8d 50 01             	lea    0x1(%eax),%edx
 749:	89 55 f4             	mov    %edx,-0xc(%ebp)
 74c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 751:	eb 1f                	jmp    772 <printint+0xa7>
 753:	eb 1d                	jmp    772 <printint+0xa7>
    putc(fd, buf[i]);
 755:	8d 55 dc             	lea    -0x24(%ebp),%edx
 758:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75b:	01 d0                	add    %edx,%eax
 75d:	0f b6 00             	movzbl (%eax),%eax
 760:	0f be c0             	movsbl %al,%eax
 763:	89 44 24 04          	mov    %eax,0x4(%esp)
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 31 ff ff ff       	call   6a3 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 772:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 776:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 77a:	79 d9                	jns    755 <printint+0x8a>
    putc(fd, buf[i]);
}
 77c:	83 c4 30             	add    $0x30,%esp
 77f:	5b                   	pop    %ebx
 780:	5e                   	pop    %esi
 781:	5d                   	pop    %ebp
 782:	c3                   	ret    

00000783 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 783:	55                   	push   %ebp
 784:	89 e5                	mov    %esp,%ebp
 786:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 789:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 790:	8d 45 0c             	lea    0xc(%ebp),%eax
 793:	83 c0 04             	add    $0x4,%eax
 796:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 799:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 7a0:	e9 7c 01 00 00       	jmp    921 <printf+0x19e>
    c = fmt[i] & 0xff;
 7a5:	8b 55 0c             	mov    0xc(%ebp),%edx
 7a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ab:	01 d0                	add    %edx,%eax
 7ad:	0f b6 00             	movzbl (%eax),%eax
 7b0:	0f be c0             	movsbl %al,%eax
 7b3:	25 ff 00 00 00       	and    $0xff,%eax
 7b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7bb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7bf:	75 2c                	jne    7ed <printf+0x6a>
      if(c == '%'){
 7c1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7c5:	75 0c                	jne    7d3 <printf+0x50>
        state = '%';
 7c7:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7ce:	e9 4a 01 00 00       	jmp    91d <printf+0x19a>
      } else {
        putc(fd, c);
 7d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d6:	0f be c0             	movsbl %al,%eax
 7d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	89 04 24             	mov    %eax,(%esp)
 7e3:	e8 bb fe ff ff       	call   6a3 <putc>
 7e8:	e9 30 01 00 00       	jmp    91d <printf+0x19a>
      }
    } else if(state == '%'){
 7ed:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7f1:	0f 85 26 01 00 00    	jne    91d <printf+0x19a>
      if(c == 'd'){
 7f7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7fb:	75 2d                	jne    82a <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 800:	8b 00                	mov    (%eax),%eax
 802:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 809:	00 
 80a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 811:	00 
 812:	89 44 24 04          	mov    %eax,0x4(%esp)
 816:	8b 45 08             	mov    0x8(%ebp),%eax
 819:	89 04 24             	mov    %eax,(%esp)
 81c:	e8 aa fe ff ff       	call   6cb <printint>
        ap++;
 821:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 825:	e9 ec 00 00 00       	jmp    916 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 82a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 82e:	74 06                	je     836 <printf+0xb3>
 830:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 834:	75 2d                	jne    863 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 836:	8b 45 e8             	mov    -0x18(%ebp),%eax
 839:	8b 00                	mov    (%eax),%eax
 83b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 842:	00 
 843:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 84a:	00 
 84b:	89 44 24 04          	mov    %eax,0x4(%esp)
 84f:	8b 45 08             	mov    0x8(%ebp),%eax
 852:	89 04 24             	mov    %eax,(%esp)
 855:	e8 71 fe ff ff       	call   6cb <printint>
        ap++;
 85a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 85e:	e9 b3 00 00 00       	jmp    916 <printf+0x193>
      } else if(c == 's'){
 863:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 867:	75 45                	jne    8ae <printf+0x12b>
        s = (char*)*ap;
 869:	8b 45 e8             	mov    -0x18(%ebp),%eax
 86c:	8b 00                	mov    (%eax),%eax
 86e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 871:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 875:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 879:	75 09                	jne    884 <printf+0x101>
          s = "(null)";
 87b:	c7 45 f4 97 0c 00 00 	movl   $0xc97,-0xc(%ebp)
        while(*s != 0){
 882:	eb 1e                	jmp    8a2 <printf+0x11f>
 884:	eb 1c                	jmp    8a2 <printf+0x11f>
          putc(fd, *s);
 886:	8b 45 f4             	mov    -0xc(%ebp),%eax
 889:	0f b6 00             	movzbl (%eax),%eax
 88c:	0f be c0             	movsbl %al,%eax
 88f:	89 44 24 04          	mov    %eax,0x4(%esp)
 893:	8b 45 08             	mov    0x8(%ebp),%eax
 896:	89 04 24             	mov    %eax,(%esp)
 899:	e8 05 fe ff ff       	call   6a3 <putc>
          s++;
 89e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a5:	0f b6 00             	movzbl (%eax),%eax
 8a8:	84 c0                	test   %al,%al
 8aa:	75 da                	jne    886 <printf+0x103>
 8ac:	eb 68                	jmp    916 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8ae:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 8b2:	75 1d                	jne    8d1 <printf+0x14e>
        putc(fd, *ap);
 8b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8b7:	8b 00                	mov    (%eax),%eax
 8b9:	0f be c0             	movsbl %al,%eax
 8bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c0:	8b 45 08             	mov    0x8(%ebp),%eax
 8c3:	89 04 24             	mov    %eax,(%esp)
 8c6:	e8 d8 fd ff ff       	call   6a3 <putc>
        ap++;
 8cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8cf:	eb 45                	jmp    916 <printf+0x193>
      } else if(c == '%'){
 8d1:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8d5:	75 17                	jne    8ee <printf+0x16b>
        putc(fd, c);
 8d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8da:	0f be c0             	movsbl %al,%eax
 8dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e1:	8b 45 08             	mov    0x8(%ebp),%eax
 8e4:	89 04 24             	mov    %eax,(%esp)
 8e7:	e8 b7 fd ff ff       	call   6a3 <putc>
 8ec:	eb 28                	jmp    916 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8ee:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8f5:	00 
 8f6:	8b 45 08             	mov    0x8(%ebp),%eax
 8f9:	89 04 24             	mov    %eax,(%esp)
 8fc:	e8 a2 fd ff ff       	call   6a3 <putc>
        putc(fd, c);
 901:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 904:	0f be c0             	movsbl %al,%eax
 907:	89 44 24 04          	mov    %eax,0x4(%esp)
 90b:	8b 45 08             	mov    0x8(%ebp),%eax
 90e:	89 04 24             	mov    %eax,(%esp)
 911:	e8 8d fd ff ff       	call   6a3 <putc>
      }
      state = 0;
 916:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 91d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 921:	8b 55 0c             	mov    0xc(%ebp),%edx
 924:	8b 45 f0             	mov    -0x10(%ebp),%eax
 927:	01 d0                	add    %edx,%eax
 929:	0f b6 00             	movzbl (%eax),%eax
 92c:	84 c0                	test   %al,%al
 92e:	0f 85 71 fe ff ff    	jne    7a5 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 934:	c9                   	leave  
 935:	c3                   	ret    

00000936 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 936:	55                   	push   %ebp
 937:	89 e5                	mov    %esp,%ebp
 939:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 93c:	8b 45 08             	mov    0x8(%ebp),%eax
 93f:	83 e8 08             	sub    $0x8,%eax
 942:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 945:	a1 7c 0f 00 00       	mov    0xf7c,%eax
 94a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 94d:	eb 24                	jmp    973 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 952:	8b 00                	mov    (%eax),%eax
 954:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 957:	77 12                	ja     96b <free+0x35>
 959:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 95f:	77 24                	ja     985 <free+0x4f>
 961:	8b 45 fc             	mov    -0x4(%ebp),%eax
 964:	8b 00                	mov    (%eax),%eax
 966:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 969:	77 1a                	ja     985 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96e:	8b 00                	mov    (%eax),%eax
 970:	89 45 fc             	mov    %eax,-0x4(%ebp)
 973:	8b 45 f8             	mov    -0x8(%ebp),%eax
 976:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 979:	76 d4                	jbe    94f <free+0x19>
 97b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97e:	8b 00                	mov    (%eax),%eax
 980:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 983:	76 ca                	jbe    94f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 985:	8b 45 f8             	mov    -0x8(%ebp),%eax
 988:	8b 40 04             	mov    0x4(%eax),%eax
 98b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 992:	8b 45 f8             	mov    -0x8(%ebp),%eax
 995:	01 c2                	add    %eax,%edx
 997:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99a:	8b 00                	mov    (%eax),%eax
 99c:	39 c2                	cmp    %eax,%edx
 99e:	75 24                	jne    9c4 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 9a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a3:	8b 50 04             	mov    0x4(%eax),%edx
 9a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a9:	8b 00                	mov    (%eax),%eax
 9ab:	8b 40 04             	mov    0x4(%eax),%eax
 9ae:	01 c2                	add    %eax,%edx
 9b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b3:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b9:	8b 00                	mov    (%eax),%eax
 9bb:	8b 10                	mov    (%eax),%edx
 9bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c0:	89 10                	mov    %edx,(%eax)
 9c2:	eb 0a                	jmp    9ce <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c7:	8b 10                	mov    (%eax),%edx
 9c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9cc:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d1:	8b 40 04             	mov    0x4(%eax),%eax
 9d4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9de:	01 d0                	add    %edx,%eax
 9e0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9e3:	75 20                	jne    a05 <free+0xcf>
    p->s.size += bp->s.size;
 9e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e8:	8b 50 04             	mov    0x4(%eax),%edx
 9eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ee:	8b 40 04             	mov    0x4(%eax),%eax
 9f1:	01 c2                	add    %eax,%edx
 9f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9fc:	8b 10                	mov    (%eax),%edx
 9fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a01:	89 10                	mov    %edx,(%eax)
 a03:	eb 08                	jmp    a0d <free+0xd7>
  } else
    p->s.ptr = bp;
 a05:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a08:	8b 55 f8             	mov    -0x8(%ebp),%edx
 a0b:	89 10                	mov    %edx,(%eax)
  freep = p;
 a0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a10:	a3 7c 0f 00 00       	mov    %eax,0xf7c
}
 a15:	c9                   	leave  
 a16:	c3                   	ret    

00000a17 <morecore>:

static Header*
morecore(uint nu)
{
 a17:	55                   	push   %ebp
 a18:	89 e5                	mov    %esp,%ebp
 a1a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a1d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a24:	77 07                	ja     a2d <morecore+0x16>
    nu = 4096;
 a26:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a2d:	8b 45 08             	mov    0x8(%ebp),%eax
 a30:	c1 e0 03             	shl    $0x3,%eax
 a33:	89 04 24             	mov    %eax,(%esp)
 a36:	e8 18 fc ff ff       	call   653 <sbrk>
 a3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a3e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a42:	75 07                	jne    a4b <morecore+0x34>
    return 0;
 a44:	b8 00 00 00 00       	mov    $0x0,%eax
 a49:	eb 22                	jmp    a6d <morecore+0x56>
  hp = (Header*)p;
 a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a54:	8b 55 08             	mov    0x8(%ebp),%edx
 a57:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5d:	83 c0 08             	add    $0x8,%eax
 a60:	89 04 24             	mov    %eax,(%esp)
 a63:	e8 ce fe ff ff       	call   936 <free>
  return freep;
 a68:	a1 7c 0f 00 00       	mov    0xf7c,%eax
}
 a6d:	c9                   	leave  
 a6e:	c3                   	ret    

00000a6f <malloc>:

void*
malloc(uint nbytes)
{
 a6f:	55                   	push   %ebp
 a70:	89 e5                	mov    %esp,%ebp
 a72:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a75:	8b 45 08             	mov    0x8(%ebp),%eax
 a78:	83 c0 07             	add    $0x7,%eax
 a7b:	c1 e8 03             	shr    $0x3,%eax
 a7e:	83 c0 01             	add    $0x1,%eax
 a81:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a84:	a1 7c 0f 00 00       	mov    0xf7c,%eax
 a89:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a8c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a90:	75 23                	jne    ab5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a92:	c7 45 f0 74 0f 00 00 	movl   $0xf74,-0x10(%ebp)
 a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a9c:	a3 7c 0f 00 00       	mov    %eax,0xf7c
 aa1:	a1 7c 0f 00 00       	mov    0xf7c,%eax
 aa6:	a3 74 0f 00 00       	mov    %eax,0xf74
    base.s.size = 0;
 aab:	c7 05 78 0f 00 00 00 	movl   $0x0,0xf78
 ab2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ab8:	8b 00                	mov    (%eax),%eax
 aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac0:	8b 40 04             	mov    0x4(%eax),%eax
 ac3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ac6:	72 4d                	jb     b15 <malloc+0xa6>
      if(p->s.size == nunits)
 ac8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acb:	8b 40 04             	mov    0x4(%eax),%eax
 ace:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ad1:	75 0c                	jne    adf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad6:	8b 10                	mov    (%eax),%edx
 ad8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 adb:	89 10                	mov    %edx,(%eax)
 add:	eb 26                	jmp    b05 <malloc+0x96>
      else {
        p->s.size -= nunits;
 adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae2:	8b 40 04             	mov    0x4(%eax),%eax
 ae5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ae8:	89 c2                	mov    %eax,%edx
 aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 af0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af3:	8b 40 04             	mov    0x4(%eax),%eax
 af6:	c1 e0 03             	shl    $0x3,%eax
 af9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aff:	8b 55 ec             	mov    -0x14(%ebp),%edx
 b02:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 b05:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b08:	a3 7c 0f 00 00       	mov    %eax,0xf7c
      return (void*)(p + 1);
 b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b10:	83 c0 08             	add    $0x8,%eax
 b13:	eb 38                	jmp    b4d <malloc+0xde>
    }
    if(p == freep)
 b15:	a1 7c 0f 00 00       	mov    0xf7c,%eax
 b1a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b1d:	75 1b                	jne    b3a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b22:	89 04 24             	mov    %eax,(%esp)
 b25:	e8 ed fe ff ff       	call   a17 <morecore>
 b2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b31:	75 07                	jne    b3a <malloc+0xcb>
        return 0;
 b33:	b8 00 00 00 00       	mov    $0x0,%eax
 b38:	eb 13                	jmp    b4d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b43:	8b 00                	mov    (%eax),%eax
 b45:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b48:	e9 70 ff ff ff       	jmp    abd <malloc+0x4e>
}
 b4d:	c9                   	leave  
 b4e:	c3                   	ret    
