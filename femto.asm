
_femto:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd,char* filename)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;
  int fp;
  
  if ((fp = open(filename, O_CREATE | O_RDWR)) < 0) {
   6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
   d:	00 
   e:	8b 45 0c             	mov    0xc(%ebp),%eax
  11:	89 04 24             	mov    %eax,(%esp)
  14:	e8 89 03 00 00       	call   3a2 <open>
  19:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  20:	79 20                	jns    42 <cat+0x42>
    printf(1, "counter_init: error initializing file: %s\n", filename);
  22:	8b 45 0c             	mov    0xc(%ebp),%eax
  25:	89 44 24 08          	mov    %eax,0x8(%esp)
  29:	c7 44 24 04 b8 08 00 	movl   $0x8b8,0x4(%esp)
  30:	00 
  31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  38:	e8 ad 04 00 00       	call   4ea <printf>
    exit();
  3d:	e8 20 03 00 00       	call   362 <exit>
  }

  while((n = read(fd, buf, sizeof(buf))) > 0){
  42:	eb 1b                	jmp    5f <cat+0x5f>
    // write(1, buf, n);
    printf(fp, "%s", buf);
  44:	c7 44 24 08 c0 0b 00 	movl   $0xbc0,0x8(%esp)
  4b:	00 
  4c:	c7 44 24 04 e3 08 00 	movl   $0x8e3,0x4(%esp)
  53:	00 
  54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  57:	89 04 24             	mov    %eax,(%esp)
  5a:	e8 8b 04 00 00       	call   4ea <printf>
  if ((fp = open(filename, O_CREATE | O_RDWR)) < 0) {
    printf(1, "counter_init: error initializing file: %s\n", filename);
    exit();
  }

  while((n = read(fd, buf, sizeof(buf))) > 0){
  5f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  66:	00 
  67:	c7 44 24 04 c0 0b 00 	movl   $0xbc0,0x4(%esp)
  6e:	00 
  6f:	8b 45 08             	mov    0x8(%ebp),%eax
  72:	89 04 24             	mov    %eax,(%esp)
  75:	e8 00 03 00 00       	call   37a <read>
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  7d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  81:	7f c1                	jg     44 <cat+0x44>
    // write(1, buf, n);
    printf(fp, "%s", buf);
  }
  close(fp);
  83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  86:	89 04 24             	mov    %eax,(%esp)
  89:	e8 fc 02 00 00       	call   38a <close>
  if(n < 0){
  8e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  92:	79 19                	jns    ad <cat+0xad>
    printf(1, "cat: read error\n");
  94:	c7 44 24 04 e6 08 00 	movl   $0x8e6,0x4(%esp)
  9b:	00 
  9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a3:	e8 42 04 00 00       	call   4ea <printf>
    exit();
  a8:	e8 b5 02 00 00       	call   362 <exit>
  }
}
  ad:	c9                   	leave  
  ae:	c3                   	ret    

000000af <main>:

