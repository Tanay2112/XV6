
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
   6:	eb 36                	jmp    3e <cat+0x3e>
    write(1, buf, n);
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 d7 04 00 00       	call   4fa <write>
    printf(fd2, "%s", buf);
  23:	c7 44 24 08 60 0d 00 	movl   $0xd60,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 30 0a 00 	movl   $0xa30,0x4(%esp)
  32:	00 
  33:	8b 45 0c             	mov    0xc(%ebp),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 24 06 00 00       	call   662 <printf>
void
cat(int fd1, int fd2)
{
  int n;

  while((n = read(fd1, buf, sizeof(buf))) > 0) {
  3e:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  45:	00 
  46:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  4d:	00 
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 04 24             	mov    %eax,(%esp)
  54:	e8 99 04 00 00       	call   4f2 <read>
  59:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  60:	7f a6                	jg     8 <cat+0x8>
    write(1, buf, n);
    printf(fd2, "%s", buf);
  }
  if(n < 0){
  62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  66:	79 19                	jns    81 <cat+0x81>
    printf(1, "move: read error\n");
  68:	c7 44 24 04 33 0a 00 	movl   $0xa33,0x4(%esp)
  6f:	00 
  70:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  77:	e8 e6 05 00 00       	call   662 <printf>
    exit();
  7c:	e8 59 04 00 00       	call   4da <exit>
  }
}
  81:	c9                   	leave  
  82:	c3                   	ret    

00000083 <main>:

int
main(int argc, char *argv[])
{
  83:	55                   	push   %ebp
  84:	89 e5                	mov    %esp,%ebp
  86:	53                   	push   %ebx
  87:	83 e4 f0             	and    $0xfffffff0,%esp
  8a:	83 ec 30             	sub    $0x30,%esp
  int fd1;
  if(argc < 3){
  8d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  91:	7f 19                	jg     ac <main+0x29>
    printf(1, "move: specify file name and dir to move file to\n");
  93:	c7 44 24 04 48 0a 00 	movl   $0xa48,0x4(%esp)
  9a:	00 
  9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a2:	e8 bb 05 00 00       	call   662 <printf>
    exit();
  a7:	e8 2e 04 00 00       	call   4da <exit>
  }
  if((fd1 = open(argv[1], 0)) < 0){
  ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  af:	83 c0 04             	add    $0x4,%eax
  b2:	8b 00                	mov    (%eax),%eax
  b4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  bb:	00 
  bc:	89 04 24             	mov    %eax,(%esp)
  bf:	e8 56 04 00 00       	call   51a <open>
  c4:	89 44 24 24          	mov    %eax,0x24(%esp)
  c8:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  cd:	79 19                	jns    e8 <main+0x65>
    printf(1, "move: error moving file.\n");
  cf:	c7 44 24 04 79 0a 00 	movl   $0xa79,0x4(%esp)
  d6:	00 
  d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  de:	e8 7f 05 00 00       	call   662 <printf>
    exit();
  e3:	e8 f2 03 00 00       	call   4da <exit>
  }
  int fd2;
  
  //Append "/" to argv[2] and then append argv[1] to it. 
  int s1 = strlen(argv[1]); //String length of file name to be moved
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	83 c0 04             	add    $0x4,%eax
  ee:	8b 00                	mov    (%eax),%eax
  f0:	89 04 24             	mov    %eax,(%esp)
  f3:	e8 0e 02 00 00       	call   306 <strlen>
  f8:	89 44 24 20          	mov    %eax,0x20(%esp)
  int s2 = strlen(argv[2]); //String length of directory where file is to be moved
  fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  ff:	83 c0 08             	add    $0x8,%eax
 102:	8b 00                	mov    (%eax),%eax
 104:	89 04 24             	mov    %eax,(%esp)
 107:	e8 fa 01 00 00       	call   306 <strlen>
 10c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  char * s = (char *) malloc(s1+s2+1+1);
 110:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 114:	8b 54 24 20          	mov    0x20(%esp),%edx
 118:	01 d0                	add    %edx,%eax
 11a:	83 c0 02             	add    $0x2,%eax
 11d:	89 04 24             	mov    %eax,(%esp)
 120:	e8 29 08 00 00       	call   94e <malloc>
 125:	89 44 24 18          	mov    %eax,0x18(%esp)
  int n = s2;
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  char * temp = s;
 131:	8b 44 24 18          	mov    0x18(%esp),%eax
 135:	89 44 24 28          	mov    %eax,0x28(%esp)
  char * fileName = argv[1];
 139:	8b 45 0c             	mov    0xc(%ebp),%eax
 13c:	8b 40 04             	mov    0x4(%eax),%eax
 13f:	89 44 24 14          	mov    %eax,0x14(%esp)
  while(n-- > 0 && (*temp++ = *argv[2]++) != 0)
 143:	90                   	nop
 144:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 148:	8d 50 ff             	lea    -0x1(%eax),%edx
 14b:	89 54 24 2c          	mov    %edx,0x2c(%esp)
 14f:	85 c0                	test   %eax,%eax
 151:	7e 24                	jle    177 <main+0xf4>
 153:	8b 44 24 28          	mov    0x28(%esp),%eax
 157:	8d 50 01             	lea    0x1(%eax),%edx
 15a:	89 54 24 28          	mov    %edx,0x28(%esp)
 15e:	8b 55 0c             	mov    0xc(%ebp),%edx
 161:	8d 4a 08             	lea    0x8(%edx),%ecx
 164:	8b 11                	mov    (%ecx),%edx
 166:	8d 5a 01             	lea    0x1(%edx),%ebx
 169:	89 19                	mov    %ebx,(%ecx)
 16b:	0f b6 12             	movzbl (%edx),%edx
 16e:	88 10                	mov    %dl,(%eax)
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 cd                	jne    144 <main+0xc1>
    ;
  *temp++ = '/';
 177:	8b 44 24 28          	mov    0x28(%esp),%eax
 17b:	8d 50 01             	lea    0x1(%eax),%edx
 17e:	89 54 24 28          	mov    %edx,0x28(%esp)
 182:	c6 00 2f             	movb   $0x2f,(%eax)
  n = s1;
 185:	8b 44 24 20          	mov    0x20(%esp),%eax
 189:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  while(n-- > 0 && (*temp++ = *argv[1]++) != 0)
 18d:	90                   	nop
 18e:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 192:	8d 50 ff             	lea    -0x1(%eax),%edx
 195:	89 54 24 2c          	mov    %edx,0x2c(%esp)
 199:	85 c0                	test   %eax,%eax
 19b:	7e 24                	jle    1c1 <main+0x13e>
 19d:	8b 44 24 28          	mov    0x28(%esp),%eax
 1a1:	8d 50 01             	lea    0x1(%eax),%edx
 1a4:	89 54 24 28          	mov    %edx,0x28(%esp)
 1a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 1ab:	8d 4a 04             	lea    0x4(%edx),%ecx
 1ae:	8b 11                	mov    (%ecx),%edx
 1b0:	8d 5a 01             	lea    0x1(%edx),%ebx
 1b3:	89 19                	mov    %ebx,(%ecx)
 1b5:	0f b6 12             	movzbl (%edx),%edx
 1b8:	88 10                	mov    %dl,(%eax)
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 cd                	jne    18e <main+0x10b>
    ;
  printf(1, "%s\n", s);
 1c1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1c5:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c9:	c7 44 24 04 93 0a 00 	movl   $0xa93,0x4(%esp)
 1d0:	00 
 1d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d8:	e8 85 04 00 00       	call   662 <printf>

  if ((fd2 = open(s, O_CREATE | O_RDWR)) < 0) {
 1dd:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
 1e4:	00 
 1e5:	8b 44 24 18          	mov    0x18(%esp),%eax
 1e9:	89 04 24             	mov    %eax,(%esp)
 1ec:	e8 29 03 00 00       	call   51a <open>
 1f1:	89 44 24 10          	mov    %eax,0x10(%esp)
 1f5:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
 1fa:	79 19                	jns    215 <main+0x192>
    printf(1, "move: error moving file.\n");
 1fc:	c7 44 24 04 79 0a 00 	movl   $0xa79,0x4(%esp)
 203:	00 
 204:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 20b:	e8 52 04 00 00       	call   662 <printf>
    exit();
 210:	e8 c5 02 00 00       	call   4da <exit>
  }


  cat(fd1,fd2);
 215:	8b 44 24 10          	mov    0x10(%esp),%eax
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	8b 44 24 24          	mov    0x24(%esp),%eax
 221:	89 04 24             	mov    %eax,(%esp)
 224:	e8 d7 fd ff ff       	call   0 <cat>
  close(fd1);
 229:	8b 44 24 24          	mov    0x24(%esp),%eax
 22d:	89 04 24             	mov    %eax,(%esp)
 230:	e8 cd 02 00 00       	call   502 <close>
  close(fd2);
 235:	8b 44 24 10          	mov    0x10(%esp),%eax
 239:	89 04 24             	mov    %eax,(%esp)
 23c:	e8 c1 02 00 00       	call   502 <close>
  if(unlink(fileName) < 0){
 241:	8b 44 24 14          	mov    0x14(%esp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 dd 02 00 00       	call   52a <unlink>
 24d:	85 c0                	test   %eax,%eax
 24f:	79 1c                	jns    26d <main+0x1ea>
      printf(2, "move: %s failed to delete\n", fileName);
 251:	8b 44 24 14          	mov    0x14(%esp),%eax
 255:	89 44 24 08          	mov    %eax,0x8(%esp)
 259:	c7 44 24 04 97 0a 00 	movl   $0xa97,0x4(%esp)
 260:	00 
 261:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 268:	e8 f5 03 00 00       	call   662 <printf>
  }
  exit();
 26d:	e8 68 02 00 00       	call   4da <exit>

00000272 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	57                   	push   %edi
 276:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 277:	8b 4d 08             	mov    0x8(%ebp),%ecx
 27a:	8b 55 10             	mov    0x10(%ebp),%edx
 27d:	8b 45 0c             	mov    0xc(%ebp),%eax
 280:	89 cb                	mov    %ecx,%ebx
 282:	89 df                	mov    %ebx,%edi
 284:	89 d1                	mov    %edx,%ecx
 286:	fc                   	cld    
 287:	f3 aa                	rep stos %al,%es:(%edi)
 289:	89 ca                	mov    %ecx,%edx
 28b:	89 fb                	mov    %edi,%ebx
 28d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 290:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 293:	5b                   	pop    %ebx
 294:	5f                   	pop    %edi
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    

00000297 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2a3:	90                   	nop
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	8d 50 01             	lea    0x1(%eax),%edx
 2aa:	89 55 08             	mov    %edx,0x8(%ebp)
 2ad:	8b 55 0c             	mov    0xc(%ebp),%edx
 2b0:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b3:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2b6:	0f b6 12             	movzbl (%edx),%edx
 2b9:	88 10                	mov    %dl,(%eax)
 2bb:	0f b6 00             	movzbl (%eax),%eax
 2be:	84 c0                	test   %al,%al
 2c0:	75 e2                	jne    2a4 <strcpy+0xd>
    ;
  return os;
 2c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2ca:	eb 08                	jmp    2d4 <strcmp+0xd>
    p++, q++;
 2cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	84 c0                	test   %al,%al
 2dc:	74 10                	je     2ee <strcmp+0x27>
 2de:	8b 45 08             	mov    0x8(%ebp),%eax
 2e1:	0f b6 10             	movzbl (%eax),%edx
 2e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e7:	0f b6 00             	movzbl (%eax),%eax
 2ea:	38 c2                	cmp    %al,%dl
 2ec:	74 de                	je     2cc <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2ee:	8b 45 08             	mov    0x8(%ebp),%eax
 2f1:	0f b6 00             	movzbl (%eax),%eax
 2f4:	0f b6 d0             	movzbl %al,%edx
 2f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fa:	0f b6 00             	movzbl (%eax),%eax
 2fd:	0f b6 c0             	movzbl %al,%eax
 300:	29 c2                	sub    %eax,%edx
 302:	89 d0                	mov    %edx,%eax
}
 304:	5d                   	pop    %ebp
 305:	c3                   	ret    

00000306 <strlen>:

uint
strlen(char *s)
{
 306:	55                   	push   %ebp
 307:	89 e5                	mov    %esp,%ebp
 309:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 30c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 313:	eb 04                	jmp    319 <strlen+0x13>
 315:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 319:	8b 55 fc             	mov    -0x4(%ebp),%edx
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
 31f:	01 d0                	add    %edx,%eax
 321:	0f b6 00             	movzbl (%eax),%eax
 324:	84 c0                	test   %al,%al
 326:	75 ed                	jne    315 <strlen+0xf>
    ;
  return n;
 328:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 32b:	c9                   	leave  
 32c:	c3                   	ret    

0000032d <memset>:

void*
memset(void *dst, int c, uint n)
{
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 333:	8b 45 10             	mov    0x10(%ebp),%eax
 336:	89 44 24 08          	mov    %eax,0x8(%esp)
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	89 44 24 04          	mov    %eax,0x4(%esp)
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	89 04 24             	mov    %eax,(%esp)
 347:	e8 26 ff ff ff       	call   272 <stosb>
  return dst;
 34c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 34f:	c9                   	leave  
 350:	c3                   	ret    

00000351 <strchr>:

char*
strchr(const char *s, char c)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	83 ec 04             	sub    $0x4,%esp
 357:	8b 45 0c             	mov    0xc(%ebp),%eax
 35a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 35d:	eb 14                	jmp    373 <strchr+0x22>
    if(*s == c)
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	0f b6 00             	movzbl (%eax),%eax
 365:	3a 45 fc             	cmp    -0x4(%ebp),%al
 368:	75 05                	jne    36f <strchr+0x1e>
      return (char*)s;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	eb 13                	jmp    382 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 36f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	0f b6 00             	movzbl (%eax),%eax
 379:	84 c0                	test   %al,%al
 37b:	75 e2                	jne    35f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 37d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 382:	c9                   	leave  
 383:	c3                   	ret    

00000384 <gets>:

char*
gets(char *buf, int max)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 38a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 391:	eb 4c                	jmp    3df <gets+0x5b>
    cc = read(0, &c, 1);
 393:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 39a:	00 
 39b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 39e:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3a9:	e8 44 01 00 00       	call   4f2 <read>
 3ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3b5:	7f 02                	jg     3b9 <gets+0x35>
      break;
 3b7:	eb 31                	jmp    3ea <gets+0x66>
    buf[i++] = c;
 3b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3bc:	8d 50 01             	lea    0x1(%eax),%edx
 3bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3c2:	89 c2                	mov    %eax,%edx
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	01 c2                	add    %eax,%edx
 3c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3cd:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 3cf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3d3:	3c 0a                	cmp    $0xa,%al
 3d5:	74 13                	je     3ea <gets+0x66>
 3d7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3db:	3c 0d                	cmp    $0xd,%al
 3dd:	74 0b                	je     3ea <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e2:	83 c0 01             	add    $0x1,%eax
 3e5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3e8:	7c a9                	jl     393 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	01 d0                	add    %edx,%eax
 3f2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3f8:	c9                   	leave  
 3f9:	c3                   	ret    

000003fa <stat>:

int
stat(char *n, struct stat *st)
{
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 400:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 407:	00 
 408:	8b 45 08             	mov    0x8(%ebp),%eax
 40b:	89 04 24             	mov    %eax,(%esp)
 40e:	e8 07 01 00 00       	call   51a <open>
 413:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 416:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 41a:	79 07                	jns    423 <stat+0x29>
    return -1;
 41c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 421:	eb 23                	jmp    446 <stat+0x4c>
  r = fstat(fd, st);
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 fd 00 00 00       	call   532 <fstat>
 435:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 438:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43b:	89 04 24             	mov    %eax,(%esp)
 43e:	e8 bf 00 00 00       	call   502 <close>
  return r;
 443:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 446:	c9                   	leave  
 447:	c3                   	ret    

00000448 <atoi>:

int
atoi(const char *s)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 44e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 455:	eb 25                	jmp    47c <atoi+0x34>
    n = n*10 + *s++ - '0';
 457:	8b 55 fc             	mov    -0x4(%ebp),%edx
 45a:	89 d0                	mov    %edx,%eax
 45c:	c1 e0 02             	shl    $0x2,%eax
 45f:	01 d0                	add    %edx,%eax
 461:	01 c0                	add    %eax,%eax
 463:	89 c1                	mov    %eax,%ecx
 465:	8b 45 08             	mov    0x8(%ebp),%eax
 468:	8d 50 01             	lea    0x1(%eax),%edx
 46b:	89 55 08             	mov    %edx,0x8(%ebp)
 46e:	0f b6 00             	movzbl (%eax),%eax
 471:	0f be c0             	movsbl %al,%eax
 474:	01 c8                	add    %ecx,%eax
 476:	83 e8 30             	sub    $0x30,%eax
 479:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	0f b6 00             	movzbl (%eax),%eax
 482:	3c 2f                	cmp    $0x2f,%al
 484:	7e 0a                	jle    490 <atoi+0x48>
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	0f b6 00             	movzbl (%eax),%eax
 48c:	3c 39                	cmp    $0x39,%al
 48e:	7e c7                	jle    457 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 490:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 493:	c9                   	leave  
 494:	c3                   	ret    

00000495 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 495:	55                   	push   %ebp
 496:	89 e5                	mov    %esp,%ebp
 498:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4a7:	eb 17                	jmp    4c0 <memmove+0x2b>
    *dst++ = *src++;
 4a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4ac:	8d 50 01             	lea    0x1(%eax),%edx
 4af:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4b2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4b5:	8d 4a 01             	lea    0x1(%edx),%ecx
 4b8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4bb:	0f b6 12             	movzbl (%edx),%edx
 4be:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c0:	8b 45 10             	mov    0x10(%ebp),%eax
 4c3:	8d 50 ff             	lea    -0x1(%eax),%edx
 4c6:	89 55 10             	mov    %edx,0x10(%ebp)
 4c9:	85 c0                	test   %eax,%eax
 4cb:	7f dc                	jg     4a9 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4d0:	c9                   	leave  
 4d1:	c3                   	ret    

000004d2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d2:	b8 01 00 00 00       	mov    $0x1,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <exit>:
SYSCALL(exit)
 4da:	b8 02 00 00 00       	mov    $0x2,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <wait>:
SYSCALL(wait)
 4e2:	b8 03 00 00 00       	mov    $0x3,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <pipe>:
SYSCALL(pipe)
 4ea:	b8 04 00 00 00       	mov    $0x4,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <read>:
SYSCALL(read)
 4f2:	b8 05 00 00 00       	mov    $0x5,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <write>:
SYSCALL(write)
 4fa:	b8 10 00 00 00       	mov    $0x10,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <close>:
SYSCALL(close)
 502:	b8 15 00 00 00       	mov    $0x15,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <kill>:
SYSCALL(kill)
 50a:	b8 06 00 00 00       	mov    $0x6,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <exec>:
SYSCALL(exec)
 512:	b8 07 00 00 00       	mov    $0x7,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <open>:
SYSCALL(open)
 51a:	b8 0f 00 00 00       	mov    $0xf,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <mknod>:
SYSCALL(mknod)
 522:	b8 11 00 00 00       	mov    $0x11,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <unlink>:
SYSCALL(unlink)
 52a:	b8 12 00 00 00       	mov    $0x12,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <fstat>:
SYSCALL(fstat)
 532:	b8 08 00 00 00       	mov    $0x8,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <link>:
SYSCALL(link)
 53a:	b8 13 00 00 00       	mov    $0x13,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <mkdir>:
SYSCALL(mkdir)
 542:	b8 14 00 00 00       	mov    $0x14,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <chdir>:
SYSCALL(chdir)
 54a:	b8 09 00 00 00       	mov    $0x9,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <dup>:
SYSCALL(dup)
 552:	b8 0a 00 00 00       	mov    $0xa,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <getpid>:
SYSCALL(getpid)
 55a:	b8 0b 00 00 00       	mov    $0xb,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <sbrk>:
SYSCALL(sbrk)
 562:	b8 0c 00 00 00       	mov    $0xc,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <sleep>:
SYSCALL(sleep)
 56a:	b8 0d 00 00 00       	mov    $0xd,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <uptime>:
SYSCALL(uptime)
 572:	b8 0e 00 00 00       	mov    $0xe,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <getcwd>:
SYSCALL(getcwd)
 57a:	b8 16 00 00 00       	mov    $0x16,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 582:	55                   	push   %ebp
 583:	89 e5                	mov    %esp,%ebp
 585:	83 ec 18             	sub    $0x18,%esp
 588:	8b 45 0c             	mov    0xc(%ebp),%eax
 58b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 58e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 595:	00 
 596:	8d 45 f4             	lea    -0xc(%ebp),%eax
 599:	89 44 24 04          	mov    %eax,0x4(%esp)
 59d:	8b 45 08             	mov    0x8(%ebp),%eax
 5a0:	89 04 24             	mov    %eax,(%esp)
 5a3:	e8 52 ff ff ff       	call   4fa <write>
}
 5a8:	c9                   	leave  
 5a9:	c3                   	ret    

000005aa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5aa:	55                   	push   %ebp
 5ab:	89 e5                	mov    %esp,%ebp
 5ad:	56                   	push   %esi
 5ae:	53                   	push   %ebx
 5af:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5b9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5bd:	74 17                	je     5d6 <printint+0x2c>
 5bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5c3:	79 11                	jns    5d6 <printint+0x2c>
    neg = 1;
 5c5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 5cf:	f7 d8                	neg    %eax
 5d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5d4:	eb 06                	jmp    5dc <printint+0x32>
  } else {
    x = xx;
 5d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5e3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5e6:	8d 41 01             	lea    0x1(%ecx),%eax
 5e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5ec:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5f2:	ba 00 00 00 00       	mov    $0x0,%edx
 5f7:	f7 f3                	div    %ebx
 5f9:	89 d0                	mov    %edx,%eax
 5fb:	0f b6 80 20 0d 00 00 	movzbl 0xd20(%eax),%eax
 602:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 606:	8b 75 10             	mov    0x10(%ebp),%esi
 609:	8b 45 ec             	mov    -0x14(%ebp),%eax
 60c:	ba 00 00 00 00       	mov    $0x0,%edx
 611:	f7 f6                	div    %esi
 613:	89 45 ec             	mov    %eax,-0x14(%ebp)
 616:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 61a:	75 c7                	jne    5e3 <printint+0x39>
  if(neg)
 61c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 620:	74 10                	je     632 <printint+0x88>
    buf[i++] = '-';
 622:	8b 45 f4             	mov    -0xc(%ebp),%eax
 625:	8d 50 01             	lea    0x1(%eax),%edx
 628:	89 55 f4             	mov    %edx,-0xc(%ebp)
 62b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 630:	eb 1f                	jmp    651 <printint+0xa7>
 632:	eb 1d                	jmp    651 <printint+0xa7>
    putc(fd, buf[i]);
 634:	8d 55 dc             	lea    -0x24(%ebp),%edx
 637:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63a:	01 d0                	add    %edx,%eax
 63c:	0f b6 00             	movzbl (%eax),%eax
 63f:	0f be c0             	movsbl %al,%eax
 642:	89 44 24 04          	mov    %eax,0x4(%esp)
 646:	8b 45 08             	mov    0x8(%ebp),%eax
 649:	89 04 24             	mov    %eax,(%esp)
 64c:	e8 31 ff ff ff       	call   582 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 651:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 655:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 659:	79 d9                	jns    634 <printint+0x8a>
    putc(fd, buf[i]);
}
 65b:	83 c4 30             	add    $0x30,%esp
 65e:	5b                   	pop    %ebx
 65f:	5e                   	pop    %esi
 660:	5d                   	pop    %ebp
 661:	c3                   	ret    

00000662 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 662:	55                   	push   %ebp
 663:	89 e5                	mov    %esp,%ebp
 665:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 668:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 66f:	8d 45 0c             	lea    0xc(%ebp),%eax
 672:	83 c0 04             	add    $0x4,%eax
 675:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 678:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 67f:	e9 7c 01 00 00       	jmp    800 <printf+0x19e>
    c = fmt[i] & 0xff;
 684:	8b 55 0c             	mov    0xc(%ebp),%edx
 687:	8b 45 f0             	mov    -0x10(%ebp),%eax
 68a:	01 d0                	add    %edx,%eax
 68c:	0f b6 00             	movzbl (%eax),%eax
 68f:	0f be c0             	movsbl %al,%eax
 692:	25 ff 00 00 00       	and    $0xff,%eax
 697:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 69a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 69e:	75 2c                	jne    6cc <printf+0x6a>
      if(c == '%'){
 6a0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6a4:	75 0c                	jne    6b2 <printf+0x50>
        state = '%';
 6a6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6ad:	e9 4a 01 00 00       	jmp    7fc <printf+0x19a>
      } else {
        putc(fd, c);
 6b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b5:	0f be c0             	movsbl %al,%eax
 6b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	89 04 24             	mov    %eax,(%esp)
 6c2:	e8 bb fe ff ff       	call   582 <putc>
 6c7:	e9 30 01 00 00       	jmp    7fc <printf+0x19a>
      }
    } else if(state == '%'){
 6cc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6d0:	0f 85 26 01 00 00    	jne    7fc <printf+0x19a>
      if(c == 'd'){
 6d6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6da:	75 2d                	jne    709 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6df:	8b 00                	mov    (%eax),%eax
 6e1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6e8:	00 
 6e9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6f0:	00 
 6f1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	89 04 24             	mov    %eax,(%esp)
 6fb:	e8 aa fe ff ff       	call   5aa <printint>
        ap++;
 700:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 704:	e9 ec 00 00 00       	jmp    7f5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 709:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 70d:	74 06                	je     715 <printf+0xb3>
 70f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 713:	75 2d                	jne    742 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 715:	8b 45 e8             	mov    -0x18(%ebp),%eax
 718:	8b 00                	mov    (%eax),%eax
 71a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 721:	00 
 722:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 729:	00 
 72a:	89 44 24 04          	mov    %eax,0x4(%esp)
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	89 04 24             	mov    %eax,(%esp)
 734:	e8 71 fe ff ff       	call   5aa <printint>
        ap++;
 739:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 73d:	e9 b3 00 00 00       	jmp    7f5 <printf+0x193>
      } else if(c == 's'){
 742:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 746:	75 45                	jne    78d <printf+0x12b>
        s = (char*)*ap;
 748:	8b 45 e8             	mov    -0x18(%ebp),%eax
 74b:	8b 00                	mov    (%eax),%eax
 74d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 750:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 754:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 758:	75 09                	jne    763 <printf+0x101>
          s = "(null)";
 75a:	c7 45 f4 b2 0a 00 00 	movl   $0xab2,-0xc(%ebp)
        while(*s != 0){
 761:	eb 1e                	jmp    781 <printf+0x11f>
 763:	eb 1c                	jmp    781 <printf+0x11f>
          putc(fd, *s);
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	0f b6 00             	movzbl (%eax),%eax
 76b:	0f be c0             	movsbl %al,%eax
 76e:	89 44 24 04          	mov    %eax,0x4(%esp)
 772:	8b 45 08             	mov    0x8(%ebp),%eax
 775:	89 04 24             	mov    %eax,(%esp)
 778:	e8 05 fe ff ff       	call   582 <putc>
          s++;
 77d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 781:	8b 45 f4             	mov    -0xc(%ebp),%eax
 784:	0f b6 00             	movzbl (%eax),%eax
 787:	84 c0                	test   %al,%al
 789:	75 da                	jne    765 <printf+0x103>
 78b:	eb 68                	jmp    7f5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 78d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 791:	75 1d                	jne    7b0 <printf+0x14e>
        putc(fd, *ap);
 793:	8b 45 e8             	mov    -0x18(%ebp),%eax
 796:	8b 00                	mov    (%eax),%eax
 798:	0f be c0             	movsbl %al,%eax
 79b:	89 44 24 04          	mov    %eax,0x4(%esp)
 79f:	8b 45 08             	mov    0x8(%ebp),%eax
 7a2:	89 04 24             	mov    %eax,(%esp)
 7a5:	e8 d8 fd ff ff       	call   582 <putc>
        ap++;
 7aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ae:	eb 45                	jmp    7f5 <printf+0x193>
      } else if(c == '%'){
 7b0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7b4:	75 17                	jne    7cd <printf+0x16b>
        putc(fd, c);
 7b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b9:	0f be c0             	movsbl %al,%eax
 7bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c0:	8b 45 08             	mov    0x8(%ebp),%eax
 7c3:	89 04 24             	mov    %eax,(%esp)
 7c6:	e8 b7 fd ff ff       	call   582 <putc>
 7cb:	eb 28                	jmp    7f5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7cd:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7d4:	00 
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	89 04 24             	mov    %eax,(%esp)
 7db:	e8 a2 fd ff ff       	call   582 <putc>
        putc(fd, c);
 7e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7e3:	0f be c0             	movsbl %al,%eax
 7e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ea:	8b 45 08             	mov    0x8(%ebp),%eax
 7ed:	89 04 24             	mov    %eax,(%esp)
 7f0:	e8 8d fd ff ff       	call   582 <putc>
      }
      state = 0;
 7f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 800:	8b 55 0c             	mov    0xc(%ebp),%edx
 803:	8b 45 f0             	mov    -0x10(%ebp),%eax
 806:	01 d0                	add    %edx,%eax
 808:	0f b6 00             	movzbl (%eax),%eax
 80b:	84 c0                	test   %al,%al
 80d:	0f 85 71 fe ff ff    	jne    684 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 813:	c9                   	leave  
 814:	c3                   	ret    

00000815 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 815:	55                   	push   %ebp
 816:	89 e5                	mov    %esp,%ebp
 818:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 81b:	8b 45 08             	mov    0x8(%ebp),%eax
 81e:	83 e8 08             	sub    $0x8,%eax
 821:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 824:	a1 48 0d 00 00       	mov    0xd48,%eax
 829:	89 45 fc             	mov    %eax,-0x4(%ebp)
 82c:	eb 24                	jmp    852 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 831:	8b 00                	mov    (%eax),%eax
 833:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 836:	77 12                	ja     84a <free+0x35>
 838:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 83e:	77 24                	ja     864 <free+0x4f>
 840:	8b 45 fc             	mov    -0x4(%ebp),%eax
 843:	8b 00                	mov    (%eax),%eax
 845:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 848:	77 1a                	ja     864 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 84a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84d:	8b 00                	mov    (%eax),%eax
 84f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 852:	8b 45 f8             	mov    -0x8(%ebp),%eax
 855:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 858:	76 d4                	jbe    82e <free+0x19>
 85a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85d:	8b 00                	mov    (%eax),%eax
 85f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 862:	76 ca                	jbe    82e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 864:	8b 45 f8             	mov    -0x8(%ebp),%eax
 867:	8b 40 04             	mov    0x4(%eax),%eax
 86a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 871:	8b 45 f8             	mov    -0x8(%ebp),%eax
 874:	01 c2                	add    %eax,%edx
 876:	8b 45 fc             	mov    -0x4(%ebp),%eax
 879:	8b 00                	mov    (%eax),%eax
 87b:	39 c2                	cmp    %eax,%edx
 87d:	75 24                	jne    8a3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 87f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 882:	8b 50 04             	mov    0x4(%eax),%edx
 885:	8b 45 fc             	mov    -0x4(%ebp),%eax
 888:	8b 00                	mov    (%eax),%eax
 88a:	8b 40 04             	mov    0x4(%eax),%eax
 88d:	01 c2                	add    %eax,%edx
 88f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 892:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 895:	8b 45 fc             	mov    -0x4(%ebp),%eax
 898:	8b 00                	mov    (%eax),%eax
 89a:	8b 10                	mov    (%eax),%edx
 89c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89f:	89 10                	mov    %edx,(%eax)
 8a1:	eb 0a                	jmp    8ad <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a6:	8b 10                	mov    (%eax),%edx
 8a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ab:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b0:	8b 40 04             	mov    0x4(%eax),%eax
 8b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bd:	01 d0                	add    %edx,%eax
 8bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8c2:	75 20                	jne    8e4 <free+0xcf>
    p->s.size += bp->s.size;
 8c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c7:	8b 50 04             	mov    0x4(%eax),%edx
 8ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cd:	8b 40 04             	mov    0x4(%eax),%eax
 8d0:	01 c2                	add    %eax,%edx
 8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8db:	8b 10                	mov    (%eax),%edx
 8dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e0:	89 10                	mov    %edx,(%eax)
 8e2:	eb 08                	jmp    8ec <free+0xd7>
  } else
    p->s.ptr = bp;
 8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8ea:	89 10                	mov    %edx,(%eax)
  freep = p;
 8ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ef:	a3 48 0d 00 00       	mov    %eax,0xd48
}
 8f4:	c9                   	leave  
 8f5:	c3                   	ret    

000008f6 <morecore>:

static Header*
morecore(uint nu)
{
 8f6:	55                   	push   %ebp
 8f7:	89 e5                	mov    %esp,%ebp
 8f9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8fc:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 903:	77 07                	ja     90c <morecore+0x16>
    nu = 4096;
 905:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 90c:	8b 45 08             	mov    0x8(%ebp),%eax
 90f:	c1 e0 03             	shl    $0x3,%eax
 912:	89 04 24             	mov    %eax,(%esp)
 915:	e8 48 fc ff ff       	call   562 <sbrk>
 91a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 91d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 921:	75 07                	jne    92a <morecore+0x34>
    return 0;
 923:	b8 00 00 00 00       	mov    $0x0,%eax
 928:	eb 22                	jmp    94c <morecore+0x56>
  hp = (Header*)p;
 92a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 930:	8b 45 f0             	mov    -0x10(%ebp),%eax
 933:	8b 55 08             	mov    0x8(%ebp),%edx
 936:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 939:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93c:	83 c0 08             	add    $0x8,%eax
 93f:	89 04 24             	mov    %eax,(%esp)
 942:	e8 ce fe ff ff       	call   815 <free>
  return freep;
 947:	a1 48 0d 00 00       	mov    0xd48,%eax
}
 94c:	c9                   	leave  
 94d:	c3                   	ret    

0000094e <malloc>:

void*
malloc(uint nbytes)
{
 94e:	55                   	push   %ebp
 94f:	89 e5                	mov    %esp,%ebp
 951:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 954:	8b 45 08             	mov    0x8(%ebp),%eax
 957:	83 c0 07             	add    $0x7,%eax
 95a:	c1 e8 03             	shr    $0x3,%eax
 95d:	83 c0 01             	add    $0x1,%eax
 960:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 963:	a1 48 0d 00 00       	mov    0xd48,%eax
 968:	89 45 f0             	mov    %eax,-0x10(%ebp)
 96b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 96f:	75 23                	jne    994 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 971:	c7 45 f0 40 0d 00 00 	movl   $0xd40,-0x10(%ebp)
 978:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97b:	a3 48 0d 00 00       	mov    %eax,0xd48
 980:	a1 48 0d 00 00       	mov    0xd48,%eax
 985:	a3 40 0d 00 00       	mov    %eax,0xd40
    base.s.size = 0;
 98a:	c7 05 44 0d 00 00 00 	movl   $0x0,0xd44
 991:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 994:	8b 45 f0             	mov    -0x10(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 99c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99f:	8b 40 04             	mov    0x4(%eax),%eax
 9a2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9a5:	72 4d                	jb     9f4 <malloc+0xa6>
      if(p->s.size == nunits)
 9a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9aa:	8b 40 04             	mov    0x4(%eax),%eax
 9ad:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9b0:	75 0c                	jne    9be <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b5:	8b 10                	mov    (%eax),%edx
 9b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ba:	89 10                	mov    %edx,(%eax)
 9bc:	eb 26                	jmp    9e4 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c1:	8b 40 04             	mov    0x4(%eax),%eax
 9c4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9c7:	89 c2                	mov    %eax,%edx
 9c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d2:	8b 40 04             	mov    0x4(%eax),%eax
 9d5:	c1 e0 03             	shl    $0x3,%eax
 9d8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9de:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9e1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e7:	a3 48 0d 00 00       	mov    %eax,0xd48
      return (void*)(p + 1);
 9ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ef:	83 c0 08             	add    $0x8,%eax
 9f2:	eb 38                	jmp    a2c <malloc+0xde>
    }
    if(p == freep)
 9f4:	a1 48 0d 00 00       	mov    0xd48,%eax
 9f9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9fc:	75 1b                	jne    a19 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a01:	89 04 24             	mov    %eax,(%esp)
 a04:	e8 ed fe ff ff       	call   8f6 <morecore>
 a09:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a10:	75 07                	jne    a19 <malloc+0xcb>
        return 0;
 a12:	b8 00 00 00 00       	mov    $0x0,%eax
 a17:	eb 13                	jmp    a2c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a22:	8b 00                	mov    (%eax),%eax
 a24:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a27:	e9 70 ff ff ff       	jmp    99c <malloc+0x4e>
}
 a2c:	c9                   	leave  
 a2d:	c3                   	ret    
