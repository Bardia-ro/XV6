
_nullderef:     file format elf32-i386


Disassembly of section .text:

00001000 <main>:

int *zeroptr;

int
main(int argc, char *argv[])
{
    1000:	f3 0f 1e fb          	endbr32 
    1004:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    1008:	83 e4 f0             	and    $0xfffffff0,%esp
    100b:	ff 71 fc             	pushl  -0x4(%ecx)
    100e:	55                   	push   %ebp
    100f:	89 e5                	mov    %esp,%ebp
    1011:	51                   	push   %ecx
    1012:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "About to read from address 0...\n");
    1015:	68 78 17 00 00       	push   $0x1778
    101a:	6a 01                	push   $0x1
    101c:	e8 ef 03 00 00       	call   1410 <printf>
  printf(1, "Got: %d\n", *zeroptr);
    1021:	a1 60 1a 00 00       	mov    0x1a60,%eax
    1026:	83 c4 0c             	add    $0xc,%esp
    1029:	ff 30                	pushl  (%eax)
    102b:	68 99 17 00 00       	push   $0x1799
    1030:	6a 01                	push   $0x1
    1032:	e8 d9 03 00 00       	call   1410 <printf>
  exit();
    1037:	e8 67 02 00 00       	call   12a3 <exit>
    103c:	66 90                	xchg   %ax,%ax
    103e:	66 90                	xchg   %ax,%ax

00001040 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    1040:	f3 0f 1e fb          	endbr32 
    1044:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    1045:	31 c0                	xor    %eax,%eax
{
    1047:	89 e5                	mov    %esp,%ebp
    1049:	53                   	push   %ebx
    104a:	8b 4d 08             	mov    0x8(%ebp),%ecx
    104d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
    1050:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    1054:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    1057:	83 c0 01             	add    $0x1,%eax
    105a:	84 d2                	test   %dl,%dl
    105c:	75 f2                	jne    1050 <strcpy+0x10>
    ;
  return os;
}
    105e:	89 c8                	mov    %ecx,%eax
    1060:	5b                   	pop    %ebx
    1061:	5d                   	pop    %ebp
    1062:	c3                   	ret    
    1063:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001070 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    1070:	f3 0f 1e fb          	endbr32 
    1074:	55                   	push   %ebp
    1075:	89 e5                	mov    %esp,%ebp
    1077:	53                   	push   %ebx
    1078:	8b 4d 08             	mov    0x8(%ebp),%ecx
    107b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
    107e:	0f b6 01             	movzbl (%ecx),%eax
    1081:	0f b6 1a             	movzbl (%edx),%ebx
    1084:	84 c0                	test   %al,%al
    1086:	75 19                	jne    10a1 <strcmp+0x31>
    1088:	eb 26                	jmp    10b0 <strcmp+0x40>
    108a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1090:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
    1094:	83 c1 01             	add    $0x1,%ecx
    1097:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    109a:	0f b6 1a             	movzbl (%edx),%ebx
    109d:	84 c0                	test   %al,%al
    109f:	74 0f                	je     10b0 <strcmp+0x40>
    10a1:	38 d8                	cmp    %bl,%al
    10a3:	74 eb                	je     1090 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    10a5:	29 d8                	sub    %ebx,%eax
}
    10a7:	5b                   	pop    %ebx
    10a8:	5d                   	pop    %ebp
    10a9:	c3                   	ret    
    10aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10b0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    10b2:	29 d8                	sub    %ebx,%eax
}
    10b4:	5b                   	pop    %ebx
    10b5:	5d                   	pop    %ebp
    10b6:	c3                   	ret    
    10b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10be:	66 90                	xchg   %ax,%ax

000010c0 <strlen>:

uint
strlen(const char *s)
{
    10c0:	f3 0f 1e fb          	endbr32 
    10c4:	55                   	push   %ebp
    10c5:	89 e5                	mov    %esp,%ebp
    10c7:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
    10ca:	80 3a 00             	cmpb   $0x0,(%edx)
    10cd:	74 21                	je     10f0 <strlen+0x30>
    10cf:	31 c0                	xor    %eax,%eax
    10d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d8:	83 c0 01             	add    $0x1,%eax
    10db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    10df:	89 c1                	mov    %eax,%ecx
    10e1:	75 f5                	jne    10d8 <strlen+0x18>
    ;
  return n;
}
    10e3:	89 c8                	mov    %ecx,%eax
    10e5:	5d                   	pop    %ebp
    10e6:	c3                   	ret    
    10e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10ee:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
    10f0:	31 c9                	xor    %ecx,%ecx
}
    10f2:	5d                   	pop    %ebp
    10f3:	89 c8                	mov    %ecx,%eax
    10f5:	c3                   	ret    
    10f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10fd:	8d 76 00             	lea    0x0(%esi),%esi