int
main(int argc, char *argv[])
{
  af:	55                   	push   %ebp
  b0:	89 e5                	mov    %esp,%ebp
  b2:	83 e4 f0             	and    $0xfffffff0,%esp
  b5:	83 ec 20             	sub    $0x20,%esp

  if(argc <= 2){
  b8:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  bc:	7f 37                	jg     f5 <main+0x46>
    char* filename = "default.txt";
  be:	c7 44 24 1c f7 08 00 	movl   $0x8f7,0x1c(%esp)
  c5:	00 
    if(argv[1])
  c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  c9:	83 c0 04             	add    $0x4,%eax
  cc:	8b 00                	mov    (%eax),%eax
  ce:	85 c0                	test   %eax,%eax
  d0:	74 0a                	je     dc <main+0x2d>
      filename = argv[1]; 
  d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  d5:	8b 40 04             	mov    0x4(%eax),%eax
  d8:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    cat(0,filename);
  dc:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  eb:	e8 10 ff ff ff       	call   0 <cat>
    exit();
  f0:	e8 6d 02 00 00       	call   362 <exit>
  }
  exit();
  f5:	e8 68 02 00 00       	call   362 <exit>

000000fa <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	57                   	push   %edi
  fe:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
 102:	8b 55 10             	mov    0x10(%ebp),%edx
 105:	8b 45 0c             	mov    0xc(%ebp),%eax
 108:	89 cb                	mov    %ecx,%ebx
 10a:	89 df                	mov    %ebx,%edi
 10c:	89 d1                	mov    %edx,%ecx
 10e:	fc                   	cld    
 10f:	f3 aa                	rep stos %al,%es:(%edi)
 111:	89 ca                	mov    %ecx,%edx
 113:	89 fb                	mov    %edi,%ebx
 115:	89 5d 08             	mov    %ebx,0x8(%ebp)
 118:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 11b:	5b                   	pop    %ebx
 11c:	5f                   	pop    %edi
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    

0000011f <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 11f:	55                   	push   %ebp
 120:	89 e5                	mov    %esp,%ebp
 122:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 12b:	90                   	nop
 12c:	8b 45 08             	mov    0x8(%ebp),%eax
 12f:	8d 50 01             	lea    0x1(%eax),%edx
 132:	89 55 08             	mov    %edx,0x8(%ebp)
 135:	8b 55 0c             	mov    0xc(%ebp),%edx
 138:	8d 4a 01             	lea    0x1(%edx),%ecx
 13b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 13e:	0f b6 12             	movzbl (%edx),%edx
 141:	88 10                	mov    %dl,(%eax)
 143:	0f b6 00             	movzbl (%eax),%eax
 146:	84 c0                	test   %al,%al
 148:	75 e2                	jne    12c <strcpy+0xd>
    ;
  return os;
 14a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    

0000014f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 152:	eb 08                	jmp    15c <strcmp+0xd>
    p++, q++;
 154:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 158:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 15c:	8b 45 08             	mov    0x8(%ebp),%eax
 15f:	0f b6 00             	movzbl (%eax),%eax
 162:	84 c0                	test   %al,%al
 164:	74 10                	je     176 <strcmp+0x27>
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 10             	movzbl (%eax),%edx
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	38 c2                	cmp    %al,%dl
 174:	74 de                	je     154 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	0f b6 d0             	movzbl %al,%edx
 17f:	8b 45 0c             	mov    0xc(%ebp),%eax
 182:	0f b6 00             	movzbl (%eax),%eax
 185:	0f b6 c0             	movzbl %al,%eax
 188:	29 c2                	sub    %eax,%edx
 18a:	89 d0                	mov    %edx,%eax
}
 18c:	5d                   	pop    %ebp
 18d:	c3                   	ret    

0000018e <strlen>:

uint
strlen(char *s)
{
 18e:	55                   	push   %ebp
 18f:	89 e5                	mov    %esp,%ebp
 191:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 194:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 19b:	eb 04                	jmp    1a1 <strlen+0x13>
 19d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1a1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	01 d0                	add    %edx,%eax
 1a9:	0f b6 00             	movzbl (%eax),%eax
 1ac:	84 c0                	test   %al,%al
 1ae:	75 ed                	jne    19d <strlen+0xf>
    ;
  return n;
 1b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1b3:	c9                   	leave  
 1b4:	c3                   	ret    

000001b5 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b5:	55                   	push   %ebp
 1b6:	89 e5                	mov    %esp,%ebp
 1b8:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1bb:	8b 45 10             	mov    0x10(%ebp),%eax
 1be:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c9:	8b 45 08             	mov    0x8(%ebp),%eax
 1cc:	89 04 24             	mov    %eax,(%esp)
 1cf:	e8 26 ff ff ff       	call   fa <stosb>
  return dst;
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1d7:	c9                   	leave  
 1d8:	c3                   	ret    

000001d9 <strchr>:

char*
strchr(const char *s, char c)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	83 ec 04             	sub    $0x4,%esp
 1df:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e2:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1e5:	eb 14                	jmp    1fb <strchr+0x22>
    if(*s == c)
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1f0:	75 05                	jne    1f7 <strchr+0x1e>
      return (char*)s;
 1f2:	8b 45 08             	mov    0x8(%ebp),%eax
 1f5:	eb 13                	jmp    20a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1f7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	0f b6 00             	movzbl (%eax),%eax
 201:	84 c0                	test   %al,%al
 203:	75 e2                	jne    1e7 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 205:	b8 00 00 00 00       	mov    $0x0,%eax
}
 20a:	c9                   	leave  
 20b:	c3                   	ret    

