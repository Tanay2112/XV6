
_move:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:
#include "fcntl.h"
char buf[512];

void
cat(int fd1, int fd2)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd1, buf, sizeof(buf))) > 0) {
   6:	eb 1b                	jmp    23 <cat+0x23>
    // write(1, buf, n);
    printf(fd2, "%s", buf);
   8:	c7 44 24 08 20 0d 00 	movl   $0xd20,0x8(%esp)
   f:	00 
  10:	c7 44 24 04 f8 09 00 	movl   $0x9f8,0x4(%esp)
  17:	00 
  18:	8b 45 0c             	mov    0xc(%ebp),%eax
  1b:	89 04 24             	mov    %eax,(%esp)
  1e:	e8 08 06 00 00       	call   62b <printf>
void
cat(int fd1, int fd2)
{
  int n;

  while((n = read(fd1, buf, sizeof(buf))) > 0) {
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 20 0d 00 	movl   $0xd20,0x4(%esp)
  32:	00 
  33:	8b 45 08             	mov    0x8(%ebp),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 7d 04 00 00       	call   4bb <read>
  3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  45:	7f c1                	jg     8 <cat+0x8>
    // write(1, buf, n);
    printf(fd2, "%s", buf);
  }
  if(n < 0){
  47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  4b:	79 19                	jns    66 <cat+0x66>
    printf(1, "move: read error\n");
  4d:	c7 44 24 04 fb 09 00 	movl   $0x9fb,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 ca 05 00 00       	call   62b <printf>
    exit();
  61:	e8 3d 04 00 00       	call   4a3 <exit>
  }
}
  66:	c9                   	leave  
  67:	c3                   	ret    

00000068 <main>:

int
main(int argc, char *argv[])
{
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	53                   	push   %ebx
  6c:	83 e4 f0             	and    $0xfffffff0,%esp
  6f:	83 ec 30             	sub    $0x30,%esp
  int fd1;
  if(argc < 3){
  72:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  76:	7f 19                	jg     91 <main+0x29>
    printf(1, "move: specify file name and dir to move file to\n");
  78:	c7 44 24 04 10 0a 00 	movl   $0xa10,0x4(%esp)
  7f:	00 
  80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  87:	e8 9f 05 00 00       	call   62b <printf>
    exit();
  8c:	e8 12 04 00 00       	call   4a3 <exit>
  }
  if((fd1 = open(argv[1], 0)) < 0){
  91:	8b 45 0c             	mov    0xc(%ebp),%eax
  94:	83 c0 04             	add    $0x4,%eax
  97:	8b 00                	mov    (%eax),%eax
  99:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  a0:	00 
  a1:	89 04 24             	mov    %eax,(%esp)
  a4:	e8 3a 04 00 00       	call   4e3 <open>
  a9:	89 44 24 24          	mov    %eax,0x24(%esp)
  ad:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  b2:	79 19                	jns    cd <main+0x65>
    printf(1, "move: error moving file.\n");
  b4:	c7 44 24 04 41 0a 00 	movl   $0xa41,0x4(%esp)
  bb:	00 
  bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c3:	e8 63 05 00 00       	call   62b <printf>
    exit();
  c8:	e8 d6 03 00 00       	call   4a3 <exit>
  }
  int fd2;
  
  //Append "/" to argv[2] and then append argv[1] to it. 
  int s1 = strlen(argv[1]); //String length of file name to be moved
  cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  d0:	83 c0 04             	add    $0x4,%eax
  d3:	8b 00                	mov    (%eax),%eax
  d5:	89 04 24             	mov    %eax,(%esp)
  d8:	e8 f2 01 00 00       	call   2cf <strlen>
  dd:	89 44 24 20          	mov    %eax,0x20(%esp)
  int s2 = strlen(argv[2]); //String length of directory where file is to be moved
  e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  e4:	83 c0 08             	add    $0x8,%eax
  e7:	8b 00                	mov    (%eax),%eax
  e9:	89 04 24             	mov    %eax,(%esp)
  ec:	e8 de 01 00 00       	call   2cf <strlen>
  f1:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  char * s = (char *) malloc(s1+s2+1+1);
  f5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  f9:	8b 54 24 20          	mov    0x20(%esp),%edx
  fd:	01 d0                	add    %edx,%eax
  ff:	83 c0 02             	add    $0x2,%eax
 102:	89 04 24             	mov    %eax,(%esp)
 105:	e8 0d 08 00 00       	call   917 <malloc>
 10a:	89 44 24 18          	mov    %eax,0x18(%esp)
  int n = s2;
 10e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 112:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  char * temp = s;
 116:	8b 44 24 18          	mov    0x18(%esp),%eax
 11a:	89 44 24 28          	mov    %eax,0x28(%esp)
  char * fileName = argv[1];
 11e:	8b 45 0c             	mov    0xc(%ebp),%eax
 121:	8b 40 04             	mov    0x4(%eax),%eax
 124:	89 44 24 14          	mov    %eax,0x14(%esp)
  while(n-- > 0 && (*temp++ = *argv[2]++) != 0)
 128:	90                   	nop
 129:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 12d:	8d 50 ff             	lea    -0x1(%eax),%edx
 130:	89 54 24 2c          	mov    %edx,0x2c(%esp)
 134:	85 c0                	test   %eax,%eax
 136:	7e 24                	jle    15c <main+0xf4>
 138:	8b 44 24 28          	mov    0x28(%esp),%eax
 13c:	8d 50 01             	lea    0x1(%eax),%edx
 13f:	89 54 24 28          	mov    %edx,0x28(%esp)
 143:	8b 55 0c             	mov    0xc(%ebp),%edx
 146:	8d 4a 08             	lea    0x8(%edx),%ecx
 149:	8b 11                	mov    (%ecx),%edx
 14b:	8d 5a 01             	lea    0x1(%edx),%ebx
 14e:	89 19                	mov    %ebx,(%ecx)
 150:	0f b6 12             	movzbl (%edx),%edx
 153:	88 10                	mov    %dl,(%eax)
 155:	0f b6 00             	movzbl (%eax),%eax
 158:	84 c0                	test   %al,%al
 15a:	75 cd                	jne    129 <main+0xc1>
    ;
  *temp++ = '/';
 15c:	8b 44 24 28          	mov    0x28(%esp),%eax
 160:	8d 50 01             	lea    0x1(%eax),%edx
 163:	89 54 24 28          	mov    %edx,0x28(%esp)
 167:	c6 00 2f             	movb   $0x2f,(%eax)
  n = s1;
 16a:	8b 44 24 20          	mov    0x20(%esp),%eax
 16e:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  while(n-- > 0 && (*temp++ = *argv[1]++) != 0)
 172:	90                   	nop
 173:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 177:	8d 50 ff             	lea    -0x1(%eax),%edx
 17a:	89 54 24 2c          	mov    %edx,0x2c(%esp)
 17e:	85 c0                	test   %eax,%eax
 180:	7e 24                	jle    1a6 <main+0x13e>
 182:	8b 44 24 28          	mov    0x28(%esp),%eax
 186:	8d 50 01             	lea    0x1(%eax),%edx
 189:	89 54 24 28          	mov    %edx,0x28(%esp)
 18d:	8b 55 0c             	mov    0xc(%ebp),%edx
 190:	8d 4a 04             	lea    0x4(%edx),%ecx
 193:	8b 11                	mov    (%ecx),%edx
 195:	8d 5a 01             	lea    0x1(%edx),%ebx
 198:	89 19                	mov    %ebx,(%ecx)
 19a:	0f b6 12             	movzbl (%edx),%edx
 19d:	88 10                	mov    %dl,(%eax)
 19f:	0f b6 00             	movzbl (%eax),%eax
 1a2:	84 c0                	test   %al,%al
 1a4:	75 cd                	jne    173 <main+0x10b>
    ;
  // printf(1, "%s\n", s);

  if ((fd2 = open(s, O_CREATE | O_RDWR)) < 0) {
 1a6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
 1ad:	00 
 1ae:	8b 44 24 18          	mov    0x18(%esp),%eax
 1b2:	89 04 24             	mov    %eax,(%esp)
 1b5:	e8 29 03 00 00       	call   4e3 <open>
 1ba:	89 44 24 10          	mov    %eax,0x10(%esp)
 1be:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
 1c3:	79 19                	jns    1de <main+0x176>
    printf(1, "move: error moving file.\n");
 1c5:	c7 44 24 04 41 0a 00 	movl   $0xa41,0x4(%esp)
 1cc:	00 
 1cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d4:	e8 52 04 00 00       	call   62b <printf>
    exit();
 1d9:	e8 c5 02 00 00       	call   4a3 <exit>
  }


  cat(fd1,fd2);
 1de:	8b 44 24 10          	mov    0x10(%esp),%eax
 1e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e6:	8b 44 24 24          	mov    0x24(%esp),%eax
 1ea:	89 04 24             	mov    %eax,(%esp)
 1ed:	e8 0e fe ff ff       	call   0 <cat>
  close(fd1);
 1f2:	8b 44 24 24          	mov    0x24(%esp),%eax
 1f6:	89 04 24             	mov    %eax,(%esp)
 1f9:	e8 cd 02 00 00       	call   4cb <close>
  close(fd2);
 1fe:	8b 44 24 10          	mov    0x10(%esp),%eax
 202:	89 04 24             	mov    %eax,(%esp)
 205:	e8 c1 02 00 00       	call   4cb <close>
  if(unlink(fileName) < 0){
 20a:	8b 44 24 14          	mov    0x14(%esp),%eax
 20e:	89 04 24             	mov    %eax,(%esp)
 211:	e8 dd 02 00 00       	call   4f3 <unlink>
 216:	85 c0                	test   %eax,%eax
 218:	79 1c                	jns    236 <main+0x1ce>
      printf(2, "move: %s failed to delete\n", fileName);
 21a:	8b 44 24 14          	mov    0x14(%esp),%eax
 21e:	89 44 24 08          	mov    %eax,0x8(%esp)
 222:	c7 44 24 04 5b 0a 00 	movl   $0xa5b,0x4(%esp)
 229:	00 
 22a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 231:	e8 f5 03 00 00       	call   62b <printf>
  }
  exit();
 236:	e8 68 02 00 00       	call   4a3 <exit>

0000023b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
 23e:	57                   	push   %edi
 23f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 240:	8b 4d 08             	mov    0x8(%ebp),%ecx
 243:	8b 55 10             	mov    0x10(%ebp),%edx
 246:	8b 45 0c             	mov    0xc(%ebp),%eax
 249:	89 cb                	mov    %ecx,%ebx
 24b:	89 df                	mov    %ebx,%edi
 24d:	89 d1                	mov    %edx,%ecx
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
 252:	89 ca                	mov    %ecx,%edx
 254:	89 fb                	mov    %edi,%ebx
 256:	89 5d 08             	mov    %ebx,0x8(%ebp)
 259:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 25c:	5b                   	pop    %ebx
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    

00000260 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 26c:	90                   	nop
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	8d 50 01             	lea    0x1(%eax),%edx
 273:	89 55 08             	mov    %edx,0x8(%ebp)
 276:	8b 55 0c             	mov    0xc(%ebp),%edx
 279:	8d 4a 01             	lea    0x1(%edx),%ecx
 27c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 27f:	0f b6 12             	movzbl (%edx),%edx
 282:	88 10                	mov    %dl,(%eax)
 284:	0f b6 00             	movzbl (%eax),%eax
 287:	84 c0                	test   %al,%al
 289:	75 e2                	jne    26d <strcpy+0xd>
    ;
  return os;
 28b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28e:	c9                   	leave  
 28f:	c3                   	ret    

00000290 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 293:	eb 08                	jmp    29d <strcmp+0xd>
    p++, q++;
 295:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 299:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	0f b6 00             	movzbl (%eax),%eax
 2a3:	84 c0                	test   %al,%al
 2a5:	74 10                	je     2b7 <strcmp+0x27>
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	0f b6 10             	movzbl (%eax),%edx
 2ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b0:	0f b6 00             	movzbl (%eax),%eax
 2b3:	38 c2                	cmp    %al,%dl
 2b5:	74 de                	je     295 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	0f b6 00             	movzbl (%eax),%eax
 2bd:	0f b6 d0             	movzbl %al,%edx
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	0f b6 00             	movzbl (%eax),%eax
 2c6:	0f b6 c0             	movzbl %al,%eax
 2c9:	29 c2                	sub    %eax,%edx
 2cb:	89 d0                	mov    %edx,%eax
}
 2cd:	5d                   	pop    %ebp
 2ce:	c3                   	ret    

000002cf <strlen>:

uint
strlen(char *s)
{
 2cf:	55                   	push   %ebp
 2d0:	89 e5                	mov    %esp,%ebp
 2d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 2d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2dc:	eb 04                	jmp    2e2 <strlen+0x13>
 2de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e5:	8b 45 08             	mov    0x8(%ebp),%eax
 2e8:	01 d0                	add    %edx,%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	84 c0                	test   %al,%al
 2ef:	75 ed                	jne    2de <strlen+0xf>
    ;
  return n;
 2f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2f4:	c9                   	leave  
 2f5:	c3                   	ret    

000002f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2fc:	8b 45 10             	mov    0x10(%ebp),%eax
 2ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 303:	8b 45 0c             	mov    0xc(%ebp),%eax
 306:	89 44 24 04          	mov    %eax,0x4(%esp)
 30a:	8b 45 08             	mov    0x8(%ebp),%eax
 30d:	89 04 24             	mov    %eax,(%esp)
 310:	e8 26 ff ff ff       	call   23b <stosb>
  return dst;
 315:	8b 45 08             	mov    0x8(%ebp),%eax
}
 318:	c9                   	leave  
 319:	c3                   	ret    

0000031a <strchr>:

char*
strchr(const char *s, char c)
{
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	83 ec 04             	sub    $0x4,%esp
 320:	8b 45 0c             	mov    0xc(%ebp),%eax
 323:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 326:	eb 14                	jmp    33c <strchr+0x22>
    if(*s == c)
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	0f b6 00             	movzbl (%eax),%eax
 32e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 331:	75 05                	jne    338 <strchr+0x1e>
      return (char*)s;
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	eb 13                	jmp    34b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 338:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	84 c0                	test   %al,%al
 344:	75 e2                	jne    328 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 346:	b8 00 00 00 00       	mov    $0x0,%eax
}
 34b:	c9                   	leave  
 34c:	c3                   	ret    

0000034d <gets>:

char*
gets(char *buf, int max)
{
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 353:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 35a:	eb 4c                	jmp    3a8 <gets+0x5b>
    cc = read(0, &c, 1);
 35c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 363:	00 
 364:	8d 45 ef             	lea    -0x11(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 372:	e8 44 01 00 00       	call   4bb <read>
 377:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 37a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 37e:	7f 02                	jg     382 <gets+0x35>
      break;
 380:	eb 31                	jmp    3b3 <gets+0x66>
    buf[i++] = c;
 382:	8b 45 f4             	mov    -0xc(%ebp),%eax
 385:	8d 50 01             	lea    0x1(%eax),%edx
 388:	89 55 f4             	mov    %edx,-0xc(%ebp)
 38b:	89 c2                	mov    %eax,%edx
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	01 c2                	add    %eax,%edx
 392:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 396:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 398:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 39c:	3c 0a                	cmp    $0xa,%al
 39e:	74 13                	je     3b3 <gets+0x66>
 3a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3a4:	3c 0d                	cmp    $0xd,%al
 3a6:	74 0b                	je     3b3 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ab:	83 c0 01             	add    $0x1,%eax
 3ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3b1:	7c a9                	jl     35c <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	01 d0                	add    %edx,%eax
 3bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3c1:	c9                   	leave  
 3c2:	c3                   	ret    

000003c3 <stat>:

int
stat(char *n, struct stat *st)
{
 3c3:	55                   	push   %ebp
 3c4:	89 e5                	mov    %esp,%ebp
 3c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3d0:	00 
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	89 04 24             	mov    %eax,(%esp)
 3d7:	e8 07 01 00 00       	call   4e3 <open>
 3dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 3df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3e3:	79 07                	jns    3ec <stat+0x29>
    return -1;
 3e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ea:	eb 23                	jmp    40f <stat+0x4c>
  r = fstat(fd, st);
 3ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f6:	89 04 24             	mov    %eax,(%esp)
 3f9:	e8 fd 00 00 00       	call   4fb <fstat>
 3fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 401:	8b 45 f4             	mov    -0xc(%ebp),%eax
 404:	89 04 24             	mov    %eax,(%esp)
 407:	e8 bf 00 00 00       	call   4cb <close>
  return r;
 40c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 40f:	c9                   	leave  
 410:	c3                   	ret    

00000411 <atoi>:

int
atoi(const char *s)
{
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 417:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 41e:	eb 25                	jmp    445 <atoi+0x34>
    n = n*10 + *s++ - '0';
 420:	8b 55 fc             	mov    -0x4(%ebp),%edx
 423:	89 d0                	mov    %edx,%eax
 425:	c1 e0 02             	shl    $0x2,%eax
 428:	01 d0                	add    %edx,%eax
 42a:	01 c0                	add    %eax,%eax
 42c:	89 c1                	mov    %eax,%ecx
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	8d 50 01             	lea    0x1(%eax),%edx
 434:	89 55 08             	mov    %edx,0x8(%ebp)
 437:	0f b6 00             	movzbl (%eax),%eax
 43a:	0f be c0             	movsbl %al,%eax
 43d:	01 c8                	add    %ecx,%eax
 43f:	83 e8 30             	sub    $0x30,%eax
 442:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 445:	8b 45 08             	mov    0x8(%ebp),%eax
 448:	0f b6 00             	movzbl (%eax),%eax
 44b:	3c 2f                	cmp    $0x2f,%al
 44d:	7e 0a                	jle    459 <atoi+0x48>
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	0f b6 00             	movzbl (%eax),%eax
 455:	3c 39                	cmp    $0x39,%al
 457:	7e c7                	jle    420 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 459:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 45c:	c9                   	leave  
 45d:	c3                   	ret    

0000045e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 45e:	55                   	push   %ebp
 45f:	89 e5                	mov    %esp,%ebp
 461:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 46a:	8b 45 0c             	mov    0xc(%ebp),%eax
 46d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 470:	eb 17                	jmp    489 <memmove+0x2b>
    *dst++ = *src++;
 472:	8b 45 fc             	mov    -0x4(%ebp),%eax
 475:	8d 50 01             	lea    0x1(%eax),%edx
 478:	89 55 fc             	mov    %edx,-0x4(%ebp)
 47b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 47e:	8d 4a 01             	lea    0x1(%edx),%ecx
 481:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 484:	0f b6 12             	movzbl (%edx),%edx
 487:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 489:	8b 45 10             	mov    0x10(%ebp),%eax
 48c:	8d 50 ff             	lea    -0x1(%eax),%edx
 48f:	89 55 10             	mov    %edx,0x10(%ebp)
 492:	85 c0                	test   %eax,%eax
 494:	7f dc                	jg     472 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 496:	8b 45 08             	mov    0x8(%ebp),%eax
}
 499:	c9                   	leave  
 49a:	c3                   	ret    

0000049b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 49b:	b8 01 00 00 00       	mov    $0x1,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <exit>:
SYSCALL(exit)
 4a3:	b8 02 00 00 00       	mov    $0x2,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <wait>:
SYSCALL(wait)
 4ab:	b8 03 00 00 00       	mov    $0x3,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <pipe>:
SYSCALL(pipe)
 4b3:	b8 04 00 00 00       	mov    $0x4,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <read>:
SYSCALL(read)
 4bb:	b8 05 00 00 00       	mov    $0x5,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <write>:
SYSCALL(write)
 4c3:	b8 10 00 00 00       	mov    $0x10,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <close>:
SYSCALL(close)
 4cb:	b8 15 00 00 00       	mov    $0x15,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <kill>:
SYSCALL(kill)
 4d3:	b8 06 00 00 00       	mov    $0x6,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <exec>:
SYSCALL(exec)
 4db:	b8 07 00 00 00       	mov    $0x7,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <open>:
SYSCALL(open)
 4e3:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <mknod>:
SYSCALL(mknod)
 4eb:	b8 11 00 00 00       	mov    $0x11,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    

000004f3 <unlink>:
SYSCALL(unlink)
 4f3:	b8 12 00 00 00       	mov    $0x12,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret    

000004fb <fstat>:
SYSCALL(fstat)
 4fb:	b8 08 00 00 00       	mov    $0x8,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret    

00000503 <link>:
SYSCALL(link)
 503:	b8 13 00 00 00       	mov    $0x13,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret    

0000050b <mkdir>:
SYSCALL(mkdir)
 50b:	b8 14 00 00 00       	mov    $0x14,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret    

00000513 <chdir>:
SYSCALL(chdir)
 513:	b8 09 00 00 00       	mov    $0x9,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret    

0000051b <dup>:
SYSCALL(dup)
 51b:	b8 0a 00 00 00       	mov    $0xa,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret    

00000523 <getpid>:
SYSCALL(getpid)
 523:	b8 0b 00 00 00       	mov    $0xb,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret    

0000052b <sbrk>:
SYSCALL(sbrk)
 52b:	b8 0c 00 00 00       	mov    $0xc,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret    

00000533 <sleep>:
SYSCALL(sleep)
 533:	b8 0d 00 00 00       	mov    $0xd,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret    

0000053b <uptime>:
SYSCALL(uptime)
 53b:	b8 0e 00 00 00       	mov    $0xe,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret    

00000543 <getcwd>:
SYSCALL(getcwd)
 543:	b8 16 00 00 00       	mov    $0x16,%eax
 548:	cd 40                	int    $0x40
 54a:	c3                   	ret    

0000054b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 54b:	55                   	push   %ebp
 54c:	89 e5                	mov    %esp,%ebp
 54e:	83 ec 18             	sub    $0x18,%esp
 551:	8b 45 0c             	mov    0xc(%ebp),%eax
 554:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 557:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 55e:	00 
 55f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 562:	89 44 24 04          	mov    %eax,0x4(%esp)
 566:	8b 45 08             	mov    0x8(%ebp),%eax
 569:	89 04 24             	mov    %eax,(%esp)
 56c:	e8 52 ff ff ff       	call   4c3 <write>
}
 571:	c9                   	leave  
 572:	c3                   	ret    

00000573 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 573:	55                   	push   %ebp
 574:	89 e5                	mov    %esp,%ebp
 576:	56                   	push   %esi
 577:	53                   	push   %ebx
 578:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 57b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 582:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 586:	74 17                	je     59f <printint+0x2c>
 588:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 58c:	79 11                	jns    59f <printint+0x2c>
    neg = 1;
 58e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 595:	8b 45 0c             	mov    0xc(%ebp),%eax
 598:	f7 d8                	neg    %eax
 59a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 59d:	eb 06                	jmp    5a5 <printint+0x32>
  } else {
    x = xx;
 59f:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5ac:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5af:	8d 41 01             	lea    0x1(%ecx),%eax
 5b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5bb:	ba 00 00 00 00       	mov    $0x0,%edx
 5c0:	f7 f3                	div    %ebx
 5c2:	89 d0                	mov    %edx,%eax
 5c4:	0f b6 80 e4 0c 00 00 	movzbl 0xce4(%eax),%eax
 5cb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5cf:	8b 75 10             	mov    0x10(%ebp),%esi
 5d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d5:	ba 00 00 00 00       	mov    $0x0,%edx
 5da:	f7 f6                	div    %esi
 5dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e3:	75 c7                	jne    5ac <printint+0x39>
  if(neg)
 5e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5e9:	74 10                	je     5fb <printint+0x88>
    buf[i++] = '-';
 5eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ee:	8d 50 01             	lea    0x1(%eax),%edx
 5f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5f9:	eb 1f                	jmp    61a <printint+0xa7>
 5fb:	eb 1d                	jmp    61a <printint+0xa7>
    putc(fd, buf[i]);
 5fd:	8d 55 dc             	lea    -0x24(%ebp),%edx
 600:	8b 45 f4             	mov    -0xc(%ebp),%eax
 603:	01 d0                	add    %edx,%eax
 605:	0f b6 00             	movzbl (%eax),%eax
 608:	0f be c0             	movsbl %al,%eax
 60b:	89 44 24 04          	mov    %eax,0x4(%esp)
 60f:	8b 45 08             	mov    0x8(%ebp),%eax
 612:	89 04 24             	mov    %eax,(%esp)
 615:	e8 31 ff ff ff       	call   54b <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 61a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 61e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 622:	79 d9                	jns    5fd <printint+0x8a>
    putc(fd, buf[i]);
}
 624:	83 c4 30             	add    $0x30,%esp
 627:	5b                   	pop    %ebx
 628:	5e                   	pop    %esi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    

0000062b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 62b:	55                   	push   %ebp
 62c:	89 e5                	mov    %esp,%ebp
 62e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 631:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 638:	8d 45 0c             	lea    0xc(%ebp),%eax
 63b:	83 c0 04             	add    $0x4,%eax
 63e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 641:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 648:	e9 7c 01 00 00       	jmp    7c9 <printf+0x19e>
    c = fmt[i] & 0xff;
 64d:	8b 55 0c             	mov    0xc(%ebp),%edx
 650:	8b 45 f0             	mov    -0x10(%ebp),%eax
 653:	01 d0                	add    %edx,%eax
 655:	0f b6 00             	movzbl (%eax),%eax
 658:	0f be c0             	movsbl %al,%eax
 65b:	25 ff 00 00 00       	and    $0xff,%eax
 660:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 663:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 667:	75 2c                	jne    695 <printf+0x6a>
      if(c == '%'){
 669:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66d:	75 0c                	jne    67b <printf+0x50>
        state = '%';
 66f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 676:	e9 4a 01 00 00       	jmp    7c5 <printf+0x19a>
      } else {
        putc(fd, c);
 67b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67e:	0f be c0             	movsbl %al,%eax
 681:	89 44 24 04          	mov    %eax,0x4(%esp)
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	89 04 24             	mov    %eax,(%esp)
 68b:	e8 bb fe ff ff       	call   54b <putc>
 690:	e9 30 01 00 00       	jmp    7c5 <printf+0x19a>
      }
    } else if(state == '%'){
 695:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 699:	0f 85 26 01 00 00    	jne    7c5 <printf+0x19a>
      if(c == 'd'){
 69f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6a3:	75 2d                	jne    6d2 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a8:	8b 00                	mov    (%eax),%eax
 6aa:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6b1:	00 
 6b2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6b9:	00 
 6ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 6be:	8b 45 08             	mov    0x8(%ebp),%eax
 6c1:	89 04 24             	mov    %eax,(%esp)
 6c4:	e8 aa fe ff ff       	call   573 <printint>
        ap++;
 6c9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6cd:	e9 ec 00 00 00       	jmp    7be <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6d2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6d6:	74 06                	je     6de <printf+0xb3>
 6d8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6dc:	75 2d                	jne    70b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6de:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e1:	8b 00                	mov    (%eax),%eax
 6e3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6ea:	00 
 6eb:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6f2:	00 
 6f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 71 fe ff ff       	call   573 <printint>
        ap++;
 702:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 706:	e9 b3 00 00 00       	jmp    7be <printf+0x193>
      } else if(c == 's'){
 70b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 70f:	75 45                	jne    756 <printf+0x12b>
        s = (char*)*ap;
 711:	8b 45 e8             	mov    -0x18(%ebp),%eax
 714:	8b 00                	mov    (%eax),%eax
 716:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 719:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 71d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 721:	75 09                	jne    72c <printf+0x101>
          s = "(null)";
 723:	c7 45 f4 76 0a 00 00 	movl   $0xa76,-0xc(%ebp)
        while(*s != 0){
 72a:	eb 1e                	jmp    74a <printf+0x11f>
 72c:	eb 1c                	jmp    74a <printf+0x11f>
          putc(fd, *s);
 72e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 731:	0f b6 00             	movzbl (%eax),%eax
 734:	0f be c0             	movsbl %al,%eax
 737:	89 44 24 04          	mov    %eax,0x4(%esp)
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	89 04 24             	mov    %eax,(%esp)
 741:	e8 05 fe ff ff       	call   54b <putc>
          s++;
 746:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 74a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74d:	0f b6 00             	movzbl (%eax),%eax
 750:	84 c0                	test   %al,%al
 752:	75 da                	jne    72e <printf+0x103>
 754:	eb 68                	jmp    7be <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 756:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 75a:	75 1d                	jne    779 <printf+0x14e>
        putc(fd, *ap);
 75c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 75f:	8b 00                	mov    (%eax),%eax
 761:	0f be c0             	movsbl %al,%eax
 764:	89 44 24 04          	mov    %eax,0x4(%esp)
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	89 04 24             	mov    %eax,(%esp)
 76e:	e8 d8 fd ff ff       	call   54b <putc>
        ap++;
 773:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 777:	eb 45                	jmp    7be <printf+0x193>
      } else if(c == '%'){
 779:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 77d:	75 17                	jne    796 <printf+0x16b>
        putc(fd, c);
 77f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 782:	0f be c0             	movsbl %al,%eax
 785:	89 44 24 04          	mov    %eax,0x4(%esp)
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	89 04 24             	mov    %eax,(%esp)
 78f:	e8 b7 fd ff ff       	call   54b <putc>
 794:	eb 28                	jmp    7be <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 796:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 79d:	00 
 79e:	8b 45 08             	mov    0x8(%ebp),%eax
 7a1:	89 04 24             	mov    %eax,(%esp)
 7a4:	e8 a2 fd ff ff       	call   54b <putc>
        putc(fd, c);
 7a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ac:	0f be c0             	movsbl %al,%eax
 7af:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b3:	8b 45 08             	mov    0x8(%ebp),%eax
 7b6:	89 04 24             	mov    %eax,(%esp)
 7b9:	e8 8d fd ff ff       	call   54b <putc>
      }
      state = 0;
 7be:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 7cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cf:	01 d0                	add    %edx,%eax
 7d1:	0f b6 00             	movzbl (%eax),%eax
 7d4:	84 c0                	test   %al,%al
 7d6:	0f 85 71 fe ff ff    	jne    64d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7dc:	c9                   	leave  
 7dd:	c3                   	ret    

000007de <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7de:	55                   	push   %ebp
 7df:	89 e5                	mov    %esp,%ebp
 7e1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7e4:	8b 45 08             	mov    0x8(%ebp),%eax
 7e7:	83 e8 08             	sub    $0x8,%eax
 7ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ed:	a1 08 0d 00 00       	mov    0xd08,%eax
 7f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7f5:	eb 24                	jmp    81b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ff:	77 12                	ja     813 <free+0x35>
 801:	8b 45 f8             	mov    -0x8(%ebp),%eax
 804:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 807:	77 24                	ja     82d <free+0x4f>
 809:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80c:	8b 00                	mov    (%eax),%eax
 80e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 811:	77 1a                	ja     82d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 813:	8b 45 fc             	mov    -0x4(%ebp),%eax
 816:	8b 00                	mov    (%eax),%eax
 818:	89 45 fc             	mov    %eax,-0x4(%ebp)
 81b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 821:	76 d4                	jbe    7f7 <free+0x19>
 823:	8b 45 fc             	mov    -0x4(%ebp),%eax
 826:	8b 00                	mov    (%eax),%eax
 828:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82b:	76 ca                	jbe    7f7 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 82d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 830:	8b 40 04             	mov    0x4(%eax),%eax
 833:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 83a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83d:	01 c2                	add    %eax,%edx
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	8b 00                	mov    (%eax),%eax
 844:	39 c2                	cmp    %eax,%edx
 846:	75 24                	jne    86c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 848:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84b:	8b 50 04             	mov    0x4(%eax),%edx
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 00                	mov    (%eax),%eax
 853:	8b 40 04             	mov    0x4(%eax),%eax
 856:	01 c2                	add    %eax,%edx
 858:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 85e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 861:	8b 00                	mov    (%eax),%eax
 863:	8b 10                	mov    (%eax),%edx
 865:	8b 45 f8             	mov    -0x8(%ebp),%eax
 868:	89 10                	mov    %edx,(%eax)
 86a:	eb 0a                	jmp    876 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 86c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86f:	8b 10                	mov    (%eax),%edx
 871:	8b 45 f8             	mov    -0x8(%ebp),%eax
 874:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 876:	8b 45 fc             	mov    -0x4(%ebp),%eax
 879:	8b 40 04             	mov    0x4(%eax),%eax
 87c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 883:	8b 45 fc             	mov    -0x4(%ebp),%eax
 886:	01 d0                	add    %edx,%eax
 888:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 88b:	75 20                	jne    8ad <free+0xcf>
    p->s.size += bp->s.size;
 88d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 890:	8b 50 04             	mov    0x4(%eax),%edx
 893:	8b 45 f8             	mov    -0x8(%ebp),%eax
 896:	8b 40 04             	mov    0x4(%eax),%eax
 899:	01 c2                	add    %eax,%edx
 89b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a4:	8b 10                	mov    (%eax),%edx
 8a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a9:	89 10                	mov    %edx,(%eax)
 8ab:	eb 08                	jmp    8b5 <free+0xd7>
  } else
    p->s.ptr = bp;
 8ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8b3:	89 10                	mov    %edx,(%eax)
  freep = p;
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	a3 08 0d 00 00       	mov    %eax,0xd08
}
 8bd:	c9                   	leave  
 8be:	c3                   	ret    

000008bf <morecore>:

static Header*
morecore(uint nu)
{
 8bf:	55                   	push   %ebp
 8c0:	89 e5                	mov    %esp,%ebp
 8c2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8c5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8cc:	77 07                	ja     8d5 <morecore+0x16>
    nu = 4096;
 8ce:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8d5:	8b 45 08             	mov    0x8(%ebp),%eax
 8d8:	c1 e0 03             	shl    $0x3,%eax
 8db:	89 04 24             	mov    %eax,(%esp)
 8de:	e8 48 fc ff ff       	call   52b <sbrk>
 8e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8e6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8ea:	75 07                	jne    8f3 <morecore+0x34>
    return 0;
 8ec:	b8 00 00 00 00       	mov    $0x0,%eax
 8f1:	eb 22                	jmp    915 <morecore+0x56>
  hp = (Header*)p;
 8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fc:	8b 55 08             	mov    0x8(%ebp),%edx
 8ff:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 902:	8b 45 f0             	mov    -0x10(%ebp),%eax
 905:	83 c0 08             	add    $0x8,%eax
 908:	89 04 24             	mov    %eax,(%esp)
 90b:	e8 ce fe ff ff       	call   7de <free>
  return freep;
 910:	a1 08 0d 00 00       	mov    0xd08,%eax
}
 915:	c9                   	leave  
 916:	c3                   	ret    

00000917 <malloc>:

void*
malloc(uint nbytes)
{
 917:	55                   	push   %ebp
 918:	89 e5                	mov    %esp,%ebp
 91a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 91d:	8b 45 08             	mov    0x8(%ebp),%eax
 920:	83 c0 07             	add    $0x7,%eax
 923:	c1 e8 03             	shr    $0x3,%eax
 926:	83 c0 01             	add    $0x1,%eax
 929:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 92c:	a1 08 0d 00 00       	mov    0xd08,%eax
 931:	89 45 f0             	mov    %eax,-0x10(%ebp)
 934:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 938:	75 23                	jne    95d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 93a:	c7 45 f0 00 0d 00 00 	movl   $0xd00,-0x10(%ebp)
 941:	8b 45 f0             	mov    -0x10(%ebp),%eax
 944:	a3 08 0d 00 00       	mov    %eax,0xd08
 949:	a1 08 0d 00 00       	mov    0xd08,%eax
 94e:	a3 00 0d 00 00       	mov    %eax,0xd00
    base.s.size = 0;
 953:	c7 05 04 0d 00 00 00 	movl   $0x0,0xd04
 95a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 960:	8b 00                	mov    (%eax),%eax
 962:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 965:	8b 45 f4             	mov    -0xc(%ebp),%eax
 968:	8b 40 04             	mov    0x4(%eax),%eax
 96b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 96e:	72 4d                	jb     9bd <malloc+0xa6>
      if(p->s.size == nunits)
 970:	8b 45 f4             	mov    -0xc(%ebp),%eax
 973:	8b 40 04             	mov    0x4(%eax),%eax
 976:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 979:	75 0c                	jne    987 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 97b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97e:	8b 10                	mov    (%eax),%edx
 980:	8b 45 f0             	mov    -0x10(%ebp),%eax
 983:	89 10                	mov    %edx,(%eax)
 985:	eb 26                	jmp    9ad <malloc+0x96>
      else {
        p->s.size -= nunits;
 987:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98a:	8b 40 04             	mov    0x4(%eax),%eax
 98d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 990:	89 c2                	mov    %eax,%edx
 992:	8b 45 f4             	mov    -0xc(%ebp),%eax
 995:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 998:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99b:	8b 40 04             	mov    0x4(%eax),%eax
 99e:	c1 e0 03             	shl    $0x3,%eax
 9a1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9aa:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b0:	a3 08 0d 00 00       	mov    %eax,0xd08
      return (void*)(p + 1);
 9b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b8:	83 c0 08             	add    $0x8,%eax
 9bb:	eb 38                	jmp    9f5 <malloc+0xde>
    }
    if(p == freep)
 9bd:	a1 08 0d 00 00       	mov    0xd08,%eax
 9c2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9c5:	75 1b                	jne    9e2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ca:	89 04 24             	mov    %eax,(%esp)
 9cd:	e8 ed fe ff ff       	call   8bf <morecore>
 9d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9d9:	75 07                	jne    9e2 <malloc+0xcb>
        return 0;
 9db:	b8 00 00 00 00       	mov    $0x0,%eax
 9e0:	eb 13                	jmp    9f5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9eb:	8b 00                	mov    (%eax),%eax
 9ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9f0:	e9 70 ff ff ff       	jmp    965 <malloc+0x4e>
}
 9f5:	c9                   	leave  
 9f6:	c3                   	ret    