00001100 <memset>:

void*
memset(void *dst, int c, uint n)
{
    1100:	f3 0f 1e fb          	endbr32 
    1104:	55                   	push   %ebp
    1105:	89 e5                	mov    %esp,%ebp
    1107:	57                   	push   %edi
    1108:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    110b:	8b 4d 10             	mov    0x10(%ebp),%ecx
    110e:	8b 45 0c             	mov    0xc(%ebp),%eax
    1111:	89 d7                	mov    %edx,%edi
    1113:	fc                   	cld    
    1114:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    1116:	89 d0                	mov    %edx,%eax
    1118:	5f                   	pop    %edi
    1119:	5d                   	pop    %ebp
    111a:	c3                   	ret    
    111b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    111f:	90                   	nop

00001120 <strchr>:

char*
strchr(const char *s, char c)
{
    1120:	f3 0f 1e fb          	endbr32 
    1124:	55                   	push   %ebp
    1125:	89 e5                	mov    %esp,%ebp
    1127:	8b 45 08             	mov    0x8(%ebp),%eax
    112a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
    112e:	0f b6 10             	movzbl (%eax),%edx
    1131:	84 d2                	test   %dl,%dl
    1133:	75 16                	jne    114b <strchr+0x2b>
    1135:	eb 21                	jmp    1158 <strchr+0x38>
    1137:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    113e:	66 90                	xchg   %ax,%ax
    1140:	0f b6 50 01          	movzbl 0x1(%eax),%edx
    1144:	83 c0 01             	add    $0x1,%eax
    1147:	84 d2                	test   %dl,%dl
    1149:	74 0d                	je     1158 <strchr+0x38>
    if(*s == c)
    114b:	38 d1                	cmp    %dl,%cl
    114d:	75 f1                	jne    1140 <strchr+0x20>
      return (char*)s;
  return 0;
}
    114f:	5d                   	pop    %ebp
    1150:	c3                   	ret    
    1151:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
    1158:	31 c0                	xor    %eax,%eax
}
    115a:	5d                   	pop    %ebp
    115b:	c3                   	ret    
    115c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001160 <gets>:

char*
gets(char *buf, int max)
{
    1160:	f3 0f 1e fb          	endbr32 
    1164:	55                   	push   %ebp
    1165:	89 e5                	mov    %esp,%ebp
    1167:	57                   	push   %edi
    1168:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1169:	31 f6                	xor    %esi,%esi
{
    116b:	53                   	push   %ebx
    116c:	89 f3                	mov    %esi,%ebx
    116e:	83 ec 1c             	sub    $0x1c,%esp
    1171:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    1174:	eb 33                	jmp    11a9 <gets+0x49>
    1176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    117d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    1180:	83 ec 04             	sub    $0x4,%esp
    1183:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1186:	6a 01                	push   $0x1
    1188:	50                   	push   %eax
    1189:	6a 00                	push   $0x0
    118b:	e8 2b 01 00 00       	call   12bb <read>
    if(cc < 1)
    1190:	83 c4 10             	add    $0x10,%esp
    1193:	85 c0                	test   %eax,%eax
    1195:	7e 1c                	jle    11b3 <gets+0x53>
      break;
    buf[i++] = c;
    1197:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    119b:	83 c7 01             	add    $0x1,%edi
    119e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    11a1:	3c 0a                	cmp    $0xa,%al
    11a3:	74 23                	je     11c8 <gets+0x68>
    11a5:	3c 0d                	cmp    $0xd,%al
    11a7:	74 1f                	je     11c8 <gets+0x68>
  for(i=0; i+1 < max; ){
    11a9:	83 c3 01             	add    $0x1,%ebx
    11ac:	89 fe                	mov    %edi,%esi
    11ae:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    11b1:	7c cd                	jl     1180 <gets+0x20>
    11b3:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    11b5:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    11b8:	c6 03 00             	movb   $0x0,(%ebx)
}
    11bb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11be:	5b                   	pop    %ebx
    11bf:	5e                   	pop    %esi
    11c0:	5f                   	pop    %edi
    11c1:	5d                   	pop    %ebp
    11c2:	c3                   	ret    
    11c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11c7:	90                   	nop
    11c8:	8b 75 08             	mov    0x8(%ebp),%esi
    11cb:	8b 45 08             	mov    0x8(%ebp),%eax
    11ce:	01 de                	add    %ebx,%esi
    11d0:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    11d2:	c6 03 00             	movb   $0x0,(%ebx)
}
    11d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11d8:	5b                   	pop    %ebx
    11d9:	5e                   	pop    %esi
    11da:	5f                   	pop    %edi
    11db:	5d                   	pop    %ebp
    11dc:	c3                   	ret    
    11dd:	8d 76 00             	lea    0x0(%esi),%esi

000011e0 <stat>:

int
stat(const char *n, struct stat *st)
{
    11e0:	f3 0f 1e fb          	endbr32 
    11e4:	55                   	push   %ebp
    11e5:	89 e5                	mov    %esp,%ebp
    11e7:	56                   	push   %esi
    11e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11e9:	83 ec 08             	sub    $0x8,%esp
    11ec:	6a 00                	push   $0x0
    11ee:	ff 75 08             	pushl  0x8(%ebp)
    11f1:	e8 ed 00 00 00       	call   12e3 <open>
  if(fd < 0)
    11f6:	83 c4 10             	add    $0x10,%esp
    11f9:	85 c0                	test   %eax,%eax
    11fb:	78 2b                	js     1228 <stat+0x48>
    return -1;
  r = fstat(fd, st);
    11fd:	83 ec 08             	sub    $0x8,%esp
    1200:	ff 75 0c             	pushl  0xc(%ebp)
    1203:	89 c3                	mov    %eax,%ebx
    1205:	50                   	push   %eax
    1206:	e8 f0 00 00 00       	call   12fb <fstat>
  close(fd);
    120b:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    120e:	89 c6                	mov    %eax,%esi
  close(fd);
    1210:	e8 b6 00 00 00       	call   12cb <close>
  return r;
    1215:	83 c4 10             	add    $0x10,%esp
}
    1218:	8d 65 f8             	lea    -0x8(%ebp),%esp
    121b:	89 f0                	mov    %esi,%eax
    121d:	5b                   	pop    %ebx
    121e:	5e                   	pop    %esi
    121f:	5d                   	pop    %ebp
    1220:	c3                   	ret    
    1221:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
    1228:	be ff ff ff ff       	mov    $0xffffffff,%esi
    122d:	eb e9                	jmp    1218 <stat+0x38>
    122f:	90                   	nop

00001230 <atoi>:

int
atoi(const char *s)
{
    1230:	f3 0f 1e fb          	endbr32 
    1234:	55                   	push   %ebp
    1235:	89 e5                	mov    %esp,%ebp
    1237:	53                   	push   %ebx
    1238:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    123b:	0f be 02             	movsbl (%edx),%eax
    123e:	8d 48 d0             	lea    -0x30(%eax),%ecx
    1241:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
    1244:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
    1249:	77 1a                	ja     1265 <atoi+0x35>
    124b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    124f:	90                   	nop
    n = n*10 + *s++ - '0';
    1250:	83 c2 01             	add    $0x1,%edx
    1253:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    1256:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
    125a:	0f be 02             	movsbl (%edx),%eax
    125d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    1260:	80 fb 09             	cmp    $0x9,%bl
    1263:	76 eb                	jbe    1250 <atoi+0x20>
  return n;
}
    1265:	89 c8                	mov    %ecx,%eax
    1267:	5b                   	pop    %ebx
    1268:	5d                   	pop    %ebp
    1269:	c3                   	ret    
    126a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001270 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1270:	f3 0f 1e fb          	endbr32 
    1274:	55                   	push   %ebp
    1275:	89 e5                	mov    %esp,%ebp
    1277:	57                   	push   %edi
    1278:	8b 45 10             	mov    0x10(%ebp),%eax
    127b:	8b 55 08             	mov    0x8(%ebp),%edx
    127e:	56                   	push   %esi
    127f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    1282:	85 c0                	test   %eax,%eax
    1284:	7e 0f                	jle    1295 <memmove+0x25>
    1286:	01 d0                	add    %edx,%eax
  dst = vdst;
    1288:	89 d7                	mov    %edx,%edi
    128a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
    1290:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
    1291:	39 f8                	cmp    %edi,%eax
    1293:	75 fb                	jne    1290 <memmove+0x20>
  return vdst;
}
    1295:	5e                   	pop    %esi
    1296:	89 d0                	mov    %edx,%eax
    1298:	5f                   	pop    %edi
    1299:	5d                   	pop    %ebp
    129a:	c3                   	ret    

0000129b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    129b:	b8 01 00 00 00       	mov    $0x1,%eax
    12a0:	cd 40                	int    $0x40
    12a2:	c3                   	ret    