0000020c <gets>:

char*
gets(char *buf, int max)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 212:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 219:	eb 4c                	jmp    267 <gets+0x5b>
    cc = read(0, &c, 1);
 21b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 222:	00 
 223:	8d 45 ef             	lea    -0x11(%ebp),%eax
 226:	89 44 24 04          	mov    %eax,0x4(%esp)
 22a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 231:	e8 44 01 00 00       	call   37a <read>
 236:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 239:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 23d:	7f 02                	jg     241 <gets+0x35>
      break;
 23f:	eb 31                	jmp    272 <gets+0x66>
    buf[i++] = c;
 241:	8b 45 f4             	mov    -0xc(%ebp),%eax
 244:	8d 50 01             	lea    0x1(%eax),%edx
 247:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24a:	89 c2                	mov    %eax,%edx
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	01 c2                	add    %eax,%edx
 251:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 255:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 257:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25b:	3c 0a                	cmp    $0xa,%al
 25d:	74 13                	je     272 <gets+0x66>
 25f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 263:	3c 0d                	cmp    $0xd,%al
 265:	74 0b                	je     272 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 267:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26a:	83 c0 01             	add    $0x1,%eax
 26d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 270:	7c a9                	jl     21b <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 272:	8b 55 f4             	mov    -0xc(%ebp),%edx
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	01 d0                	add    %edx,%eax
 27a:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 280:	c9                   	leave  
 281:	c3                   	ret    

00000282 <stat>:

int
stat(char *n, struct stat *st)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 288:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 28f:	00 
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 04 24             	mov    %eax,(%esp)
 296:	e8 07 01 00 00       	call   3a2 <open>
 29b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 29e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a2:	79 07                	jns    2ab <stat+0x29>
    return -1;
 2a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a9:	eb 23                	jmp    2ce <stat+0x4c>
  r = fstat(fd, st);
 2ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b5:	89 04 24             	mov    %eax,(%esp)
 2b8:	e8 fd 00 00 00       	call   3ba <fstat>
 2bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c3:	89 04 24             	mov    %eax,(%esp)
 2c6:	e8 bf 00 00 00       	call   38a <close>
  return r;
 2cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2ce:	c9                   	leave  
 2cf:	c3                   	ret    

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2d6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2dd:	eb 25                	jmp    304 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2df:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e2:	89 d0                	mov    %edx,%eax
 2e4:	c1 e0 02             	shl    $0x2,%eax
 2e7:	01 d0                	add    %edx,%eax
 2e9:	01 c0                	add    %eax,%eax
 2eb:	89 c1                	mov    %eax,%ecx
 2ed:	8b 45 08             	mov    0x8(%ebp),%eax
 2f0:	8d 50 01             	lea    0x1(%eax),%edx
 2f3:	89 55 08             	mov    %edx,0x8(%ebp)
 2f6:	0f b6 00             	movzbl (%eax),%eax
 2f9:	0f be c0             	movsbl %al,%eax
 2fc:	01 c8                	add    %ecx,%eax
 2fe:	83 e8 30             	sub    $0x30,%eax
 301:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	0f b6 00             	movzbl (%eax),%eax
 30a:	3c 2f                	cmp    $0x2f,%al
 30c:	7e 0a                	jle    318 <atoi+0x48>
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	0f b6 00             	movzbl (%eax),%eax
 314:	3c 39                	cmp    $0x39,%al
 316:	7e c7                	jle    2df <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 318:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31b:	c9                   	leave  
 31c:	c3                   	ret    

