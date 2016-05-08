
_cp:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

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
    //write(1, buf, n);
    printf(fd2, "%s", buf);
   8:	c7 44 24 08 00 0c 00 	movl   $0xc00,0x8(%esp)
   f:	00 
  10:	c7 44 24 04 10 09 00 	movl   $0x910,0x4(%esp)
  17:	00 
  18:	8b 45 0c             	mov    0xc(%ebp),%eax
  1b:	89 04 24             	mov    %eax,(%esp)
  1e:	e8 1e 05 00 00       	call   541 <printf>
void
cat(int fd1, int fd2)
{
  int n;

  while((n = read(fd1, buf, sizeof(buf))) > 0) {
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 00 0c 00 	movl   $0xc00,0x4(%esp)
  32:	00 
  33:	8b 45 08             	mov    0x8(%ebp),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 93 03 00 00       	call   3d1 <read>
  3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  45:	7f c1                	jg     8 <cat+0x8>
    //write(1, buf, n);
    printf(fd2, "%s", buf);
  }
  if(n < 0){
  47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  4b:	79 19                	jns    66 <cat+0x66>
    printf(1, "copy: read error\n");
  4d:	c7 44 24 04 13 09 00 	movl   $0x913,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 e0 04 00 00       	call   541 <printf>
    exit();
  61:	e8 53 03 00 00       	call   3b9 <exit>
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
  6b:	83 e4 f0             	and    $0xfffffff0,%esp
  6e:	83 ec 20             	sub    $0x20,%esp
  int fd1;
  if(argc < 3){
  71:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  75:	7f 19                	jg     90 <main+0x28>
    printf(1, "copy: read error\n");
  77:	c7 44 24 04 13 09 00 	movl   $0x913,0x4(%esp)
  7e:	00 
  7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  86:	e8 b6 04 00 00       	call   541 <printf>
    exit();
  8b:	e8 29 03 00 00       	call   3b9 <exit>
  }
  if((fd1 = open(argv[1], 0)) < 0){
  90:	8b 45 0c             	mov    0xc(%ebp),%eax
  93:	83 c0 04             	add    $0x4,%eax
  96:	8b 00                	mov    (%eax),%eax
  98:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  9f:	00 
  a0:	89 04 24             	mov    %eax,(%esp)
  a3:	e8 51 03 00 00       	call   3f9 <open>
  a8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  ac:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  b1:	79 25                	jns    d8 <main+0x70>
    printf(1, "copy: cannot open %s\n", argv[1]);
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	83 c0 04             	add    $0x4,%eax
  b9:	8b 00                	mov    (%eax),%eax
  bb:	89 44 24 08          	mov    %eax,0x8(%esp)
  bf:	c7 44 24 04 25 09 00 	movl   $0x925,0x4(%esp)
  c6:	00 
  c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ce:	e8 6e 04 00 00       	call   541 <printf>
    exit();
  d3:	e8 e1 02 00 00       	call   3b9 <exit>
  }
  int fd2;
  
  if ((fd2 = open(argv[2], O_CREATE | O_RDWR)) < 0) {
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	83 c0 08             	add    $0x8,%eax
  de:	8b 00                	mov    (%eax),%eax
  e0:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  e7:	00 
  e8:	89 04 24             	mov    %eax,(%esp)
  eb:	e8 09 03 00 00       	call   3f9 <open>
  f0:	89 44 24 18          	mov    %eax,0x18(%esp)
  f4:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  f9:	79 25                	jns    120 <main+0xb8>
    printf(1, "copy: error initializing file: %s\n", argv[2]);
  fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  fe:	83 c0 08             	add    $0x8,%eax
 101:	8b 00                	mov    (%eax),%eax
 103:	89 44 24 08          	mov    %eax,0x8(%esp)
 107:	c7 44 24 04 3c 09 00 	movl   $0x93c,0x4(%esp)
 10e:	00 
 10f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 116:	e8 26 04 00 00       	call   541 <printf>
    exit();
 11b:	e8 99 02 00 00       	call   3b9 <exit>
  }
  cat(fd1,fd2);
 120:	8b 44 24 18          	mov    0x18(%esp),%eax
 124:	89 44 24 04          	mov    %eax,0x4(%esp)
 128:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12c:	89 04 24             	mov    %eax,(%esp)
 12f:	e8 cc fe ff ff       	call   0 <cat>
  close(fd1);
 134:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 138:	89 04 24             	mov    %eax,(%esp)
 13b:	e8 a1 02 00 00       	call   3e1 <close>
  close(fd2);
 140:	8b 44 24 18          	mov    0x18(%esp),%eax
 144:	89 04 24             	mov    %eax,(%esp)
 147:	e8 95 02 00 00       	call   3e1 <close>
  exit();
 14c:	e8 68 02 00 00       	call   3b9 <exit>

00000151 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	57                   	push   %edi
 155:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 156:	8b 4d 08             	mov    0x8(%ebp),%ecx
 159:	8b 55 10             	mov    0x10(%ebp),%edx
 15c:	8b 45 0c             	mov    0xc(%ebp),%eax
 15f:	89 cb                	mov    %ecx,%ebx
 161:	89 df                	mov    %ebx,%edi
 163:	89 d1                	mov    %edx,%ecx
 165:	fc                   	cld    
 166:	f3 aa                	rep stos %al,%es:(%edi)
 168:	89 ca                	mov    %ecx,%edx
 16a:	89 fb                	mov    %edi,%ebx
 16c:	89 5d 08             	mov    %ebx,0x8(%ebp)
 16f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 172:	5b                   	pop    %ebx
 173:	5f                   	pop    %edi
 174:	5d                   	pop    %ebp
 175:	c3                   	ret    

00000176 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 176:	55                   	push   %ebp
 177:	89 e5                	mov    %esp,%ebp
 179:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 182:	90                   	nop
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	8d 50 01             	lea    0x1(%eax),%edx
 189:	89 55 08             	mov    %edx,0x8(%ebp)
 18c:	8b 55 0c             	mov    0xc(%ebp),%edx
 18f:	8d 4a 01             	lea    0x1(%edx),%ecx
 192:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 195:	0f b6 12             	movzbl (%edx),%edx
 198:	88 10                	mov    %dl,(%eax)
 19a:	0f b6 00             	movzbl (%eax),%eax
 19d:	84 c0                	test   %al,%al
 19f:	75 e2                	jne    183 <strcpy+0xd>
    ;
  return os;
 1a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    

000001a6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a6:	55                   	push   %ebp
 1a7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1a9:	eb 08                	jmp    1b3 <strcmp+0xd>
    p++, q++;
 1ab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1af:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	0f b6 00             	movzbl (%eax),%eax
 1b9:	84 c0                	test   %al,%al
 1bb:	74 10                	je     1cd <strcmp+0x27>
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
 1c0:	0f b6 10             	movzbl (%eax),%edx
 1c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c6:	0f b6 00             	movzbl (%eax),%eax
 1c9:	38 c2                	cmp    %al,%dl
 1cb:	74 de                	je     1ab <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1cd:	8b 45 08             	mov    0x8(%ebp),%eax
 1d0:	0f b6 00             	movzbl (%eax),%eax
 1d3:	0f b6 d0             	movzbl %al,%edx
 1d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d9:	0f b6 00             	movzbl (%eax),%eax
 1dc:	0f b6 c0             	movzbl %al,%eax
 1df:	29 c2                	sub    %eax,%edx
 1e1:	89 d0                	mov    %edx,%eax
}
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    

000001e5 <strlen>:

uint
strlen(char *s)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1f2:	eb 04                	jmp    1f8 <strlen+0x13>
 1f4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1f8:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	01 d0                	add    %edx,%eax
 200:	0f b6 00             	movzbl (%eax),%eax
 203:	84 c0                	test   %al,%al
 205:	75 ed                	jne    1f4 <strlen+0xf>
    ;
  return n;
 207:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20a:	c9                   	leave  
 20b:	c3                   	ret    

0000020c <memset>:

void*
memset(void *dst, int c, uint n)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 212:	8b 45 10             	mov    0x10(%ebp),%eax
 215:	89 44 24 08          	mov    %eax,0x8(%esp)
 219:	8b 45 0c             	mov    0xc(%ebp),%eax
 21c:	89 44 24 04          	mov    %eax,0x4(%esp)
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	89 04 24             	mov    %eax,(%esp)
 226:	e8 26 ff ff ff       	call   151 <stosb>
  return dst;
 22b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 22e:	c9                   	leave  
 22f:	c3                   	ret    

00000230 <strchr>:

char*
strchr(const char *s, char c)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	83 ec 04             	sub    $0x4,%esp
 236:	8b 45 0c             	mov    0xc(%ebp),%eax
 239:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 23c:	eb 14                	jmp    252 <strchr+0x22>
    if(*s == c)
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	3a 45 fc             	cmp    -0x4(%ebp),%al
 247:	75 05                	jne    24e <strchr+0x1e>
      return (char*)s;
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	eb 13                	jmp    261 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 24e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	0f b6 00             	movzbl (%eax),%eax
 258:	84 c0                	test   %al,%al
 25a:	75 e2                	jne    23e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 25c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 261:	c9                   	leave  
 262:	c3                   	ret    

00000263 <gets>:

char*
gets(char *buf, int max)
{
 263:	55                   	push   %ebp
 264:	89 e5                	mov    %esp,%ebp
 266:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 270:	eb 4c                	jmp    2be <gets+0x5b>
    cc = read(0, &c, 1);
 272:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 279:	00 
 27a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 27d:	89 44 24 04          	mov    %eax,0x4(%esp)
 281:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 288:	e8 44 01 00 00       	call   3d1 <read>
 28d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 290:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 294:	7f 02                	jg     298 <gets+0x35>
      break;
 296:	eb 31                	jmp    2c9 <gets+0x66>
    buf[i++] = c;
 298:	8b 45 f4             	mov    -0xc(%ebp),%eax
 29b:	8d 50 01             	lea    0x1(%eax),%edx
 29e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2a1:	89 c2                	mov    %eax,%edx
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	01 c2                	add    %eax,%edx
 2a8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2ac:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2ae:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2b2:	3c 0a                	cmp    $0xa,%al
 2b4:	74 13                	je     2c9 <gets+0x66>
 2b6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2ba:	3c 0d                	cmp    $0xd,%al
 2bc:	74 0b                	je     2c9 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c1:	83 c0 01             	add    $0x1,%eax
 2c4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2c7:	7c a9                	jl     272 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2cc:	8b 45 08             	mov    0x8(%ebp),%eax
 2cf:	01 d0                	add    %edx,%eax
 2d1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <stat>:

int
stat(char *n, struct stat *st)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2df:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2e6:	00 
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	89 04 24             	mov    %eax,(%esp)
 2ed:	e8 07 01 00 00       	call   3f9 <open>
 2f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2f9:	79 07                	jns    302 <stat+0x29>
    return -1;
 2fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 300:	eb 23                	jmp    325 <stat+0x4c>
  r = fstat(fd, st);
 302:	8b 45 0c             	mov    0xc(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	8b 45 f4             	mov    -0xc(%ebp),%eax
 30c:	89 04 24             	mov    %eax,(%esp)
 30f:	e8 fd 00 00 00       	call   411 <fstat>
 314:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 317:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31a:	89 04 24             	mov    %eax,(%esp)
 31d:	e8 bf 00 00 00       	call   3e1 <close>
  return r;
 322:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 325:	c9                   	leave  
 326:	c3                   	ret    

00000327 <atoi>:

int
atoi(const char *s)
{
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 32d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 334:	eb 25                	jmp    35b <atoi+0x34>
    n = n*10 + *s++ - '0';
 336:	8b 55 fc             	mov    -0x4(%ebp),%edx
 339:	89 d0                	mov    %edx,%eax
 33b:	c1 e0 02             	shl    $0x2,%eax
 33e:	01 d0                	add    %edx,%eax
 340:	01 c0                	add    %eax,%eax
 342:	89 c1                	mov    %eax,%ecx
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	8d 50 01             	lea    0x1(%eax),%edx
 34a:	89 55 08             	mov    %edx,0x8(%ebp)
 34d:	0f b6 00             	movzbl (%eax),%eax
 350:	0f be c0             	movsbl %al,%eax
 353:	01 c8                	add    %ecx,%eax
 355:	83 e8 30             	sub    $0x30,%eax
 358:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 35b:	8b 45 08             	mov    0x8(%ebp),%eax
 35e:	0f b6 00             	movzbl (%eax),%eax
 361:	3c 2f                	cmp    $0x2f,%al
 363:	7e 0a                	jle    36f <atoi+0x48>
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	0f b6 00             	movzbl (%eax),%eax
 36b:	3c 39                	cmp    $0x39,%al
 36d:	7e c7                	jle    336 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 36f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 372:	c9                   	leave  
 373:	c3                   	ret    

00000374 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 374:	55                   	push   %ebp
 375:	89 e5                	mov    %esp,%ebp
 377:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 37a:	8b 45 08             	mov    0x8(%ebp),%eax
 37d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 380:	8b 45 0c             	mov    0xc(%ebp),%eax
 383:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 386:	eb 17                	jmp    39f <memmove+0x2b>
    *dst++ = *src++;
 388:	8b 45 fc             	mov    -0x4(%ebp),%eax
 38b:	8d 50 01             	lea    0x1(%eax),%edx
 38e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 391:	8b 55 f8             	mov    -0x8(%ebp),%edx
 394:	8d 4a 01             	lea    0x1(%edx),%ecx
 397:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 39a:	0f b6 12             	movzbl (%edx),%edx
 39d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 39f:	8b 45 10             	mov    0x10(%ebp),%eax
 3a2:	8d 50 ff             	lea    -0x1(%eax),%edx
 3a5:	89 55 10             	mov    %edx,0x10(%ebp)
 3a8:	85 c0                	test   %eax,%eax
 3aa:	7f dc                	jg     388 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3ac:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3af:	c9                   	leave  
 3b0:	c3                   	ret    

000003b1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b1:	b8 01 00 00 00       	mov    $0x1,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <exit>:
SYSCALL(exit)
 3b9:	b8 02 00 00 00       	mov    $0x2,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <wait>:
SYSCALL(wait)
 3c1:	b8 03 00 00 00       	mov    $0x3,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <pipe>:
SYSCALL(pipe)
 3c9:	b8 04 00 00 00       	mov    $0x4,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <read>:
SYSCALL(read)
 3d1:	b8 05 00 00 00       	mov    $0x5,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <write>:
SYSCALL(write)
 3d9:	b8 10 00 00 00       	mov    $0x10,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <close>:
SYSCALL(close)
 3e1:	b8 15 00 00 00       	mov    $0x15,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <kill>:
SYSCALL(kill)
 3e9:	b8 06 00 00 00       	mov    $0x6,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <exec>:
SYSCALL(exec)
 3f1:	b8 07 00 00 00       	mov    $0x7,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <open>:
SYSCALL(open)
 3f9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <mknod>:
SYSCALL(mknod)
 401:	b8 11 00 00 00       	mov    $0x11,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <unlink>:
SYSCALL(unlink)
 409:	b8 12 00 00 00       	mov    $0x12,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <fstat>:
SYSCALL(fstat)
 411:	b8 08 00 00 00       	mov    $0x8,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <link>:
SYSCALL(link)
 419:	b8 13 00 00 00       	mov    $0x13,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <mkdir>:
SYSCALL(mkdir)
 421:	b8 14 00 00 00       	mov    $0x14,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <chdir>:
SYSCALL(chdir)
 429:	b8 09 00 00 00       	mov    $0x9,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <dup>:
SYSCALL(dup)
 431:	b8 0a 00 00 00       	mov    $0xa,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <getpid>:
SYSCALL(getpid)
 439:	b8 0b 00 00 00       	mov    $0xb,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <sbrk>:
SYSCALL(sbrk)
 441:	b8 0c 00 00 00       	mov    $0xc,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <sleep>:
SYSCALL(sleep)
 449:	b8 0d 00 00 00       	mov    $0xd,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <uptime>:
SYSCALL(uptime)
 451:	b8 0e 00 00 00       	mov    $0xe,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <getcwd>:
SYSCALL(getcwd)
 459:	b8 16 00 00 00       	mov    $0x16,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	83 ec 18             	sub    $0x18,%esp
 467:	8b 45 0c             	mov    0xc(%ebp),%eax
 46a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 46d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 474:	00 
 475:	8d 45 f4             	lea    -0xc(%ebp),%eax
 478:	89 44 24 04          	mov    %eax,0x4(%esp)
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	89 04 24             	mov    %eax,(%esp)
 482:	e8 52 ff ff ff       	call   3d9 <write>
}
 487:	c9                   	leave  
 488:	c3                   	ret    

00000489 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	56                   	push   %esi
 48d:	53                   	push   %ebx
 48e:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 491:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 498:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 49c:	74 17                	je     4b5 <printint+0x2c>
 49e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4a2:	79 11                	jns    4b5 <printint+0x2c>
    neg = 1;
 4a4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ae:	f7 d8                	neg    %eax
 4b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b3:	eb 06                	jmp    4bb <printint+0x32>
  } else {
    x = xx;
 4b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4bb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4c2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4c5:	8d 41 01             	lea    0x1(%ecx),%eax
 4c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4cb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d1:	ba 00 00 00 00       	mov    $0x0,%edx
 4d6:	f7 f3                	div    %ebx
 4d8:	89 d0                	mov    %edx,%eax
 4da:	0f b6 80 cc 0b 00 00 	movzbl 0xbcc(%eax),%eax
 4e1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4e5:	8b 75 10             	mov    0x10(%ebp),%esi
 4e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4eb:	ba 00 00 00 00       	mov    $0x0,%edx
 4f0:	f7 f6                	div    %esi
 4f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4f9:	75 c7                	jne    4c2 <printint+0x39>
  if(neg)
 4fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ff:	74 10                	je     511 <printint+0x88>
    buf[i++] = '-';
 501:	8b 45 f4             	mov    -0xc(%ebp),%eax
 504:	8d 50 01             	lea    0x1(%eax),%edx
 507:	89 55 f4             	mov    %edx,-0xc(%ebp)
 50a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 50f:	eb 1f                	jmp    530 <printint+0xa7>
 511:	eb 1d                	jmp    530 <printint+0xa7>
    putc(fd, buf[i]);
 513:	8d 55 dc             	lea    -0x24(%ebp),%edx
 516:	8b 45 f4             	mov    -0xc(%ebp),%eax
 519:	01 d0                	add    %edx,%eax
 51b:	0f b6 00             	movzbl (%eax),%eax
 51e:	0f be c0             	movsbl %al,%eax
 521:	89 44 24 04          	mov    %eax,0x4(%esp)
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	89 04 24             	mov    %eax,(%esp)
 52b:	e8 31 ff ff ff       	call   461 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 530:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 534:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 538:	79 d9                	jns    513 <printint+0x8a>
    putc(fd, buf[i]);
}
 53a:	83 c4 30             	add    $0x30,%esp
 53d:	5b                   	pop    %ebx
 53e:	5e                   	pop    %esi
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    

00000541 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 541:	55                   	push   %ebp
 542:	89 e5                	mov    %esp,%ebp
 544:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 547:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 54e:	8d 45 0c             	lea    0xc(%ebp),%eax
 551:	83 c0 04             	add    $0x4,%eax
 554:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 557:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 55e:	e9 7c 01 00 00       	jmp    6df <printf+0x19e>
    c = fmt[i] & 0xff;
 563:	8b 55 0c             	mov    0xc(%ebp),%edx
 566:	8b 45 f0             	mov    -0x10(%ebp),%eax
 569:	01 d0                	add    %edx,%eax
 56b:	0f b6 00             	movzbl (%eax),%eax
 56e:	0f be c0             	movsbl %al,%eax
 571:	25 ff 00 00 00       	and    $0xff,%eax
 576:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 579:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 57d:	75 2c                	jne    5ab <printf+0x6a>
      if(c == '%'){
 57f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 583:	75 0c                	jne    591 <printf+0x50>
        state = '%';
 585:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 58c:	e9 4a 01 00 00       	jmp    6db <printf+0x19a>
      } else {
        putc(fd, c);
 591:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 594:	0f be c0             	movsbl %al,%eax
 597:	89 44 24 04          	mov    %eax,0x4(%esp)
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	89 04 24             	mov    %eax,(%esp)
 5a1:	e8 bb fe ff ff       	call   461 <putc>
 5a6:	e9 30 01 00 00       	jmp    6db <printf+0x19a>
      }
    } else if(state == '%'){
 5ab:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5af:	0f 85 26 01 00 00    	jne    6db <printf+0x19a>
      if(c == 'd'){
 5b5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5b9:	75 2d                	jne    5e8 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5be:	8b 00                	mov    (%eax),%eax
 5c0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5c7:	00 
 5c8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5cf:	00 
 5d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	89 04 24             	mov    %eax,(%esp)
 5da:	e8 aa fe ff ff       	call   489 <printint>
        ap++;
 5df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e3:	e9 ec 00 00 00       	jmp    6d4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5e8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5ec:	74 06                	je     5f4 <printf+0xb3>
 5ee:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5f2:	75 2d                	jne    621 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f7:	8b 00                	mov    (%eax),%eax
 5f9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 600:	00 
 601:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 608:	00 
 609:	89 44 24 04          	mov    %eax,0x4(%esp)
 60d:	8b 45 08             	mov    0x8(%ebp),%eax
 610:	89 04 24             	mov    %eax,(%esp)
 613:	e8 71 fe ff ff       	call   489 <printint>
        ap++;
 618:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 61c:	e9 b3 00 00 00       	jmp    6d4 <printf+0x193>
      } else if(c == 's'){
 621:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 625:	75 45                	jne    66c <printf+0x12b>
        s = (char*)*ap;
 627:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62a:	8b 00                	mov    (%eax),%eax
 62c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 62f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 633:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 637:	75 09                	jne    642 <printf+0x101>
          s = "(null)";
 639:	c7 45 f4 5f 09 00 00 	movl   $0x95f,-0xc(%ebp)
        while(*s != 0){
 640:	eb 1e                	jmp    660 <printf+0x11f>
 642:	eb 1c                	jmp    660 <printf+0x11f>
          putc(fd, *s);
 644:	8b 45 f4             	mov    -0xc(%ebp),%eax
 647:	0f b6 00             	movzbl (%eax),%eax
 64a:	0f be c0             	movsbl %al,%eax
 64d:	89 44 24 04          	mov    %eax,0x4(%esp)
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	89 04 24             	mov    %eax,(%esp)
 657:	e8 05 fe ff ff       	call   461 <putc>
          s++;
 65c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 660:	8b 45 f4             	mov    -0xc(%ebp),%eax
 663:	0f b6 00             	movzbl (%eax),%eax
 666:	84 c0                	test   %al,%al
 668:	75 da                	jne    644 <printf+0x103>
 66a:	eb 68                	jmp    6d4 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 66c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 670:	75 1d                	jne    68f <printf+0x14e>
        putc(fd, *ap);
 672:	8b 45 e8             	mov    -0x18(%ebp),%eax
 675:	8b 00                	mov    (%eax),%eax
 677:	0f be c0             	movsbl %al,%eax
 67a:	89 44 24 04          	mov    %eax,0x4(%esp)
 67e:	8b 45 08             	mov    0x8(%ebp),%eax
 681:	89 04 24             	mov    %eax,(%esp)
 684:	e8 d8 fd ff ff       	call   461 <putc>
        ap++;
 689:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 68d:	eb 45                	jmp    6d4 <printf+0x193>
      } else if(c == '%'){
 68f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 693:	75 17                	jne    6ac <printf+0x16b>
        putc(fd, c);
 695:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 698:	0f be c0             	movsbl %al,%eax
 69b:	89 44 24 04          	mov    %eax,0x4(%esp)
 69f:	8b 45 08             	mov    0x8(%ebp),%eax
 6a2:	89 04 24             	mov    %eax,(%esp)
 6a5:	e8 b7 fd ff ff       	call   461 <putc>
 6aa:	eb 28                	jmp    6d4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ac:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6b3:	00 
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	89 04 24             	mov    %eax,(%esp)
 6ba:	e8 a2 fd ff ff       	call   461 <putc>
        putc(fd, c);
 6bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c2:	0f be c0             	movsbl %al,%eax
 6c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
 6cc:	89 04 24             	mov    %eax,(%esp)
 6cf:	e8 8d fd ff ff       	call   461 <putc>
      }
      state = 0;
 6d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6df:	8b 55 0c             	mov    0xc(%ebp),%edx
 6e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e5:	01 d0                	add    %edx,%eax
 6e7:	0f b6 00             	movzbl (%eax),%eax
 6ea:	84 c0                	test   %al,%al
 6ec:	0f 85 71 fe ff ff    	jne    563 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6f2:	c9                   	leave  
 6f3:	c3                   	ret    

000006f4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6f4:	55                   	push   %ebp
 6f5:	89 e5                	mov    %esp,%ebp
 6f7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	83 e8 08             	sub    $0x8,%eax
 700:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 703:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 708:	89 45 fc             	mov    %eax,-0x4(%ebp)
 70b:	eb 24                	jmp    731 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 00                	mov    (%eax),%eax
 712:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 715:	77 12                	ja     729 <free+0x35>
 717:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 71d:	77 24                	ja     743 <free+0x4f>
 71f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 722:	8b 00                	mov    (%eax),%eax
 724:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 727:	77 1a                	ja     743 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 729:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72c:	8b 00                	mov    (%eax),%eax
 72e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 731:	8b 45 f8             	mov    -0x8(%ebp),%eax
 734:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 737:	76 d4                	jbe    70d <free+0x19>
 739:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73c:	8b 00                	mov    (%eax),%eax
 73e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 741:	76 ca                	jbe    70d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 743:	8b 45 f8             	mov    -0x8(%ebp),%eax
 746:	8b 40 04             	mov    0x4(%eax),%eax
 749:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 750:	8b 45 f8             	mov    -0x8(%ebp),%eax
 753:	01 c2                	add    %eax,%edx
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	39 c2                	cmp    %eax,%edx
 75c:	75 24                	jne    782 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 75e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 761:	8b 50 04             	mov    0x4(%eax),%edx
 764:	8b 45 fc             	mov    -0x4(%ebp),%eax
 767:	8b 00                	mov    (%eax),%eax
 769:	8b 40 04             	mov    0x4(%eax),%eax
 76c:	01 c2                	add    %eax,%edx
 76e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 771:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 774:	8b 45 fc             	mov    -0x4(%ebp),%eax
 777:	8b 00                	mov    (%eax),%eax
 779:	8b 10                	mov    (%eax),%edx
 77b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77e:	89 10                	mov    %edx,(%eax)
 780:	eb 0a                	jmp    78c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 782:	8b 45 fc             	mov    -0x4(%ebp),%eax
 785:	8b 10                	mov    (%eax),%edx
 787:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 78c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78f:	8b 40 04             	mov    0x4(%eax),%eax
 792:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	01 d0                	add    %edx,%eax
 79e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a1:	75 20                	jne    7c3 <free+0xcf>
    p->s.size += bp->s.size;
 7a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a6:	8b 50 04             	mov    0x4(%eax),%edx
 7a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ac:	8b 40 04             	mov    0x4(%eax),%eax
 7af:	01 c2                	add    %eax,%edx
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ba:	8b 10                	mov    (%eax),%edx
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	89 10                	mov    %edx,(%eax)
 7c1:	eb 08                	jmp    7cb <free+0xd7>
  } else
    p->s.ptr = bp;
 7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7c9:	89 10                	mov    %edx,(%eax)
  freep = p;
 7cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ce:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 7d3:	c9                   	leave  
 7d4:	c3                   	ret    

000007d5 <morecore>:

static Header*
morecore(uint nu)
{
 7d5:	55                   	push   %ebp
 7d6:	89 e5                	mov    %esp,%ebp
 7d8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7db:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7e2:	77 07                	ja     7eb <morecore+0x16>
    nu = 4096;
 7e4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7eb:	8b 45 08             	mov    0x8(%ebp),%eax
 7ee:	c1 e0 03             	shl    $0x3,%eax
 7f1:	89 04 24             	mov    %eax,(%esp)
 7f4:	e8 48 fc ff ff       	call   441 <sbrk>
 7f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7fc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 800:	75 07                	jne    809 <morecore+0x34>
    return 0;
 802:	b8 00 00 00 00       	mov    $0x0,%eax
 807:	eb 22                	jmp    82b <morecore+0x56>
  hp = (Header*)p;
 809:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 80f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 812:	8b 55 08             	mov    0x8(%ebp),%edx
 815:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 818:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81b:	83 c0 08             	add    $0x8,%eax
 81e:	89 04 24             	mov    %eax,(%esp)
 821:	e8 ce fe ff ff       	call   6f4 <free>
  return freep;
 826:	a1 e8 0b 00 00       	mov    0xbe8,%eax
}
 82b:	c9                   	leave  
 82c:	c3                   	ret    

0000082d <malloc>:

void*
malloc(uint nbytes)
{
 82d:	55                   	push   %ebp
 82e:	89 e5                	mov    %esp,%ebp
 830:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 833:	8b 45 08             	mov    0x8(%ebp),%eax
 836:	83 c0 07             	add    $0x7,%eax
 839:	c1 e8 03             	shr    $0x3,%eax
 83c:	83 c0 01             	add    $0x1,%eax
 83f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 842:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 847:	89 45 f0             	mov    %eax,-0x10(%ebp)
 84a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 84e:	75 23                	jne    873 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 850:	c7 45 f0 e0 0b 00 00 	movl   $0xbe0,-0x10(%ebp)
 857:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85a:	a3 e8 0b 00 00       	mov    %eax,0xbe8
 85f:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 864:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    base.s.size = 0;
 869:	c7 05 e4 0b 00 00 00 	movl   $0x0,0xbe4
 870:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 873:	8b 45 f0             	mov    -0x10(%ebp),%eax
 876:	8b 00                	mov    (%eax),%eax
 878:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 87b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87e:	8b 40 04             	mov    0x4(%eax),%eax
 881:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 884:	72 4d                	jb     8d3 <malloc+0xa6>
      if(p->s.size == nunits)
 886:	8b 45 f4             	mov    -0xc(%ebp),%eax
 889:	8b 40 04             	mov    0x4(%eax),%eax
 88c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 88f:	75 0c                	jne    89d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 10                	mov    (%eax),%edx
 896:	8b 45 f0             	mov    -0x10(%ebp),%eax
 899:	89 10                	mov    %edx,(%eax)
 89b:	eb 26                	jmp    8c3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 89d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a0:	8b 40 04             	mov    0x4(%eax),%eax
 8a3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8a6:	89 c2                	mov    %eax,%edx
 8a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ab:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	8b 40 04             	mov    0x4(%eax),%eax
 8b4:	c1 e0 03             	shl    $0x3,%eax
 8b7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bd:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8c0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c6:	a3 e8 0b 00 00       	mov    %eax,0xbe8
      return (void*)(p + 1);
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	83 c0 08             	add    $0x8,%eax
 8d1:	eb 38                	jmp    90b <malloc+0xde>
    }
    if(p == freep)
 8d3:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 8d8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8db:	75 1b                	jne    8f8 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e0:	89 04 24             	mov    %eax,(%esp)
 8e3:	e8 ed fe ff ff       	call   7d5 <morecore>
 8e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8eb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8ef:	75 07                	jne    8f8 <malloc+0xcb>
        return 0;
 8f1:	b8 00 00 00 00       	mov    $0x0,%eax
 8f6:	eb 13                	jmp    90b <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 901:	8b 00                	mov    (%eax),%eax
 903:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 906:	e9 70 ff ff ff       	jmp    87b <malloc+0x4e>
}
 90b:	c9                   	leave  
 90c:	c3                   	ret    