000012a3 <exit>:
SYSCALL(exit)
    12a3:	b8 02 00 00 00       	mov    $0x2,%eax
    12a8:	cd 40                	int    $0x40
    12aa:	c3                   	ret    

000012ab <wait>:
SYSCALL(wait)
    12ab:	b8 03 00 00 00       	mov    $0x3,%eax
    12b0:	cd 40                	int    $0x40
    12b2:	c3                   	ret    

000012b3 <pipe>:
SYSCALL(pipe)
    12b3:	b8 04 00 00 00       	mov    $0x4,%eax
    12b8:	cd 40                	int    $0x40
    12ba:	c3                   	ret    

000012bb <read>:
SYSCALL(read)
    12bb:	b8 05 00 00 00       	mov    $0x5,%eax
    12c0:	cd 40                	int    $0x40
    12c2:	c3                   	ret    

000012c3 <write>:
SYSCALL(write)
    12c3:	b8 10 00 00 00       	mov    $0x10,%eax
    12c8:	cd 40                	int    $0x40
    12ca:	c3                   	ret    

000012cb <close>:
SYSCALL(close)
    12cb:	b8 15 00 00 00       	mov    $0x15,%eax
    12d0:	cd 40                	int    $0x40
    12d2:	c3                   	ret    

000012d3 <kill>:
SYSCALL(kill)
    12d3:	b8 06 00 00 00       	mov    $0x6,%eax
    12d8:	cd 40                	int    $0x40
    12da:	c3                   	ret    

000012db <exec>:
SYSCALL(exec)
    12db:	b8 07 00 00 00       	mov    $0x7,%eax
    12e0:	cd 40                	int    $0x40
    12e2:	c3                   	ret    

000012e3 <open>:
SYSCALL(open)
    12e3:	b8 0f 00 00 00       	mov    $0xf,%eax
    12e8:	cd 40                	int    $0x40
    12ea:	c3                   	ret    

000012eb <mknod>:
SYSCALL(mknod)
    12eb:	b8 11 00 00 00       	mov    $0x11,%eax
    12f0:	cd 40                	int    $0x40
    12f2:	c3                   	ret    

000012f3 <unlink>:
SYSCALL(unlink)
    12f3:	b8 12 00 00 00       	mov    $0x12,%eax
    12f8:	cd 40                	int    $0x40
    12fa:	c3                   	ret    

000012fb <fstat>:
SYSCALL(fstat)
    12fb:	b8 08 00 00 00       	mov    $0x8,%eax
    1300:	cd 40                	int    $0x40
    1302:	c3                   	ret    

00001303 <link>:
SYSCALL(link)
    1303:	b8 13 00 00 00       	mov    $0x13,%eax
    1308:	cd 40                	int    $0x40
    130a:	c3                   	ret    

0000130b <mkdir>:
SYSCALL(mkdir)
    130b:	b8 14 00 00 00       	mov    $0x14,%eax
    1310:	cd 40                	int    $0x40
    1312:	c3                   	ret    

00001313 <chdir>:
SYSCALL(chdir)
    1313:	b8 09 00 00 00       	mov    $0x9,%eax
    1318:	cd 40                	int    $0x40
    131a:	c3                   	ret    

0000131b <dup>:
SYSCALL(dup)
    131b:	b8 0a 00 00 00       	mov    $0xa,%eax
    1320:	cd 40                	int    $0x40
    1322:	c3                   	ret    

00001323 <getpid>:
SYSCALL(getpid)
    1323:	b8 0b 00 00 00       	mov    $0xb,%eax
    1328:	cd 40                	int    $0x40
    132a:	c3                   	ret    

0000132b <sbrk>:
SYSCALL(sbrk)
    132b:	b8 0c 00 00 00       	mov    $0xc,%eax
    1330:	cd 40                	int    $0x40
    1332:	c3                   	ret    

00001333 <sleep>:
SYSCALL(sleep)
    1333:	b8 0d 00 00 00       	mov    $0xd,%eax
    1338:	cd 40                	int    $0x40
    133a:	c3                   	ret    

0000133b <uptime>:
SYSCALL(uptime)
    133b:	b8 0e 00 00 00       	mov    $0xe,%eax
    1340:	cd 40                	int    $0x40
    1342:	c3                   	ret    

00001343 <getyear>:
SYSCALL(getyear)
    1343:	b8 16 00 00 00       	mov    $0x16,%eax
    1348:	cd 40                	int    $0x40
    134a:	c3                   	ret    