0000031d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 31d:	55                   	push   %ebp
 31e:	89 e5                	mov    %esp,%ebp
 320:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 329:	8b 45 0c             	mov    0xc(%ebp),%eax
 32c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 32f:	eb 17                	jmp    348 <memmove+0x2b>
    *dst++ = *src++;
 331:	8b 45 fc             	mov    -0x4(%ebp),%eax
 334:	8d 50 01             	lea    0x1(%eax),%edx
 337:	89 55 fc             	mov    %edx,-0x4(%ebp)
 33a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 33d:	8d 4a 01             	lea    0x1(%edx),%ecx
 340:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 343:	0f b6 12             	movzbl (%edx),%edx
 346:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 348:	8b 45 10             	mov    0x10(%ebp),%eax
 34b:	8d 50 ff             	lea    -0x1(%eax),%edx
 34e:	89 55 10             	mov    %edx,0x10(%ebp)
 351:	85 c0                	test   %eax,%eax
 353:	7f dc                	jg     331 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 355:	8b 45 08             	mov    0x8(%ebp),%eax
}
 358:	c9                   	leave  
 359:	c3                   	ret    

0000035a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35a:	b8 01 00 00 00       	mov    $0x1,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <exit>:
SYSCALL(exit)
 362:	b8 02 00 00 00       	mov    $0x2,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <wait>:
SYSCALL(wait)
 36a:	b8 03 00 00 00       	mov    $0x3,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <pipe>:
SYSCALL(pipe)
 372:	b8 04 00 00 00       	mov    $0x4,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <read>:
SYSCALL(read)
 37a:	b8 05 00 00 00       	mov    $0x5,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <write>:
SYSCALL(write)
 382:	b8 10 00 00 00       	mov    $0x10,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <close>:
SYSCALL(close)
 38a:	b8 15 00 00 00       	mov    $0x15,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <kill>:
SYSCALL(kill)
 392:	b8 06 00 00 00       	mov    $0x6,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exec>:
SYSCALL(exec)
 39a:	b8 07 00 00 00       	mov    $0x7,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <open>:
SYSCALL(open)
 3a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <mknod>:
SYSCALL(mknod)
 3aa:	b8 11 00 00 00       	mov    $0x11,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <unlink>:
SYSCALL(unlink)
 3b2:	b8 12 00 00 00       	mov    $0x12,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <fstat>:
SYSCALL(fstat)
 3ba:	b8 08 00 00 00       	mov    $0x8,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <link>:
SYSCALL(link)
 3c2:	b8 13 00 00 00       	mov    $0x13,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <mkdir>:
SYSCALL(mkdir)
 3ca:	b8 14 00 00 00       	mov    $0x14,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <chdir>:
SYSCALL(chdir)
 3d2:	b8 09 00 00 00       	mov    $0x9,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <dup>:
SYSCALL(dup)
 3da:	b8 0a 00 00 00       	mov    $0xa,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <getpid>:
SYSCALL(getpid)
 3e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <sbrk>:
SYSCALL(sbrk)
 3ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <sleep>:
SYSCALL(sleep)
 3f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <uptime>:
SYSCALL(uptime)
 3fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <getcwd>:
SYSCALL(getcwd)
 402:	b8 16 00 00 00       	mov    $0x16,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	83 ec 18             	sub    $0x18,%esp
 410:	8b 45 0c             	mov    0xc(%ebp),%eax
 413:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 416:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 41d:	00 
 41e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 421:	89 44 24 04          	mov    %eax,0x4(%esp)
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	89 04 24             	mov    %eax,(%esp)
 42b:	e8 52 ff ff ff       	call   382 <write>
}
 430:	c9                   	leave  
 431:	c3                   	ret    

