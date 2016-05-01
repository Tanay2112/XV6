
_pwd:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

#define MAX_PATH 512

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 10 02 00 00    	sub    $0x210,%esp
    char path[MAX_PATH];
    getcwd(path, MAX_PATH);
   c:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
  13:	00 
  14:	8d 44 24 10          	lea    0x10(%esp),%eax
  18:	89 04 24             	mov    %eax,(%esp)
  1b:	e8 29 03 00 00       	call   349 <getcwd>
    printf(0, "%s\n", path);
  20:	8d 44 24 10          	lea    0x10(%esp),%eax
  24:	89 44 24 08          	mov    %eax,0x8(%esp)
  28:	c7 44 24 04 fd 07 00 	movl   $0x7fd,0x4(%esp)
  2f:	00 
  30:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  37:	e8 f5 03 00 00       	call   431 <printf>
    exit();
  3c:	e8 68 02 00 00       	call   2a9 <exit>

00000041 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  41:	55                   	push   %ebp
  42:	89 e5                	mov    %esp,%ebp
  44:	57                   	push   %edi
  45:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  46:	8b 4d 08             	mov    0x8(%ebp),%ecx
  49:	8b 55 10             	mov    0x10(%ebp),%edx
  4c:	8b 45 0c             	mov    0xc(%ebp),%eax
  4f:	89 cb                	mov    %ecx,%ebx
  51:	89 df                	mov    %ebx,%edi
  53:	89 d1                	mov    %edx,%ecx
  55:	fc                   	cld    
  56:	f3 aa                	rep stos %al,%es:(%edi)
  58:	89 ca                	mov    %ecx,%edx
  5a:	89 fb                	mov    %edi,%ebx
  5c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  5f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  62:	5b                   	pop    %ebx
  63:	5f                   	pop    %edi
  64:	5d                   	pop    %ebp
  65:	c3                   	ret    

00000066 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  66:	55                   	push   %ebp
  67:	89 e5                	mov    %esp,%ebp
  69:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  6c:	8b 45 08             	mov    0x8(%ebp),%eax
  6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  72:	90                   	nop
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8d 50 01             	lea    0x1(%eax),%edx
  79:	89 55 08             	mov    %edx,0x8(%ebp)
  7c:	8b 55 0c             	mov    0xc(%ebp),%edx
  7f:	8d 4a 01             	lea    0x1(%edx),%ecx
  82:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  85:	0f b6 12             	movzbl (%edx),%edx
  88:	88 10                	mov    %dl,(%eax)
  8a:	0f b6 00             	movzbl (%eax),%eax
  8d:	84 c0                	test   %al,%al
  8f:	75 e2                	jne    73 <strcpy+0xd>
    ;
  return os;
  91:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  94:	c9                   	leave  
  95:	c3                   	ret    

00000096 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  96:	55                   	push   %ebp
  97:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  99:	eb 08                	jmp    a3 <strcmp+0xd>
    p++, q++;
  9b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  9f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	0f b6 00             	movzbl (%eax),%eax
  a9:	84 c0                	test   %al,%al
  ab:	74 10                	je     bd <strcmp+0x27>
  ad:	8b 45 08             	mov    0x8(%ebp),%eax
  b0:	0f b6 10             	movzbl (%eax),%edx
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	0f b6 00             	movzbl (%eax),%eax
  b9:	38 c2                	cmp    %al,%dl
  bb:	74 de                	je     9b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  bd:	8b 45 08             	mov    0x8(%ebp),%eax
  c0:	0f b6 00             	movzbl (%eax),%eax
  c3:	0f b6 d0             	movzbl %al,%edx
  c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  c9:	0f b6 00             	movzbl (%eax),%eax
  cc:	0f b6 c0             	movzbl %al,%eax
  cf:	29 c2                	sub    %eax,%edx
  d1:	89 d0                	mov    %edx,%eax
}
  d3:	5d                   	pop    %ebp
  d4:	c3                   	ret    

000000d5 <strlen>:

uint
strlen(char *s)
{
  d5:	55                   	push   %ebp
  d6:	89 e5                	mov    %esp,%ebp
  d8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  e2:	eb 04                	jmp    e8 <strlen+0x13>
  e4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  e8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  eb:	8b 45 08             	mov    0x8(%ebp),%eax
  ee:	01 d0                	add    %edx,%eax
  f0:	0f b6 00             	movzbl (%eax),%eax
  f3:	84 c0                	test   %al,%al
  f5:	75 ed                	jne    e4 <strlen+0xf>
    ;
  return n;
  f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  fa:	c9                   	leave  
  fb:	c3                   	ret    

000000fc <memset>:

void*
memset(void *dst, int c, uint n)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 102:	8b 45 10             	mov    0x10(%ebp),%eax
 105:	89 44 24 08          	mov    %eax,0x8(%esp)
 109:	8b 45 0c             	mov    0xc(%ebp),%eax
 10c:	89 44 24 04          	mov    %eax,0x4(%esp)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	89 04 24             	mov    %eax,(%esp)
 116:	e8 26 ff ff ff       	call   41 <stosb>
  return dst;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 11e:	c9                   	leave  
 11f:	c3                   	ret    

00000120 <strchr>:

char*
strchr(const char *s, char c)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	83 ec 04             	sub    $0x4,%esp
 126:	8b 45 0c             	mov    0xc(%ebp),%eax
 129:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 12c:	eb 14                	jmp    142 <strchr+0x22>
    if(*s == c)
 12e:	8b 45 08             	mov    0x8(%ebp),%eax
 131:	0f b6 00             	movzbl (%eax),%eax
 134:	3a 45 fc             	cmp    -0x4(%ebp),%al
 137:	75 05                	jne    13e <strchr+0x1e>
      return (char*)s;
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	eb 13                	jmp    151 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 13e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	0f b6 00             	movzbl (%eax),%eax
 148:	84 c0                	test   %al,%al
 14a:	75 e2                	jne    12e <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 14c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 151:	c9                   	leave  
 152:	c3                   	ret    

00000153 <gets>:

char*
gets(char *buf, int max)
{
 153:	55                   	push   %ebp
 154:	89 e5                	mov    %esp,%ebp
 156:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 159:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 160:	eb 4c                	jmp    1ae <gets+0x5b>
    cc = read(0, &c, 1);
 162:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 169:	00 
 16a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 16d:	89 44 24 04          	mov    %eax,0x4(%esp)
 171:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 178:	e8 44 01 00 00       	call   2c1 <read>
 17d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 180:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 184:	7f 02                	jg     188 <gets+0x35>
      break;
 186:	eb 31                	jmp    1b9 <gets+0x66>
    buf[i++] = c;
 188:	8b 45 f4             	mov    -0xc(%ebp),%eax
 18b:	8d 50 01             	lea    0x1(%eax),%edx
 18e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 191:	89 c2                	mov    %eax,%edx
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	01 c2                	add    %eax,%edx
 198:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 19c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 19e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1a2:	3c 0a                	cmp    $0xa,%al
 1a4:	74 13                	je     1b9 <gets+0x66>
 1a6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1aa:	3c 0d                	cmp    $0xd,%al
 1ac:	74 0b                	je     1b9 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	83 c0 01             	add    $0x1,%eax
 1b4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1b7:	7c a9                	jl     162 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1bc:	8b 45 08             	mov    0x8(%ebp),%eax
 1bf:	01 d0                	add    %edx,%eax
 1c1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1c4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    

000001c9 <stat>:

int
stat(char *n, struct stat *st)
{
 1c9:	55                   	push   %ebp
 1ca:	89 e5                	mov    %esp,%ebp
 1cc:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1cf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1d6:	00 
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	89 04 24             	mov    %eax,(%esp)
 1dd:	e8 07 01 00 00       	call   2e9 <open>
 1e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1e9:	79 07                	jns    1f2 <stat+0x29>
    return -1;
 1eb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1f0:	eb 23                	jmp    215 <stat+0x4c>
  r = fstat(fd, st);
 1f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fc:	89 04 24             	mov    %eax,(%esp)
 1ff:	e8 fd 00 00 00       	call   301 <fstat>
 204:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 207:	8b 45 f4             	mov    -0xc(%ebp),%eax
 20a:	89 04 24             	mov    %eax,(%esp)
 20d:	e8 bf 00 00 00       	call   2d1 <close>
  return r;
 212:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <atoi>:

int
atoi(const char *s)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 21d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 224:	eb 25                	jmp    24b <atoi+0x34>
    n = n*10 + *s++ - '0';
 226:	8b 55 fc             	mov    -0x4(%ebp),%edx
 229:	89 d0                	mov    %edx,%eax
 22b:	c1 e0 02             	shl    $0x2,%eax
 22e:	01 d0                	add    %edx,%eax
 230:	01 c0                	add    %eax,%eax
 232:	89 c1                	mov    %eax,%ecx
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	8d 50 01             	lea    0x1(%eax),%edx
 23a:	89 55 08             	mov    %edx,0x8(%ebp)
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	0f be c0             	movsbl %al,%eax
 243:	01 c8                	add    %ecx,%eax
 245:	83 e8 30             	sub    $0x30,%eax
 248:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 24b:	8b 45 08             	mov    0x8(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	3c 2f                	cmp    $0x2f,%al
 253:	7e 0a                	jle    25f <atoi+0x48>
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	3c 39                	cmp    $0x39,%al
 25d:	7e c7                	jle    226 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 25f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 262:	c9                   	leave  
 263:	c3                   	ret    

00000264 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 270:	8b 45 0c             	mov    0xc(%ebp),%eax
 273:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 276:	eb 17                	jmp    28f <memmove+0x2b>
    *dst++ = *src++;
 278:	8b 45 fc             	mov    -0x4(%ebp),%eax
 27b:	8d 50 01             	lea    0x1(%eax),%edx
 27e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 281:	8b 55 f8             	mov    -0x8(%ebp),%edx
 284:	8d 4a 01             	lea    0x1(%edx),%ecx
 287:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 28a:	0f b6 12             	movzbl (%edx),%edx
 28d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28f:	8b 45 10             	mov    0x10(%ebp),%eax
 292:	8d 50 ff             	lea    -0x1(%eax),%edx
 295:	89 55 10             	mov    %edx,0x10(%ebp)
 298:	85 c0                	test   %eax,%eax
 29a:	7f dc                	jg     278 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 29c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a1:	b8 01 00 00 00       	mov    $0x1,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret    

000002a9 <exit>:
SYSCALL(exit)
 2a9:	b8 02 00 00 00       	mov    $0x2,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <wait>:
SYSCALL(wait)
 2b1:	b8 03 00 00 00       	mov    $0x3,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <pipe>:
SYSCALL(pipe)
 2b9:	b8 04 00 00 00       	mov    $0x4,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <read>:
SYSCALL(read)
 2c1:	b8 05 00 00 00       	mov    $0x5,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <write>:
SYSCALL(write)
 2c9:	b8 10 00 00 00       	mov    $0x10,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <close>:
SYSCALL(close)
 2d1:	b8 15 00 00 00       	mov    $0x15,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <kill>:
SYSCALL(kill)
 2d9:	b8 06 00 00 00       	mov    $0x6,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <exec>:
SYSCALL(exec)
 2e1:	b8 07 00 00 00       	mov    $0x7,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <open>:
SYSCALL(open)
 2e9:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <mknod>:
SYSCALL(mknod)
 2f1:	b8 11 00 00 00       	mov    $0x11,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <unlink>:
SYSCALL(unlink)
 2f9:	b8 12 00 00 00       	mov    $0x12,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <fstat>:
SYSCALL(fstat)
 301:	b8 08 00 00 00       	mov    $0x8,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <link>:
SYSCALL(link)
 309:	b8 13 00 00 00       	mov    $0x13,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <mkdir>:
SYSCALL(mkdir)
 311:	b8 14 00 00 00       	mov    $0x14,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <chdir>:
SYSCALL(chdir)
 319:	b8 09 00 00 00       	mov    $0x9,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <dup>:
SYSCALL(dup)
 321:	b8 0a 00 00 00       	mov    $0xa,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <getpid>:
SYSCALL(getpid)
 329:	b8 0b 00 00 00       	mov    $0xb,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <sbrk>:
SYSCALL(sbrk)
 331:	b8 0c 00 00 00       	mov    $0xc,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <sleep>:
SYSCALL(sleep)
 339:	b8 0d 00 00 00       	mov    $0xd,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <uptime>:
SYSCALL(uptime)
 341:	b8 0e 00 00 00       	mov    $0xe,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <getcwd>:
SYSCALL(getcwd)
 349:	b8 16 00 00 00       	mov    $0x16,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 351:	55                   	push   %ebp
 352:	89 e5                	mov    %esp,%ebp
 354:	83 ec 18             	sub    $0x18,%esp
 357:	8b 45 0c             	mov    0xc(%ebp),%eax
 35a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 35d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 364:	00 
 365:	8d 45 f4             	lea    -0xc(%ebp),%eax
 368:	89 44 24 04          	mov    %eax,0x4(%esp)
 36c:	8b 45 08             	mov    0x8(%ebp),%eax
 36f:	89 04 24             	mov    %eax,(%esp)
 372:	e8 52 ff ff ff       	call   2c9 <write>
}
 377:	c9                   	leave  
 378:	c3                   	ret    

00000379 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	56                   	push   %esi
 37d:	53                   	push   %ebx
 37e:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 381:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 388:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 38c:	74 17                	je     3a5 <printint+0x2c>
 38e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 392:	79 11                	jns    3a5 <printint+0x2c>
    neg = 1;
 394:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 39b:	8b 45 0c             	mov    0xc(%ebp),%eax
 39e:	f7 d8                	neg    %eax
 3a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3a3:	eb 06                	jmp    3ab <printint+0x32>
  } else {
    x = xx;
 3a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3b2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3b5:	8d 41 01             	lea    0x1(%ecx),%eax
 3b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c1:	ba 00 00 00 00       	mov    $0x0,%edx
 3c6:	f7 f3                	div    %ebx
 3c8:	89 d0                	mov    %edx,%eax
 3ca:	0f b6 80 4c 0a 00 00 	movzbl 0xa4c(%eax),%eax
 3d1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3d5:	8b 75 10             	mov    0x10(%ebp),%esi
 3d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3db:	ba 00 00 00 00       	mov    $0x0,%edx
 3e0:	f7 f6                	div    %esi
 3e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3e9:	75 c7                	jne    3b2 <printint+0x39>
  if(neg)
 3eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3ef:	74 10                	je     401 <printint+0x88>
    buf[i++] = '-';
 3f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f4:	8d 50 01             	lea    0x1(%eax),%edx
 3f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3fa:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3ff:	eb 1f                	jmp    420 <printint+0xa7>
 401:	eb 1d                	jmp    420 <printint+0xa7>
    putc(fd, buf[i]);
 403:	8d 55 dc             	lea    -0x24(%ebp),%edx
 406:	8b 45 f4             	mov    -0xc(%ebp),%eax
 409:	01 d0                	add    %edx,%eax
 40b:	0f b6 00             	movzbl (%eax),%eax
 40e:	0f be c0             	movsbl %al,%eax
 411:	89 44 24 04          	mov    %eax,0x4(%esp)
 415:	8b 45 08             	mov    0x8(%ebp),%eax
 418:	89 04 24             	mov    %eax,(%esp)
 41b:	e8 31 ff ff ff       	call   351 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 420:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 424:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 428:	79 d9                	jns    403 <printint+0x8a>
    putc(fd, buf[i]);
}
 42a:	83 c4 30             	add    $0x30,%esp
 42d:	5b                   	pop    %ebx
 42e:	5e                   	pop    %esi
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    

00000431 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 431:	55                   	push   %ebp
 432:	89 e5                	mov    %esp,%ebp
 434:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 437:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 43e:	8d 45 0c             	lea    0xc(%ebp),%eax
 441:	83 c0 04             	add    $0x4,%eax
 444:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 447:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 44e:	e9 7c 01 00 00       	jmp    5cf <printf+0x19e>
    c = fmt[i] & 0xff;
 453:	8b 55 0c             	mov    0xc(%ebp),%edx
 456:	8b 45 f0             	mov    -0x10(%ebp),%eax
 459:	01 d0                	add    %edx,%eax
 45b:	0f b6 00             	movzbl (%eax),%eax
 45e:	0f be c0             	movsbl %al,%eax
 461:	25 ff 00 00 00       	and    $0xff,%eax
 466:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 469:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 46d:	75 2c                	jne    49b <printf+0x6a>
      if(c == '%'){
 46f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 473:	75 0c                	jne    481 <printf+0x50>
        state = '%';
 475:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 47c:	e9 4a 01 00 00       	jmp    5cb <printf+0x19a>
      } else {
        putc(fd, c);
 481:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 484:	0f be c0             	movsbl %al,%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	89 04 24             	mov    %eax,(%esp)
 491:	e8 bb fe ff ff       	call   351 <putc>
 496:	e9 30 01 00 00       	jmp    5cb <printf+0x19a>
      }
    } else if(state == '%'){
 49b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 49f:	0f 85 26 01 00 00    	jne    5cb <printf+0x19a>
      if(c == 'd'){
 4a5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4a9:	75 2d                	jne    4d8 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4ae:	8b 00                	mov    (%eax),%eax
 4b0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b7:	00 
 4b8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4bf:	00 
 4c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c4:	8b 45 08             	mov    0x8(%ebp),%eax
 4c7:	89 04 24             	mov    %eax,(%esp)
 4ca:	e8 aa fe ff ff       	call   379 <printint>
        ap++;
 4cf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4d3:	e9 ec 00 00 00       	jmp    5c4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4d8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4dc:	74 06                	je     4e4 <printf+0xb3>
 4de:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4e2:	75 2d                	jne    511 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e7:	8b 00                	mov    (%eax),%eax
 4e9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4f0:	00 
 4f1:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4f8:	00 
 4f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fd:	8b 45 08             	mov    0x8(%ebp),%eax
 500:	89 04 24             	mov    %eax,(%esp)
 503:	e8 71 fe ff ff       	call   379 <printint>
        ap++;
 508:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50c:	e9 b3 00 00 00       	jmp    5c4 <printf+0x193>
      } else if(c == 's'){
 511:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 515:	75 45                	jne    55c <printf+0x12b>
        s = (char*)*ap;
 517:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51a:	8b 00                	mov    (%eax),%eax
 51c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 51f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 523:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 527:	75 09                	jne    532 <printf+0x101>
          s = "(null)";
 529:	c7 45 f4 01 08 00 00 	movl   $0x801,-0xc(%ebp)
        while(*s != 0){
 530:	eb 1e                	jmp    550 <printf+0x11f>
 532:	eb 1c                	jmp    550 <printf+0x11f>
          putc(fd, *s);
 534:	8b 45 f4             	mov    -0xc(%ebp),%eax
 537:	0f b6 00             	movzbl (%eax),%eax
 53a:	0f be c0             	movsbl %al,%eax
 53d:	89 44 24 04          	mov    %eax,0x4(%esp)
 541:	8b 45 08             	mov    0x8(%ebp),%eax
 544:	89 04 24             	mov    %eax,(%esp)
 547:	e8 05 fe ff ff       	call   351 <putc>
          s++;
 54c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 550:	8b 45 f4             	mov    -0xc(%ebp),%eax
 553:	0f b6 00             	movzbl (%eax),%eax
 556:	84 c0                	test   %al,%al
 558:	75 da                	jne    534 <printf+0x103>
 55a:	eb 68                	jmp    5c4 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 560:	75 1d                	jne    57f <printf+0x14e>
        putc(fd, *ap);
 562:	8b 45 e8             	mov    -0x18(%ebp),%eax
 565:	8b 00                	mov    (%eax),%eax
 567:	0f be c0             	movsbl %al,%eax
 56a:	89 44 24 04          	mov    %eax,0x4(%esp)
 56e:	8b 45 08             	mov    0x8(%ebp),%eax
 571:	89 04 24             	mov    %eax,(%esp)
 574:	e8 d8 fd ff ff       	call   351 <putc>
        ap++;
 579:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57d:	eb 45                	jmp    5c4 <printf+0x193>
      } else if(c == '%'){
 57f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 583:	75 17                	jne    59c <printf+0x16b>
        putc(fd, c);
 585:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 588:	0f be c0             	movsbl %al,%eax
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	89 04 24             	mov    %eax,(%esp)
 595:	e8 b7 fd ff ff       	call   351 <putc>
 59a:	eb 28                	jmp    5c4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5a3:	00 
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	89 04 24             	mov    %eax,(%esp)
 5aa:	e8 a2 fd ff ff       	call   351 <putc>
        putc(fd, c);
 5af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b2:	0f be c0             	movsbl %al,%eax
 5b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	89 04 24             	mov    %eax,(%esp)
 5bf:	e8 8d fd ff ff       	call   351 <putc>
      }
      state = 0;
 5c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5cb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5cf:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d5:	01 d0                	add    %edx,%eax
 5d7:	0f b6 00             	movzbl (%eax),%eax
 5da:	84 c0                	test   %al,%al
 5dc:	0f 85 71 fe ff ff    	jne    453 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e2:	c9                   	leave  
 5e3:	c3                   	ret    

000005e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	83 e8 08             	sub    $0x8,%eax
 5f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f3:	a1 68 0a 00 00       	mov    0xa68,%eax
 5f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fb:	eb 24                	jmp    621 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 600:	8b 00                	mov    (%eax),%eax
 602:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 605:	77 12                	ja     619 <free+0x35>
 607:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60d:	77 24                	ja     633 <free+0x4f>
 60f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 612:	8b 00                	mov    (%eax),%eax
 614:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 617:	77 1a                	ja     633 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 619:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61c:	8b 00                	mov    (%eax),%eax
 61e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 621:	8b 45 f8             	mov    -0x8(%ebp),%eax
 624:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 627:	76 d4                	jbe    5fd <free+0x19>
 629:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62c:	8b 00                	mov    (%eax),%eax
 62e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 631:	76 ca                	jbe    5fd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 633:	8b 45 f8             	mov    -0x8(%ebp),%eax
 636:	8b 40 04             	mov    0x4(%eax),%eax
 639:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 640:	8b 45 f8             	mov    -0x8(%ebp),%eax
 643:	01 c2                	add    %eax,%edx
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	39 c2                	cmp    %eax,%edx
 64c:	75 24                	jne    672 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	8b 50 04             	mov    0x4(%eax),%edx
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	8b 40 04             	mov    0x4(%eax),%eax
 65c:	01 c2                	add    %eax,%edx
 65e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 661:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 664:	8b 45 fc             	mov    -0x4(%ebp),%eax
 667:	8b 00                	mov    (%eax),%eax
 669:	8b 10                	mov    (%eax),%edx
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	89 10                	mov    %edx,(%eax)
 670:	eb 0a                	jmp    67c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 672:	8b 45 fc             	mov    -0x4(%ebp),%eax
 675:	8b 10                	mov    (%eax),%edx
 677:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 67c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67f:	8b 40 04             	mov    0x4(%eax),%eax
 682:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 689:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68c:	01 d0                	add    %edx,%eax
 68e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 691:	75 20                	jne    6b3 <free+0xcf>
    p->s.size += bp->s.size;
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	8b 50 04             	mov    0x4(%eax),%edx
 699:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69c:	8b 40 04             	mov    0x4(%eax),%eax
 69f:	01 c2                	add    %eax,%edx
 6a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	8b 10                	mov    (%eax),%edx
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	89 10                	mov    %edx,(%eax)
 6b1:	eb 08                	jmp    6bb <free+0xd7>
  } else
    p->s.ptr = bp;
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6b9:	89 10                	mov    %edx,(%eax)
  freep = p;
 6bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6be:	a3 68 0a 00 00       	mov    %eax,0xa68
}
 6c3:	c9                   	leave  
 6c4:	c3                   	ret    

000006c5 <morecore>:

static Header*
morecore(uint nu)
{
 6c5:	55                   	push   %ebp
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6cb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d2:	77 07                	ja     6db <morecore+0x16>
    nu = 4096;
 6d4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6db:	8b 45 08             	mov    0x8(%ebp),%eax
 6de:	c1 e0 03             	shl    $0x3,%eax
 6e1:	89 04 24             	mov    %eax,(%esp)
 6e4:	e8 48 fc ff ff       	call   331 <sbrk>
 6e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6ec:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f0:	75 07                	jne    6f9 <morecore+0x34>
    return 0;
 6f2:	b8 00 00 00 00       	mov    $0x0,%eax
 6f7:	eb 22                	jmp    71b <morecore+0x56>
  hp = (Header*)p;
 6f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 702:	8b 55 08             	mov    0x8(%ebp),%edx
 705:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 708:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70b:	83 c0 08             	add    $0x8,%eax
 70e:	89 04 24             	mov    %eax,(%esp)
 711:	e8 ce fe ff ff       	call   5e4 <free>
  return freep;
 716:	a1 68 0a 00 00       	mov    0xa68,%eax
}
 71b:	c9                   	leave  
 71c:	c3                   	ret    

0000071d <malloc>:

void*
malloc(uint nbytes)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 723:	8b 45 08             	mov    0x8(%ebp),%eax
 726:	83 c0 07             	add    $0x7,%eax
 729:	c1 e8 03             	shr    $0x3,%eax
 72c:	83 c0 01             	add    $0x1,%eax
 72f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 732:	a1 68 0a 00 00       	mov    0xa68,%eax
 737:	89 45 f0             	mov    %eax,-0x10(%ebp)
 73a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 73e:	75 23                	jne    763 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 740:	c7 45 f0 60 0a 00 00 	movl   $0xa60,-0x10(%ebp)
 747:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74a:	a3 68 0a 00 00       	mov    %eax,0xa68
 74f:	a1 68 0a 00 00       	mov    0xa68,%eax
 754:	a3 60 0a 00 00       	mov    %eax,0xa60
    base.s.size = 0;
 759:	c7 05 64 0a 00 00 00 	movl   $0x0,0xa64
 760:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 763:	8b 45 f0             	mov    -0x10(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 76b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76e:	8b 40 04             	mov    0x4(%eax),%eax
 771:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 774:	72 4d                	jb     7c3 <malloc+0xa6>
      if(p->s.size == nunits)
 776:	8b 45 f4             	mov    -0xc(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77f:	75 0c                	jne    78d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 781:	8b 45 f4             	mov    -0xc(%ebp),%eax
 784:	8b 10                	mov    (%eax),%edx
 786:	8b 45 f0             	mov    -0x10(%ebp),%eax
 789:	89 10                	mov    %edx,(%eax)
 78b:	eb 26                	jmp    7b3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 790:	8b 40 04             	mov    0x4(%eax),%eax
 793:	2b 45 ec             	sub    -0x14(%ebp),%eax
 796:	89 c2                	mov    %eax,%edx
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 79e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a1:	8b 40 04             	mov    0x4(%eax),%eax
 7a4:	c1 e0 03             	shl    $0x3,%eax
 7a7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ad:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b6:	a3 68 0a 00 00       	mov    %eax,0xa68
      return (void*)(p + 1);
 7bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7be:	83 c0 08             	add    $0x8,%eax
 7c1:	eb 38                	jmp    7fb <malloc+0xde>
    }
    if(p == freep)
 7c3:	a1 68 0a 00 00       	mov    0xa68,%eax
 7c8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7cb:	75 1b                	jne    7e8 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d0:	89 04 24             	mov    %eax,(%esp)
 7d3:	e8 ed fe ff ff       	call   6c5 <morecore>
 7d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7df:	75 07                	jne    7e8 <malloc+0xcb>
        return 0;
 7e1:	b8 00 00 00 00       	mov    $0x0,%eax
 7e6:	eb 13                	jmp    7fb <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	8b 00                	mov    (%eax),%eax
 7f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7f6:	e9 70 ff ff ff       	jmp    76b <malloc+0x4e>
}
 7fb:	c9                   	leave  
 7fc:	c3                   	ret    