0000134b <mprotect>:
SYSCALL(mprotect)
    134b:	b8 17 00 00 00       	mov    $0x17,%eax
    1350:	cd 40                	int    $0x40
    1352:	c3                   	ret    

00001353 <munprotect>:
SYSCALL(munprotect)
    1353:	b8 18 00 00 00       	mov    $0x18,%eax
    1358:	cd 40                	int    $0x40
    135a:	c3                   	ret    
    135b:	66 90                	xchg   %ax,%ax
    135d:	66 90                	xchg   %ax,%ax
    135f:	90                   	nop

00001360 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	57                   	push   %edi
    1364:	56                   	push   %esi
    1365:	53                   	push   %ebx
    1366:	83 ec 3c             	sub    $0x3c,%esp
    1369:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    136c:	89 d1                	mov    %edx,%ecx
{
    136e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
    1371:	85 d2                	test   %edx,%edx
    1373:	0f 89 7f 00 00 00    	jns    13f8 <printint+0x98>
    1379:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    137d:	74 79                	je     13f8 <printint+0x98>
    neg = 1;
    137f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
    1386:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
    1388:	31 db                	xor    %ebx,%ebx
    138a:	8d 75 d7             	lea    -0x29(%ebp),%esi
    138d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1390:	89 c8                	mov    %ecx,%eax
    1392:	31 d2                	xor    %edx,%edx
    1394:	89 cf                	mov    %ecx,%edi
    1396:	f7 75 c4             	divl   -0x3c(%ebp)
    1399:	0f b6 92 ac 17 00 00 	movzbl 0x17ac(%edx),%edx
    13a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
    13a3:	89 d8                	mov    %ebx,%eax
    13a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
    13a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
    13ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
    13ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
    13b1:	76 dd                	jbe    1390 <printint+0x30>
  if(neg)
    13b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
    13b6:	85 c9                	test   %ecx,%ecx
    13b8:	74 0c                	je     13c6 <printint+0x66>
    buf[i++] = '-';
    13ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
    13bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
    13c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
    13c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
    13c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
    13cd:	eb 07                	jmp    13d6 <printint+0x76>
    13cf:	90                   	nop
    13d0:	0f b6 13             	movzbl (%ebx),%edx
    13d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
    13d6:	83 ec 04             	sub    $0x4,%esp
    13d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
    13dc:	6a 01                	push   $0x1
    13de:	56                   	push   %esi
    13df:	57                   	push   %edi
    13e0:	e8 de fe ff ff       	call   12c3 <write>
  while(--i >= 0)
    13e5:	83 c4 10             	add    $0x10,%esp
    13e8:	39 de                	cmp    %ebx,%esi
    13ea:	75 e4                	jne    13d0 <printint+0x70>
    putc(fd, buf[i]);
}
    13ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
    13ef:	5b                   	pop    %ebx
    13f0:	5e                   	pop    %esi
    13f1:	5f                   	pop    %edi
    13f2:	5d                   	pop    %ebp
    13f3:	c3                   	ret    
    13f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    13f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    13ff:	eb 87                	jmp    1388 <printint+0x28>
    1401:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1408:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    140f:	90                   	nop