00000432 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	56                   	push   %esi
 436:	53                   	push   %ebx
 437:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 43a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 441:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 445:	74 17                	je     45e <printint+0x2c>
 447:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 44b:	79 11                	jns    45e <printint+0x2c>
    neg = 1;
 44d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 454:	8b 45 0c             	mov    0xc(%ebp),%eax
 457:	f7 d8                	neg    %eax
 459:	89 45 ec             	mov    %eax,-0x14(%ebp)
 45c:	eb 06                	jmp    464 <printint+0x32>
  } else {
    x = xx;
 45e:	8b 45 0c             	mov    0xc(%ebp),%eax
 461:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 464:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 46b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 46e:	8d 41 01             	lea    0x1(%ecx),%eax
 471:	89 45 f4             	mov    %eax,-0xc(%ebp)
 474:	8b 5d 10             	mov    0x10(%ebp),%ebx
 477:	8b 45 ec             	mov    -0x14(%ebp),%eax
 47a:	ba 00 00 00 00       	mov    $0x0,%edx
 47f:	f7 f3                	div    %ebx
 481:	89 d0                	mov    %edx,%eax
 483:	0f b6 80 70 0b 00 00 	movzbl 0xb70(%eax),%eax
 48a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 48e:	8b 75 10             	mov    0x10(%ebp),%esi
 491:	8b 45 ec             	mov    -0x14(%ebp),%eax
 494:	ba 00 00 00 00       	mov    $0x0,%edx
 499:	f7 f6                	div    %esi
 49b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a2:	75 c7                	jne    46b <printint+0x39>
  if(neg)
 4a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a8:	74 10                	je     4ba <printint+0x88>
    buf[i++] = '-';
 4aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ad:	8d 50 01             	lea    0x1(%eax),%edx
 4b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4b8:	eb 1f                	jmp    4d9 <printint+0xa7>
 4ba:	eb 1d                	jmp    4d9 <printint+0xa7>
    putc(fd, buf[i]);
 4bc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c2:	01 d0                	add    %edx,%eax
 4c4:	0f b6 00             	movzbl (%eax),%eax
 4c7:	0f be c0             	movsbl %al,%eax
 4ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ce:	8b 45 08             	mov    0x8(%ebp),%eax
 4d1:	89 04 24             	mov    %eax,(%esp)
 4d4:	e8 31 ff ff ff       	call   40a <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4d9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4e1:	79 d9                	jns    4bc <printint+0x8a>
    putc(fd, buf[i]);
}
 4e3:	83 c4 30             	add    $0x30,%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5d                   	pop    %ebp
 4e9:	c3                   	ret    

000004ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4f7:	8d 45 0c             	lea    0xc(%ebp),%eax
 4fa:	83 c0 04             	add    $0x4,%eax
 4fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 500:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 507:	e9 7c 01 00 00       	jmp    688 <printf+0x19e>
    c = fmt[i] & 0xff;
 50c:	8b 55 0c             	mov    0xc(%ebp),%edx
 50f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 512:	01 d0                	add    %edx,%eax
 514:	0f b6 00             	movzbl (%eax),%eax
 517:	0f be c0             	movsbl %al,%eax
 51a:	25 ff 00 00 00       	and    $0xff,%eax
 51f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 522:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 526:	75 2c                	jne    554 <printf+0x6a>
      if(c == '%'){
 528:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 52c:	75 0c                	jne    53a <printf+0x50>
        state = '%';
 52e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 535:	e9 4a 01 00 00       	jmp    684 <printf+0x19a>
      } else {
        putc(fd, c);
 53a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 53d:	0f be c0             	movsbl %al,%eax
 540:	89 44 24 04          	mov    %eax,0x4(%esp)
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	89 04 24             	mov    %eax,(%esp)
 54a:	e8 bb fe ff ff       	call   40a <putc>
 54f:	e9 30 01 00 00       	jmp    684 <printf+0x19a>
      }
    } else if(state == '%'){
 554:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 558:	0f 85 26 01 00 00    	jne    684 <printf+0x19a>
      if(c == 'd'){
 55e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 562:	75 2d                	jne    591 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 564:	8b 45 e8             	mov    -0x18(%ebp),%eax
 567:	8b 00                	mov    (%eax),%eax
 569:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 570:	00 
 571:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 578:	00 
 579:	89 44 24 04          	mov    %eax,0x4(%esp)
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	89 04 24             	mov    %eax,(%esp)
 583:	e8 aa fe ff ff       	call   432 <printint>
        ap++;
 588:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 58c:	e9 ec 00 00 00       	jmp    67d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 591:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 595:	74 06                	je     59d <printf+0xb3>
 597:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 59b:	75 2d                	jne    5ca <printf+0xe0>
        printint(fd, *ap, 16, 0);
 59d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a0:	8b 00                	mov    (%eax),%eax
 5a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5a9:	00 
 5aa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5b1:	00 
 5b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
 5b9:	89 04 24             	mov    %eax,(%esp)
 5bc:	e8 71 fe ff ff       	call   432 <printint>
        ap++;
 5c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c5:	e9 b3 00 00 00       	jmp    67d <printf+0x193>
      } else if(c == 's'){
 5ca:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5ce:	75 45                	jne    615 <printf+0x12b>
        s = (char*)*ap;
 5d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d3:	8b 00                	mov    (%eax),%eax
 5d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5d8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e0:	75 09                	jne    5eb <printf+0x101>
          s = "(null)";
 5e2:	c7 45 f4 03 09 00 00 	movl   $0x903,-0xc(%ebp)
        while(*s != 0){
 5e9:	eb 1e                	jmp    609 <printf+0x11f>
 5eb:	eb 1c                	jmp    609 <printf+0x11f>
          putc(fd, *s);
 5ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f0:	0f b6 00             	movzbl (%eax),%eax
 5f3:	0f be c0             	movsbl %al,%eax
 5f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 05 fe ff ff       	call   40a <putc>
          s++;
 605:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 609:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60c:	0f b6 00             	movzbl (%eax),%eax
 60f:	84 c0                	test   %al,%al
 611:	75 da                	jne    5ed <printf+0x103>
 613:	eb 68                	jmp    67d <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 615:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 619:	75 1d                	jne    638 <printf+0x14e>
        putc(fd, *ap);
 61b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	0f be c0             	movsbl %al,%eax
 623:	89 44 24 04          	mov    %eax,0x4(%esp)
 627:	8b 45 08             	mov    0x8(%ebp),%eax
 62a:	89 04 24             	mov    %eax,(%esp)
 62d:	e8 d8 fd ff ff       	call   40a <putc>
        ap++;
 632:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 636:	eb 45                	jmp    67d <printf+0x193>
      } else if(c == '%'){
 638:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 63c:	75 17                	jne    655 <printf+0x16b>
        putc(fd, c);
 63e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 641:	0f be c0             	movsbl %al,%eax
 644:	89 44 24 04          	mov    %eax,0x4(%esp)
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	89 04 24             	mov    %eax,(%esp)
 64e:	e8 b7 fd ff ff       	call   40a <putc>
 653:	eb 28                	jmp    67d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 655:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 65c:	00 
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	89 04 24             	mov    %eax,(%esp)
 663:	e8 a2 fd ff ff       	call   40a <putc>
        putc(fd, c);
 668:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66b:	0f be c0             	movsbl %al,%eax
 66e:	89 44 24 04          	mov    %eax,0x4(%esp)
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	89 04 24             	mov    %eax,(%esp)
 678:	e8 8d fd ff ff       	call   40a <putc>
      }
      state = 0;
 67d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 684:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 688:	8b 55 0c             	mov    0xc(%ebp),%edx
 68b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 68e:	01 d0                	add    %edx,%eax
 690:	0f b6 00             	movzbl (%eax),%eax
 693:	84 c0                	test   %al,%al
 695:	0f 85 71 fe ff ff    	jne    50c <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 69b:	c9                   	leave  
 69c:	c3                   	ret    

0000069d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	83 e8 08             	sub    $0x8,%eax
 6a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ac:	a1 a8 0b 00 00       	mov    0xba8,%eax
 6b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b4:	eb 24                	jmp    6da <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b9:	8b 00                	mov    (%eax),%eax
 6bb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6be:	77 12                	ja     6d2 <free+0x35>
 6c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c6:	77 24                	ja     6ec <free+0x4f>
 6c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cb:	8b 00                	mov    (%eax),%eax
 6cd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d0:	77 1a                	ja     6ec <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d5:	8b 00                	mov    (%eax),%eax
 6d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e0:	76 d4                	jbe    6b6 <free+0x19>
 6e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e5:	8b 00                	mov    (%eax),%eax
 6e7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ea:	76 ca                	jbe    6b6 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ef:	8b 40 04             	mov    0x4(%eax),%eax
 6f2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fc:	01 c2                	add    %eax,%edx
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	39 c2                	cmp    %eax,%edx
 705:	75 24                	jne    72b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 707:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70a:	8b 50 04             	mov    0x4(%eax),%edx
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 00                	mov    (%eax),%eax
 712:	8b 40 04             	mov    0x4(%eax),%eax
 715:	01 c2                	add    %eax,%edx
 717:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 71d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 720:	8b 00                	mov    (%eax),%eax
 722:	8b 10                	mov    (%eax),%edx
 724:	8b 45 f8             	mov    -0x8(%ebp),%eax
 727:	89 10                	mov    %edx,(%eax)
 729:	eb 0a                	jmp    735 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 72b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72e:	8b 10                	mov    (%eax),%edx
 730:	8b 45 f8             	mov    -0x8(%ebp),%eax
 733:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 735:	8b 45 fc             	mov    -0x4(%ebp),%eax
 738:	8b 40 04             	mov    0x4(%eax),%eax
 73b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 742:	8b 45 fc             	mov    -0x4(%ebp),%eax
 745:	01 d0                	add    %edx,%eax
 747:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 74a:	75 20                	jne    76c <free+0xcf>
    p->s.size += bp->s.size;
 74c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74f:	8b 50 04             	mov    0x4(%eax),%edx
 752:	8b 45 f8             	mov    -0x8(%ebp),%eax
 755:	8b 40 04             	mov    0x4(%eax),%eax
 758:	01 c2                	add    %eax,%edx
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 760:	8b 45 f8             	mov    -0x8(%ebp),%eax
 763:	8b 10                	mov    (%eax),%edx
 765:	8b 45 fc             	mov    -0x4(%ebp),%eax
 768:	89 10                	mov    %edx,(%eax)
 76a:	eb 08                	jmp    774 <free+0xd7>
  } else
    p->s.ptr = bp;
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 772:	89 10                	mov    %edx,(%eax)
  freep = p;
 774:	8b 45 fc             	mov    -0x4(%ebp),%eax
 777:	a3 a8 0b 00 00       	mov    %eax,0xba8
}
 77c:	c9                   	leave  
 77d:	c3                   	ret    