00001410 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1410:	f3 0f 1e fb          	endbr32 
    1414:	55                   	push   %ebp
    1415:	89 e5                	mov    %esp,%ebp
    1417:	57                   	push   %edi
    1418:	56                   	push   %esi
    1419:	53                   	push   %ebx
    141a:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    141d:	8b 75 0c             	mov    0xc(%ebp),%esi
    1420:	0f b6 1e             	movzbl (%esi),%ebx
    1423:	84 db                	test   %bl,%bl
    1425:	0f 84 b4 00 00 00    	je     14df <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
    142b:	8d 45 10             	lea    0x10(%ebp),%eax
    142e:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1431:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    1434:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
    1436:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1439:	eb 33                	jmp    146e <printf+0x5e>
    143b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    143f:	90                   	nop
    1440:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1443:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    1448:	83 f8 25             	cmp    $0x25,%eax
    144b:	74 17                	je     1464 <printf+0x54>
  write(fd, &c, 1);
    144d:	83 ec 04             	sub    $0x4,%esp
    1450:	88 5d e7             	mov    %bl,-0x19(%ebp)
    1453:	6a 01                	push   $0x1
    1455:	57                   	push   %edi
    1456:	ff 75 08             	pushl  0x8(%ebp)
    1459:	e8 65 fe ff ff       	call   12c3 <write>
    145e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
    1461:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1464:	0f b6 1e             	movzbl (%esi),%ebx
    1467:	83 c6 01             	add    $0x1,%esi
    146a:	84 db                	test   %bl,%bl
    146c:	74 71                	je     14df <printf+0xcf>
    c = fmt[i] & 0xff;
    146e:	0f be cb             	movsbl %bl,%ecx
    1471:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1474:	85 d2                	test   %edx,%edx
    1476:	74 c8                	je     1440 <printf+0x30>
      }
    } else if(state == '%'){
    1478:	83 fa 25             	cmp    $0x25,%edx
    147b:	75 e7                	jne    1464 <printf+0x54>
      if(c == 'd'){
    147d:	83 f8 64             	cmp    $0x64,%eax
    1480:	0f 84 9a 00 00 00    	je     1520 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1486:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    148c:	83 f9 70             	cmp    $0x70,%ecx
    148f:	74 5f                	je     14f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    1491:	83 f8 73             	cmp    $0x73,%eax
    1494:	0f 84 d6 00 00 00    	je     1570 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    149a:	83 f8 63             	cmp    $0x63,%eax
    149d:	0f 84 8d 00 00 00    	je     1530 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    14a3:	83 f8 25             	cmp    $0x25,%eax
    14a6:	0f 84 b4 00 00 00    	je     1560 <printf+0x150>
  write(fd, &c, 1);
    14ac:	83 ec 04             	sub    $0x4,%esp
    14af:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    14b3:	6a 01                	push   $0x1
    14b5:	57                   	push   %edi
    14b6:	ff 75 08             	pushl  0x8(%ebp)
    14b9:	e8 05 fe ff ff       	call   12c3 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    14be:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    14c1:	83 c4 0c             	add    $0xc,%esp
    14c4:	6a 01                	push   $0x1
    14c6:	83 c6 01             	add    $0x1,%esi
    14c9:	57                   	push   %edi
    14ca:	ff 75 08             	pushl  0x8(%ebp)
    14cd:	e8 f1 fd ff ff       	call   12c3 <write>
  for(i = 0; fmt[i]; i++){
    14d2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
    14d6:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    14d9:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    14db:	84 db                	test   %bl,%bl
    14dd:	75 8f                	jne    146e <printf+0x5e>
    }
  }
}
    14df:	8d 65 f4             	lea    -0xc(%ebp),%esp
    14e2:	5b                   	pop    %ebx
    14e3:	5e                   	pop    %esi
    14e4:	5f                   	pop    %edi
    14e5:	5d                   	pop    %ebp
    14e6:	c3                   	ret    
    14e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    14ee:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
    14f0:	83 ec 0c             	sub    $0xc,%esp
    14f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    14f8:	6a 00                	push   $0x0
    14fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    14fd:	8b 45 08             	mov    0x8(%ebp),%eax
    1500:	8b 13                	mov    (%ebx),%edx
    1502:	e8 59 fe ff ff       	call   1360 <printint>
        ap++;
    1507:	89 d8                	mov    %ebx,%eax
    1509:	83 c4 10             	add    $0x10,%esp
      state = 0;
    150c:	31 d2                	xor    %edx,%edx
        ap++;
    150e:	83 c0 04             	add    $0x4,%eax
    1511:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1514:	e9 4b ff ff ff       	jmp    1464 <printf+0x54>
    1519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
    1520:	83 ec 0c             	sub    $0xc,%esp
    1523:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1528:	6a 01                	push   $0x1
    152a:	eb ce                	jmp    14fa <printf+0xea>
    152c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1530:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    1533:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1536:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
    1538:	6a 01                	push   $0x1
        ap++;
    153a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    153d:	57                   	push   %edi
    153e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
    1541:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1544:	e8 7a fd ff ff       	call   12c3 <write>
        ap++;
    1549:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    154c:	83 c4 10             	add    $0x10,%esp
      state = 0;
    154f:	31 d2                	xor    %edx,%edx
    1551:	e9 0e ff ff ff       	jmp    1464 <printf+0x54>
    1556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    155d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
    1560:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
    1563:	83 ec 04             	sub    $0x4,%esp
    1566:	e9 59 ff ff ff       	jmp    14c4 <printf+0xb4>
    156b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    156f:	90                   	nop
        s = (char*)*ap;
    1570:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1573:	8b 18                	mov    (%eax),%ebx
        ap++;
    1575:	83 c0 04             	add    $0x4,%eax
    1578:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    157b:	85 db                	test   %ebx,%ebx
    157d:	74 17                	je     1596 <printf+0x186>
        while(*s != 0){
    157f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1582:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1584:	84 c0                	test   %al,%al
    1586:	0f 84 d8 fe ff ff    	je     1464 <printf+0x54>
    158c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    158f:	89 de                	mov    %ebx,%esi
    1591:	8b 5d 08             	mov    0x8(%ebp),%ebx
    1594:	eb 1a                	jmp    15b0 <printf+0x1a0>
          s = "(null)";
    1596:	bb a2 17 00 00       	mov    $0x17a2,%ebx
        while(*s != 0){
    159b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    159e:	b8 28 00 00 00       	mov    $0x28,%eax
    15a3:	89 de                	mov    %ebx,%esi
    15a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    15af:	90                   	nop
  write(fd, &c, 1);
    15b0:	83 ec 04             	sub    $0x4,%esp
          s++;
    15b3:	83 c6 01             	add    $0x1,%esi
    15b6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    15b9:	6a 01                	push   $0x1
    15bb:	57                   	push   %edi
    15bc:	53                   	push   %ebx
    15bd:	e8 01 fd ff ff       	call   12c3 <write>
        while(*s != 0){
    15c2:	0f b6 06             	movzbl (%esi),%eax
    15c5:	83 c4 10             	add    $0x10,%esp
    15c8:	84 c0                	test   %al,%al
    15ca:	75 e4                	jne    15b0 <printf+0x1a0>
    15cc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
    15cf:	31 d2                	xor    %edx,%edx
    15d1:	e9 8e fe ff ff       	jmp    1464 <printf+0x54>
    15d6:	66 90                	xchg   %ax,%ax
    15d8:	66 90                	xchg   %ax,%ax
    15da:	66 90                	xchg   %ax,%ax
    15dc:	66 90                	xchg   %ax,%ax
    15de:	66 90                	xchg   %ax,%ax

000015e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    15e0:	f3 0f 1e fb          	endbr32 
    15e4:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15e5:	a1 54 1a 00 00       	mov    0x1a54,%eax
{
    15ea:	89 e5                	mov    %esp,%ebp
    15ec:	57                   	push   %edi
    15ed:	56                   	push   %esi
    15ee:	53                   	push   %ebx
    15ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
    15f2:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
    15f4:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    15f7:	39 c8                	cmp    %ecx,%eax
    15f9:	73 15                	jae    1610 <free+0x30>
    15fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15ff:	90                   	nop
    1600:	39 d1                	cmp    %edx,%ecx
    1602:	72 14                	jb     1618 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1604:	39 d0                	cmp    %edx,%eax
    1606:	73 10                	jae    1618 <free+0x38>
{
    1608:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    160a:	8b 10                	mov    (%eax),%edx
    160c:	39 c8                	cmp    %ecx,%eax
    160e:	72 f0                	jb     1600 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1610:	39 d0                	cmp    %edx,%eax
    1612:	72 f4                	jb     1608 <free+0x28>
    1614:	39 d1                	cmp    %edx,%ecx
    1616:	73 f0                	jae    1608 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1618:	8b 73 fc             	mov    -0x4(%ebx),%esi
    161b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    161e:	39 fa                	cmp    %edi,%edx
    1620:	74 1e                	je     1640 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1622:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1625:	8b 50 04             	mov    0x4(%eax),%edx
    1628:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    162b:	39 f1                	cmp    %esi,%ecx
    162d:	74 28                	je     1657 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    162f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1631:	5b                   	pop    %ebx
  freep = p;
    1632:	a3 54 1a 00 00       	mov    %eax,0x1a54
}
    1637:	5e                   	pop    %esi
    1638:	5f                   	pop    %edi
    1639:	5d                   	pop    %ebp
    163a:	c3                   	ret    
    163b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    163f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
    1640:	03 72 04             	add    0x4(%edx),%esi
    1643:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1646:	8b 10                	mov    (%eax),%edx
    1648:	8b 12                	mov    (%edx),%edx
    164a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    164d:	8b 50 04             	mov    0x4(%eax),%edx
    1650:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1653:	39 f1                	cmp    %esi,%ecx
    1655:	75 d8                	jne    162f <free+0x4f>
    p->s.size += bp->s.size;
    1657:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    165a:	a3 54 1a 00 00       	mov    %eax,0x1a54
    p->s.size += bp->s.size;
    165f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1662:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1665:	89 10                	mov    %edx,(%eax)
}
    1667:	5b                   	pop    %ebx
    1668:	5e                   	pop    %esi
    1669:	5f                   	pop    %edi
    166a:	5d                   	pop    %ebp
    166b:	c3                   	ret    
    166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1670:	f3 0f 1e fb          	endbr32 
    1674:	55                   	push   %ebp
    1675:	89 e5                	mov    %esp,%ebp
    1677:	57                   	push   %edi
    1678:	56                   	push   %esi
    1679:	53                   	push   %ebx
    167a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    167d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    1680:	8b 3d 54 1a 00 00    	mov    0x1a54,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1686:	8d 70 07             	lea    0x7(%eax),%esi
    1689:	c1 ee 03             	shr    $0x3,%esi
    168c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    168f:	85 ff                	test   %edi,%edi
    1691:	0f 84 a9 00 00 00    	je     1740 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1697:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
    1699:	8b 48 04             	mov    0x4(%eax),%ecx
    169c:	39 f1                	cmp    %esi,%ecx
    169e:	73 6d                	jae    170d <malloc+0x9d>
    16a0:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    16a6:	bb 00 10 00 00       	mov    $0x1000,%ebx
    16ab:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    16ae:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
    16b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
    16b8:	eb 17                	jmp    16d1 <malloc+0x61>
    16ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    16c0:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
    16c2:	8b 4a 04             	mov    0x4(%edx),%ecx
    16c5:	39 f1                	cmp    %esi,%ecx
    16c7:	73 4f                	jae    1718 <malloc+0xa8>
    16c9:	8b 3d 54 1a 00 00    	mov    0x1a54,%edi
    16cf:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    16d1:	39 c7                	cmp    %eax,%edi
    16d3:	75 eb                	jne    16c0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
    16d5:	83 ec 0c             	sub    $0xc,%esp
    16d8:	ff 75 e4             	pushl  -0x1c(%ebp)
    16db:	e8 4b fc ff ff       	call   132b <sbrk>
  if(p == (char*)-1)
    16e0:	83 c4 10             	add    $0x10,%esp
    16e3:	83 f8 ff             	cmp    $0xffffffff,%eax
    16e6:	74 1b                	je     1703 <malloc+0x93>
  hp->s.size = nu;
    16e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    16eb:	83 ec 0c             	sub    $0xc,%esp
    16ee:	83 c0 08             	add    $0x8,%eax
    16f1:	50                   	push   %eax
    16f2:	e8 e9 fe ff ff       	call   15e0 <free>
  return freep;
    16f7:	a1 54 1a 00 00       	mov    0x1a54,%eax
      if((p = morecore(nunits)) == 0)
    16fc:	83 c4 10             	add    $0x10,%esp
    16ff:	85 c0                	test   %eax,%eax
    1701:	75 bd                	jne    16c0 <malloc+0x50>
        return 0;
  }
}
    1703:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    1706:	31 c0                	xor    %eax,%eax
}
    1708:	5b                   	pop    %ebx
    1709:	5e                   	pop    %esi
    170a:	5f                   	pop    %edi
    170b:	5d                   	pop    %ebp
    170c:	c3                   	ret    
    if(p->s.size >= nunits){
    170d:	89 c2                	mov    %eax,%edx
    170f:	89 f8                	mov    %edi,%eax
    1711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1718:	39 ce                	cmp    %ecx,%esi
    171a:	74 54                	je     1770 <malloc+0x100>
        p->s.size -= nunits;
    171c:	29 f1                	sub    %esi,%ecx
    171e:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
    1721:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
    1724:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
    1727:	a3 54 1a 00 00       	mov    %eax,0x1a54
}
    172c:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    172f:	8d 42 08             	lea    0x8(%edx),%eax
}
    1732:	5b                   	pop    %ebx
    1733:	5e                   	pop    %esi
    1734:	5f                   	pop    %edi
    1735:	5d                   	pop    %ebp
    1736:	c3                   	ret    
    1737:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    173e:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
    1740:	c7 05 54 1a 00 00 58 	movl   $0x1a58,0x1a54
    1747:	1a 00 00 
    base.s.size = 0;
    174a:	bf 58 1a 00 00       	mov    $0x1a58,%edi
    base.s.ptr = freep = prevp = &base;
    174f:	c7 05 58 1a 00 00 58 	movl   $0x1a58,0x1a58
    1756:	1a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1759:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
    175b:	c7 05 5c 1a 00 00 00 	movl   $0x0,0x1a5c
    1762:	00 00 00 
    if(p->s.size >= nunits){
    1765:	e9 36 ff ff ff       	jmp    16a0 <malloc+0x30>
    176a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1770:	8b 0a                	mov    (%edx),%ecx
    1772:	89 08                	mov    %ecx,(%eax)
    1774:	eb b1                	jmp    1727 <malloc+0xb7>