0000077e <morecore>:

static Header*
morecore(uint nu)
{
 77e:	55                   	push   %ebp
 77f:	89 e5                	mov    %esp,%ebp
 781:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 784:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 78b:	77 07                	ja     794 <morecore+0x16>
    nu = 4096;
 78d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 794:	8b 45 08             	mov    0x8(%ebp),%eax
 797:	c1 e0 03             	shl    $0x3,%eax
 79a:	89 04 24             	mov    %eax,(%esp)
 79d:	e8 48 fc ff ff       	call   3ea <sbrk>
 7a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7a5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7a9:	75 07                	jne    7b2 <morecore+0x34>
    return 0;
 7ab:	b8 00 00 00 00       	mov    $0x0,%eax
 7b0:	eb 22                	jmp    7d4 <morecore+0x56>
  hp = (Header*)p;
 7b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bb:	8b 55 08             	mov    0x8(%ebp),%edx
 7be:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c4:	83 c0 08             	add    $0x8,%eax
 7c7:	89 04 24             	mov    %eax,(%esp)
 7ca:	e8 ce fe ff ff       	call   69d <free>
  return freep;
 7cf:	a1 a8 0b 00 00       	mov    0xba8,%eax
}
 7d4:	c9                   	leave  
 7d5:	c3                   	ret    

000007d6 <malloc>:

void*
malloc(uint nbytes)
{
 7d6:	55                   	push   %ebp
 7d7:	89 e5                	mov    %esp,%ebp
 7d9:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7dc:	8b 45 08             	mov    0x8(%ebp),%eax
 7df:	83 c0 07             	add    $0x7,%eax
 7e2:	c1 e8 03             	shr    $0x3,%eax
 7e5:	83 c0 01             	add    $0x1,%eax
 7e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7eb:	a1 a8 0b 00 00       	mov    0xba8,%eax
 7f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7f7:	75 23                	jne    81c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7f9:	c7 45 f0 a0 0b 00 00 	movl   $0xba0,-0x10(%ebp)
 800:	8b 45 f0             	mov    -0x10(%ebp),%eax
 803:	a3 a8 0b 00 00       	mov    %eax,0xba8
 808:	a1 a8 0b 00 00       	mov    0xba8,%eax
 80d:	a3 a0 0b 00 00       	mov    %eax,0xba0
    base.s.size = 0;
 812:	c7 05 a4 0b 00 00 00 	movl   $0x0,0xba4
 819:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	8b 40 04             	mov    0x4(%eax),%eax
 82a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 82d:	72 4d                	jb     87c <malloc+0xa6>
      if(p->s.size == nunits)
 82f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 832:	8b 40 04             	mov    0x4(%eax),%eax
 835:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 838:	75 0c                	jne    846 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 83a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83d:	8b 10                	mov    (%eax),%edx
 83f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 842:	89 10                	mov    %edx,(%eax)
 844:	eb 26                	jmp    86c <malloc+0x96>
      else {
        p->s.size -= nunits;
 846:	8b 45 f4             	mov    -0xc(%ebp),%eax
 849:	8b 40 04             	mov    0x4(%eax),%eax
 84c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 84f:	89 c2                	mov    %eax,%edx
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 857:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85a:	8b 40 04             	mov    0x4(%eax),%eax
 85d:	c1 e0 03             	shl    $0x3,%eax
 860:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 863:	8b 45 f4             	mov    -0xc(%ebp),%eax
 866:	8b 55 ec             	mov    -0x14(%ebp),%edx
 869:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 86c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86f:	a3 a8 0b 00 00       	mov    %eax,0xba8
      return (void*)(p + 1);
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	83 c0 08             	add    $0x8,%eax
 87a:	eb 38                	jmp    8b4 <malloc+0xde>
    }
    if(p == freep)
 87c:	a1 a8 0b 00 00       	mov    0xba8,%eax
 881:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 884:	75 1b                	jne    8a1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 886:	8b 45 ec             	mov    -0x14(%ebp),%eax
 889:	89 04 24             	mov    %eax,(%esp)
 88c:	e8 ed fe ff ff       	call   77e <morecore>
 891:	89 45 f4             	mov    %eax,-0xc(%ebp)
 894:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 898:	75 07                	jne    8a1 <malloc+0xcb>
        return 0;
 89a:	b8 00 00 00 00       	mov    $0x0,%eax
 89f:	eb 13                	jmp    8b4 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8aa:	8b 00                	mov    (%eax),%eax
 8ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8af:	e9 70 ff ff ff       	jmp    824 <malloc+0x4e>
}
 8b4:	c9                   	leave  
 8b5:	c3                   	ret    
