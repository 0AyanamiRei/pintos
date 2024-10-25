
echo:     file format elf32-i386


Disassembly of section .text:

08048074 <main>:
 8048074:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048078:	83 e4 f0             	and    $0xfffffff0,%esp
 804807b:	ff 71 fc             	push   -0x4(%ecx)
 804807e:	55                   	push   %ebp
 804807f:	89 e5                	mov    %esp,%ebp
 8048081:	53                   	push   %ebx
 8048082:	51                   	push   %ecx
 8048083:	83 ec 10             	sub    $0x10,%esp
 8048086:	89 cb                	mov    %ecx,%ebx
 8048088:	83 ec 0c             	sub    $0xc,%esp
 804808b:	68 e0 a0 04 08       	push   $0x804a0e0
 8048090:	e8 80 1e 00 00       	call   8049f15 <puts>
 8048095:	83 c4 10             	add    $0x10,%esp
 8048098:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804809f:	eb 25                	jmp    80480c6 <main+0x52>
 80480a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80480a4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 80480ab:	8b 43 04             	mov    0x4(%ebx),%eax
 80480ae:	01 d0                	add    %edx,%eax
 80480b0:	8b 00                	mov    (%eax),%eax
 80480b2:	83 ec 08             	sub    $0x8,%esp
 80480b5:	50                   	push   %eax
 80480b6:	68 f4 a0 04 08       	push   $0x804a0f4
 80480bb:	e8 3b 01 00 00       	call   80481fb <printf>
 80480c0:	83 c4 10             	add    $0x10,%esp
 80480c3:	ff 45 f4             	incl   -0xc(%ebp)
 80480c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80480c9:	3b 03                	cmp    (%ebx),%eax
 80480cb:	7c d4                	jl     80480a1 <main+0x2d>
 80480cd:	83 ec 0c             	sub    $0xc,%esp
 80480d0:	6a 0a                	push   $0xa
 80480d2:	e8 77 1e 00 00       	call   8049f4e <putchar>
 80480d7:	83 c4 10             	add    $0x10,%esp
 80480da:	b8 00 00 00 00       	mov    $0x0,%eax
 80480df:	8d 65 f8             	lea    -0x8(%ebp),%esp
 80480e2:	59                   	pop    %ecx
 80480e3:	5b                   	pop    %ebx
 80480e4:	5d                   	pop    %ebp
 80480e5:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80480e8:	c3                   	ret    

080480e9 <_start>:
 80480e9:	55                   	push   %ebp
 80480ea:	89 e5                	mov    %esp,%ebp
 80480ec:	83 ec 08             	sub    $0x8,%esp
 80480ef:	83 ec 08             	sub    $0x8,%esp
 80480f2:	ff 75 0c             	push   0xc(%ebp)
 80480f5:	ff 75 08             	push   0x8(%ebp)
 80480f8:	e8 77 ff ff ff       	call   8048074 <main>
 80480fd:	83 c4 10             	add    $0x10,%esp
 8048100:	83 ec 0c             	sub    $0xc,%esp
 8048103:	50                   	push   %eax
 8048104:	e8 b1 1b 00 00       	call   8049cba <exit>

08048109 <isdigit>:
 8048109:	55                   	push   %ebp
 804810a:	89 e5                	mov    %esp,%ebp
 804810c:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
 8048110:	7e 0d                	jle    804811f <isdigit+0x16>
 8048112:	83 7d 08 39          	cmpl   $0x39,0x8(%ebp)
 8048116:	7f 07                	jg     804811f <isdigit+0x16>
 8048118:	b8 01 00 00 00       	mov    $0x1,%eax
 804811d:	eb 05                	jmp    8048124 <isdigit+0x1b>
 804811f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048124:	5d                   	pop    %ebp
 8048125:	c3                   	ret    

08048126 <isprint>:
 8048126:	55                   	push   %ebp
 8048127:	89 e5                	mov    %esp,%ebp
 8048129:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
 804812d:	7e 0d                	jle    804813c <isprint+0x16>
 804812f:	83 7d 08 7e          	cmpl   $0x7e,0x8(%ebp)
 8048133:	7f 07                	jg     804813c <isprint+0x16>
 8048135:	b8 01 00 00 00       	mov    $0x1,%eax
 804813a:	eb 05                	jmp    8048141 <isprint+0x1b>
 804813c:	b8 00 00 00 00       	mov    $0x0,%eax
 8048141:	5d                   	pop    %ebp
 8048142:	c3                   	ret    

08048143 <vsnprintf>:
 8048143:	55                   	push   %ebp
 8048144:	89 e5                	mov    %esp,%ebp
 8048146:	83 ec 18             	sub    $0x18,%esp
 8048149:	8b 45 08             	mov    0x8(%ebp),%eax
 804814c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804814f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048156:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804815a:	74 06                	je     8048162 <vsnprintf+0x1f>
 804815c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804815f:	48                   	dec    %eax
 8048160:	eb 05                	jmp    8048167 <vsnprintf+0x24>
 8048162:	b8 00 00 00 00       	mov    $0x0,%eax
 8048167:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804816a:	8d 45 ec             	lea    -0x14(%ebp),%eax
 804816d:	50                   	push   %eax
 804816e:	68 92 81 04 08       	push   $0x8048192
 8048173:	ff 75 14             	push   0x14(%ebp)
 8048176:	ff 75 10             	push   0x10(%ebp)
 8048179:	e8 a3 00 00 00       	call   8048221 <__vprintf>
 804817e:	83 c4 10             	add    $0x10,%esp
 8048181:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048185:	74 06                	je     804818d <vsnprintf+0x4a>
 8048187:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804818a:	c6 00 00             	movb   $0x0,(%eax)
 804818d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048190:	c9                   	leave  
 8048191:	c3                   	ret    

08048192 <vsnprintf_helper>:
 8048192:	55                   	push   %ebp
 8048193:	89 e5                	mov    %esp,%ebp
 8048195:	83 ec 14             	sub    $0x14,%esp
 8048198:	8b 45 08             	mov    0x8(%ebp),%eax
 804819b:	88 45 ec             	mov    %al,-0x14(%ebp)
 804819e:	8b 45 0c             	mov    0xc(%ebp),%eax
 80481a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80481a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80481a7:	8b 40 04             	mov    0x4(%eax),%eax
 80481aa:	8d 48 01             	lea    0x1(%eax),%ecx
 80481ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80481b0:	89 4a 04             	mov    %ecx,0x4(%edx)
 80481b3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80481b6:	8b 52 08             	mov    0x8(%edx),%edx
 80481b9:	39 d0                	cmp    %edx,%eax
 80481bb:	7d 12                	jge    80481cf <vsnprintf_helper+0x3d>
 80481bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80481c0:	8b 00                	mov    (%eax),%eax
 80481c2:	8d 48 01             	lea    0x1(%eax),%ecx
 80481c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80481c8:	89 0a                	mov    %ecx,(%edx)
 80481ca:	8a 55 ec             	mov    -0x14(%ebp),%dl
 80481cd:	88 10                	mov    %dl,(%eax)
 80481cf:	90                   	nop
 80481d0:	c9                   	leave  
 80481d1:	c3                   	ret    

080481d2 <snprintf>:
 80481d2:	55                   	push   %ebp
 80481d3:	89 e5                	mov    %esp,%ebp
 80481d5:	83 ec 18             	sub    $0x18,%esp
 80481d8:	8d 45 14             	lea    0x14(%ebp),%eax
 80481db:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80481de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80481e1:	50                   	push   %eax
 80481e2:	ff 75 10             	push   0x10(%ebp)
 80481e5:	ff 75 0c             	push   0xc(%ebp)
 80481e8:	ff 75 08             	push   0x8(%ebp)
 80481eb:	e8 53 ff ff ff       	call   8048143 <vsnprintf>
 80481f0:	83 c4 10             	add    $0x10,%esp
 80481f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80481f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481f9:	c9                   	leave  
 80481fa:	c3                   	ret    

080481fb <printf>:
 80481fb:	55                   	push   %ebp
 80481fc:	89 e5                	mov    %esp,%ebp
 80481fe:	83 ec 18             	sub    $0x18,%esp
 8048201:	8d 45 0c             	lea    0xc(%ebp),%eax
 8048204:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048207:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804820a:	83 ec 08             	sub    $0x8,%esp
 804820d:	50                   	push   %eax
 804820e:	ff 75 08             	push   0x8(%ebp)
 8048211:	e8 bb 1c 00 00       	call   8049ed1 <vprintf>
 8048216:	83 c4 10             	add    $0x10,%esp
 8048219:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804821c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804821f:	c9                   	leave  
 8048220:	c3                   	ret    

08048221 <__vprintf>:
 8048221:	55                   	push   %ebp
 8048222:	89 e5                	mov    %esp,%ebp
 8048224:	53                   	push   %ebx
 8048225:	83 ec 34             	sub    $0x34,%esp
 8048228:	e9 25 04 00 00       	jmp    8048652 <__vprintf+0x431>
 804822d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048230:	8a 00                	mov    (%eax),%al
 8048232:	3c 25                	cmp    $0x25,%al
 8048234:	74 1c                	je     8048252 <__vprintf+0x31>
 8048236:	8b 45 08             	mov    0x8(%ebp),%eax
 8048239:	8a 00                	mov    (%eax),%al
 804823b:	0f be c0             	movsbl %al,%eax
 804823e:	83 ec 08             	sub    $0x8,%esp
 8048241:	ff 75 14             	push   0x14(%ebp)
 8048244:	50                   	push   %eax
 8048245:	8b 45 10             	mov    0x10(%ebp),%eax
 8048248:	ff d0                	call   *%eax
 804824a:	83 c4 10             	add    $0x10,%esp
 804824d:	e9 fd 03 00 00       	jmp    804864f <__vprintf+0x42e>
 8048252:	ff 45 08             	incl   0x8(%ebp)
 8048255:	8b 45 08             	mov    0x8(%ebp),%eax
 8048258:	8a 00                	mov    (%eax),%al
 804825a:	3c 25                	cmp    $0x25,%al
 804825c:	75 15                	jne    8048273 <__vprintf+0x52>
 804825e:	83 ec 08             	sub    $0x8,%esp
 8048261:	ff 75 14             	push   0x14(%ebp)
 8048264:	6a 25                	push   $0x25
 8048266:	8b 45 10             	mov    0x10(%ebp),%eax
 8048269:	ff d0                	call   *%eax
 804826b:	83 c4 10             	add    $0x10,%esp
 804826e:	e9 dc 03 00 00       	jmp    804864f <__vprintf+0x42e>
 8048273:	83 ec 04             	sub    $0x4,%esp
 8048276:	8d 45 0c             	lea    0xc(%ebp),%eax
 8048279:	50                   	push   %eax
 804827a:	8d 45 cc             	lea    -0x34(%ebp),%eax
 804827d:	50                   	push   %eax
 804827e:	ff 75 08             	push   0x8(%ebp)
 8048281:	e8 df 03 00 00       	call   8048665 <parse_conversion>
 8048286:	83 c4 10             	add    $0x10,%esp
 8048289:	89 45 08             	mov    %eax,0x8(%ebp)
 804828c:	8b 45 08             	mov    0x8(%ebp),%eax
 804828f:	8a 00                	mov    (%eax),%al
 8048291:	0f be c0             	movsbl %al,%eax
 8048294:	83 e8 45             	sub    $0x45,%eax
 8048297:	83 f8 33             	cmp    $0x33,%eax
 804829a:	0f 87 92 03 00 00    	ja     8048632 <__vprintf+0x411>
 80482a0:	8b 04 85 e0 a1 04 08 	mov    0x804a1e0(,%eax,4),%eax
 80482a7:	ff e0                	jmp    *%eax
 80482a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80482ac:	83 f8 08             	cmp    $0x8,%eax
 80482af:	0f 87 d8 00 00 00    	ja     804838d <__vprintf+0x16c>
 80482b5:	8b 04 85 b0 a2 04 08 	mov    0x804a2b0(,%eax,4),%eax
 80482bc:	ff e0                	jmp    *%eax
 80482be:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482c1:	8d 50 04             	lea    0x4(%eax),%edx
 80482c4:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482c7:	8b 00                	mov    (%eax),%eax
 80482c9:	0f be c0             	movsbl %al,%eax
 80482cc:	99                   	cltd   
 80482cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80482d3:	e9 cf 00 00 00       	jmp    80483a7 <__vprintf+0x186>
 80482d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482db:	8d 50 04             	lea    0x4(%eax),%edx
 80482de:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482e1:	8b 00                	mov    (%eax),%eax
 80482e3:	98                   	cwtl   
 80482e4:	99                   	cltd   
 80482e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80482eb:	e9 b7 00 00 00       	jmp    80483a7 <__vprintf+0x186>
 80482f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482f3:	8d 50 04             	lea    0x4(%eax),%edx
 80482f6:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482f9:	8b 00                	mov    (%eax),%eax
 80482fb:	99                   	cltd   
 80482fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482ff:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048302:	e9 a0 00 00 00       	jmp    80483a7 <__vprintf+0x186>
 8048307:	8b 45 0c             	mov    0xc(%ebp),%eax
 804830a:	8d 50 08             	lea    0x8(%eax),%edx
 804830d:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048310:	8b 50 04             	mov    0x4(%eax),%edx
 8048313:	8b 00                	mov    (%eax),%eax
 8048315:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048318:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804831b:	e9 87 00 00 00       	jmp    80483a7 <__vprintf+0x186>
 8048320:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048323:	8d 50 04             	lea    0x4(%eax),%edx
 8048326:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048329:	8b 00                	mov    (%eax),%eax
 804832b:	99                   	cltd   
 804832c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804832f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048332:	eb 73                	jmp    80483a7 <__vprintf+0x186>
 8048334:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048337:	8d 50 08             	lea    0x8(%eax),%edx
 804833a:	89 55 0c             	mov    %edx,0xc(%ebp)
 804833d:	8b 50 04             	mov    0x4(%eax),%edx
 8048340:	8b 00                	mov    (%eax),%eax
 8048342:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048345:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048348:	eb 5d                	jmp    80483a7 <__vprintf+0x186>
 804834a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804834d:	8d 50 04             	lea    0x4(%eax),%edx
 8048350:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048353:	8b 00                	mov    (%eax),%eax
 8048355:	99                   	cltd   
 8048356:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048359:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804835c:	eb 49                	jmp    80483a7 <__vprintf+0x186>
 804835e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048361:	8d 50 04             	lea    0x4(%eax),%edx
 8048364:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048367:	8b 00                	mov    (%eax),%eax
 8048369:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804836c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048373:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048377:	78 2d                	js     80483a6 <__vprintf+0x185>
 8048379:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804837d:	7f 09                	jg     8048388 <__vprintf+0x167>
 804837f:	81 7d f0 ff ff ff 7f 	cmpl   $0x7fffffff,-0x10(%ebp)
 8048386:	76 1e                	jbe    80483a6 <__vprintf+0x185>
 8048388:	ff 4d f4             	decl   -0xc(%ebp)
 804838b:	eb 19                	jmp    80483a6 <__vprintf+0x185>
 804838d:	68 78 a1 04 08       	push   $0x804a178
 8048392:	68 ac a3 04 08       	push   $0x804a3ac
 8048397:	68 dc 00 00 00       	push   $0xdc
 804839c:	68 9a a1 04 08       	push   $0x804a19a
 80483a1:	e8 9e 18 00 00       	call   8049c44 <debug_panic>
 80483a6:	90                   	nop
 80483a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80483aa:	c1 e8 1f             	shr    $0x1f,%eax
 80483ad:	0f b6 c8             	movzbl %al,%ecx
 80483b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80483b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80483b6:	85 d2                	test   %edx,%edx
 80483b8:	79 07                	jns    80483c1 <__vprintf+0x1a0>
 80483ba:	f7 d8                	neg    %eax
 80483bc:	83 d2 00             	adc    $0x0,%edx
 80483bf:	f7 da                	neg    %edx
 80483c1:	ff 75 14             	push   0x14(%ebp)
 80483c4:	ff 75 10             	push   0x10(%ebp)
 80483c7:	8d 5d cc             	lea    -0x34(%ebp),%ebx
 80483ca:	53                   	push   %ebx
 80483cb:	68 04 a1 04 08       	push   $0x804a104
 80483d0:	51                   	push   %ecx
 80483d1:	6a 01                	push   $0x1
 80483d3:	52                   	push   %edx
 80483d4:	50                   	push   %eax
 80483d5:	e8 3f 05 00 00       	call   8048919 <format_integer>
 80483da:	83 c4 20             	add    $0x20,%esp
 80483dd:	e9 6d 02 00 00       	jmp    804864f <__vprintf+0x42e>
 80483e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80483e5:	83 f8 08             	cmp    $0x8,%eax
 80483e8:	0f 87 d3 00 00 00    	ja     80484c1 <__vprintf+0x2a0>
 80483ee:	8b 04 85 d4 a2 04 08 	mov    0x804a2d4(,%eax,4),%eax
 80483f5:	ff e0                	jmp    *%eax
 80483f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80483fa:	8d 50 04             	lea    0x4(%eax),%edx
 80483fd:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048400:	8b 00                	mov    (%eax),%eax
 8048402:	0f b6 c0             	movzbl %al,%eax
 8048405:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048408:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804840f:	e9 c6 00 00 00       	jmp    80484da <__vprintf+0x2b9>
 8048414:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048417:	8d 50 04             	lea    0x4(%eax),%edx
 804841a:	89 55 0c             	mov    %edx,0xc(%ebp)
 804841d:	8b 00                	mov    (%eax),%eax
 804841f:	0f b7 c0             	movzwl %ax,%eax
 8048422:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048425:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804842c:	e9 a9 00 00 00       	jmp    80484da <__vprintf+0x2b9>
 8048431:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048434:	8d 50 04             	lea    0x4(%eax),%edx
 8048437:	89 55 0c             	mov    %edx,0xc(%ebp)
 804843a:	8b 00                	mov    (%eax),%eax
 804843c:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804843f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048446:	e9 8f 00 00 00       	jmp    80484da <__vprintf+0x2b9>
 804844b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804844e:	8d 50 08             	lea    0x8(%eax),%edx
 8048451:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048454:	8b 50 04             	mov    0x4(%eax),%edx
 8048457:	8b 00                	mov    (%eax),%eax
 8048459:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804845c:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804845f:	eb 79                	jmp    80484da <__vprintf+0x2b9>
 8048461:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048464:	8d 50 04             	lea    0x4(%eax),%edx
 8048467:	89 55 0c             	mov    %edx,0xc(%ebp)
 804846a:	8b 00                	mov    (%eax),%eax
 804846c:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804846f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048476:	eb 62                	jmp    80484da <__vprintf+0x2b9>
 8048478:	8b 45 0c             	mov    0xc(%ebp),%eax
 804847b:	8d 50 08             	lea    0x8(%eax),%edx
 804847e:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048481:	8b 50 04             	mov    0x4(%eax),%edx
 8048484:	8b 00                	mov    (%eax),%eax
 8048486:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048489:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804848c:	eb 4c                	jmp    80484da <__vprintf+0x2b9>
 804848e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048491:	8d 50 04             	lea    0x4(%eax),%edx
 8048494:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048497:	8b 00                	mov    (%eax),%eax
 8048499:	99                   	cltd   
 804849a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804849d:	89 55 ec             	mov    %edx,-0x14(%ebp)
 80484a0:	83 65 e8 ff          	andl   $0xffffffff,-0x18(%ebp)
 80484a4:	83 65 ec 00          	andl   $0x0,-0x14(%ebp)
 80484a8:	eb 30                	jmp    80484da <__vprintf+0x2b9>
 80484aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484ad:	8d 50 04             	lea    0x4(%eax),%edx
 80484b0:	89 55 0c             	mov    %edx,0xc(%ebp)
 80484b3:	8b 00                	mov    (%eax),%eax
 80484b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80484b8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80484bf:	eb 19                	jmp    80484da <__vprintf+0x2b9>
 80484c1:	68 78 a1 04 08       	push   $0x804a178
 80484c6:	68 ac a3 04 08       	push   $0x804a3ac
 80484cb:	68 0b 01 00 00       	push   $0x10b
 80484d0:	68 9a a1 04 08       	push   $0x804a19a
 80484d5:	e8 6a 17 00 00       	call   8049c44 <debug_panic>
 80484da:	8b 45 08             	mov    0x8(%ebp),%eax
 80484dd:	8a 00                	mov    (%eax),%al
 80484df:	0f be c0             	movsbl %al,%eax
 80484e2:	83 f8 6f             	cmp    $0x6f,%eax
 80484e5:	74 18                	je     80484ff <__vprintf+0x2de>
 80484e7:	83 f8 6f             	cmp    $0x6f,%eax
 80484ea:	7f 07                	jg     80484f3 <__vprintf+0x2d2>
 80484ec:	83 f8 58             	cmp    $0x58,%eax
 80484ef:	74 29                	je     804851a <__vprintf+0x2f9>
 80484f1:	eb 30                	jmp    8048523 <__vprintf+0x302>
 80484f3:	83 f8 75             	cmp    $0x75,%eax
 80484f6:	74 10                	je     8048508 <__vprintf+0x2e7>
 80484f8:	83 f8 78             	cmp    $0x78,%eax
 80484fb:	74 14                	je     8048511 <__vprintf+0x2f0>
 80484fd:	eb 24                	jmp    8048523 <__vprintf+0x302>
 80484ff:	c7 45 e4 20 a1 04 08 	movl   $0x804a120,-0x1c(%ebp)
 8048506:	eb 34                	jmp    804853c <__vprintf+0x31b>
 8048508:	c7 45 e4 04 a1 04 08 	movl   $0x804a104,-0x1c(%ebp)
 804850f:	eb 2b                	jmp    804853c <__vprintf+0x31b>
 8048511:	c7 45 e4 44 a1 04 08 	movl   $0x804a144,-0x1c(%ebp)
 8048518:	eb 22                	jmp    804853c <__vprintf+0x31b>
 804851a:	c7 45 e4 68 a1 04 08 	movl   $0x804a168,-0x1c(%ebp)
 8048521:	eb 19                	jmp    804853c <__vprintf+0x31b>
 8048523:	68 78 a1 04 08       	push   $0x804a178
 8048528:	68 ac a3 04 08       	push   $0x804a3ac
 804852d:	68 14 01 00 00       	push   $0x114
 8048532:	68 9a a1 04 08       	push   $0x804a19a
 8048537:	e8 08 17 00 00       	call   8049c44 <debug_panic>
 804853c:	ff 75 14             	push   0x14(%ebp)
 804853f:	ff 75 10             	push   0x10(%ebp)
 8048542:	8d 45 cc             	lea    -0x34(%ebp),%eax
 8048545:	50                   	push   %eax
 8048546:	ff 75 e4             	push   -0x1c(%ebp)
 8048549:	6a 00                	push   $0x0
 804854b:	6a 00                	push   $0x0
 804854d:	ff 75 ec             	push   -0x14(%ebp)
 8048550:	ff 75 e8             	push   -0x18(%ebp)
 8048553:	e8 c1 03 00 00       	call   8048919 <format_integer>
 8048558:	83 c4 20             	add    $0x20,%esp
 804855b:	e9 ef 00 00 00       	jmp    804864f <__vprintf+0x42e>
 8048560:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048563:	8d 50 04             	lea    0x4(%eax),%edx
 8048566:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048569:	8b 00                	mov    (%eax),%eax
 804856b:	88 45 cb             	mov    %al,-0x35(%ebp)
 804856e:	83 ec 0c             	sub    $0xc,%esp
 8048571:	ff 75 14             	push   0x14(%ebp)
 8048574:	ff 75 10             	push   0x10(%ebp)
 8048577:	8d 45 cc             	lea    -0x34(%ebp),%eax
 804857a:	50                   	push   %eax
 804857b:	6a 01                	push   $0x1
 804857d:	8d 45 cb             	lea    -0x35(%ebp),%eax
 8048580:	50                   	push   %eax
 8048581:	e8 ed 06 00 00       	call   8048c73 <format_string>
 8048586:	83 c4 20             	add    $0x20,%esp
 8048589:	e9 c1 00 00 00       	jmp    804864f <__vprintf+0x42e>
 804858e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048591:	8d 50 04             	lea    0x4(%eax),%edx
 8048594:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048597:	8b 00                	mov    (%eax),%eax
 8048599:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804859c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 80485a0:	75 07                	jne    80485a9 <__vprintf+0x388>
 80485a2:	c7 45 e0 a9 a1 04 08 	movl   $0x804a1a9,-0x20(%ebp)
 80485a9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 80485ac:	83 ec 08             	sub    $0x8,%esp
 80485af:	50                   	push   %eax
 80485b0:	ff 75 e0             	push   -0x20(%ebp)
 80485b3:	e8 70 10 00 00       	call   8049628 <strnlen>
 80485b8:	83 c4 10             	add    $0x10,%esp
 80485bb:	89 c2                	mov    %eax,%edx
 80485bd:	83 ec 0c             	sub    $0xc,%esp
 80485c0:	ff 75 14             	push   0x14(%ebp)
 80485c3:	ff 75 10             	push   0x10(%ebp)
 80485c6:	8d 45 cc             	lea    -0x34(%ebp),%eax
 80485c9:	50                   	push   %eax
 80485ca:	52                   	push   %edx
 80485cb:	ff 75 e0             	push   -0x20(%ebp)
 80485ce:	e8 a0 06 00 00       	call   8048c73 <format_string>
 80485d3:	83 c4 20             	add    $0x20,%esp
 80485d6:	eb 77                	jmp    804864f <__vprintf+0x42e>
 80485d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80485db:	8d 50 04             	lea    0x4(%eax),%edx
 80485de:	89 55 0c             	mov    %edx,0xc(%ebp)
 80485e1:	8b 00                	mov    (%eax),%eax
 80485e3:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80485e6:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
 80485ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
 80485f0:	ba 00 00 00 00       	mov    $0x0,%edx
 80485f5:	ff 75 14             	push   0x14(%ebp)
 80485f8:	ff 75 10             	push   0x10(%ebp)
 80485fb:	8d 4d cc             	lea    -0x34(%ebp),%ecx
 80485fe:	51                   	push   %ecx
 80485ff:	68 44 a1 04 08       	push   $0x804a144
 8048604:	6a 00                	push   $0x0
 8048606:	6a 00                	push   $0x0
 8048608:	52                   	push   %edx
 8048609:	50                   	push   %eax
 804860a:	e8 0a 03 00 00       	call   8048919 <format_integer>
 804860f:	83 c4 20             	add    $0x20,%esp
 8048612:	eb 3b                	jmp    804864f <__vprintf+0x42e>
 8048614:	8b 45 08             	mov    0x8(%ebp),%eax
 8048617:	8a 00                	mov    (%eax),%al
 8048619:	0f be c0             	movsbl %al,%eax
 804861c:	50                   	push   %eax
 804861d:	ff 75 14             	push   0x14(%ebp)
 8048620:	ff 75 10             	push   0x10(%ebp)
 8048623:	68 b0 a1 04 08       	push   $0x804a1b0
 8048628:	e8 e1 06 00 00       	call   8048d0e <__printf>
 804862d:	83 c4 10             	add    $0x10,%esp
 8048630:	eb 1d                	jmp    804864f <__vprintf+0x42e>
 8048632:	8b 45 08             	mov    0x8(%ebp),%eax
 8048635:	8a 00                	mov    (%eax),%al
 8048637:	0f be c0             	movsbl %al,%eax
 804863a:	50                   	push   %eax
 804863b:	ff 75 14             	push   0x14(%ebp)
 804863e:	ff 75 10             	push   0x10(%ebp)
 8048641:	68 c6 a1 04 08       	push   $0x804a1c6
 8048646:	e8 c3 06 00 00       	call   8048d0e <__printf>
 804864b:	83 c4 10             	add    $0x10,%esp
 804864e:	90                   	nop
 804864f:	ff 45 08             	incl   0x8(%ebp)
 8048652:	8b 45 08             	mov    0x8(%ebp),%eax
 8048655:	8a 00                	mov    (%eax),%al
 8048657:	84 c0                	test   %al,%al
 8048659:	0f 85 ce fb ff ff    	jne    804822d <__vprintf+0xc>
 804865f:	90                   	nop
 8048660:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048663:	c9                   	leave  
 8048664:	c3                   	ret    

08048665 <parse_conversion>:
 8048665:	55                   	push   %ebp
 8048666:	89 e5                	mov    %esp,%ebp
 8048668:	8b 45 0c             	mov    0xc(%ebp),%eax
 804866b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8048671:	8b 45 08             	mov    0x8(%ebp),%eax
 8048674:	8d 50 01             	lea    0x1(%eax),%edx
 8048677:	89 55 08             	mov    %edx,0x8(%ebp)
 804867a:	8a 00                	mov    (%eax),%al
 804867c:	0f be c0             	movsbl %al,%eax
 804867f:	83 e8 20             	sub    $0x20,%eax
 8048682:	83 f8 10             	cmp    $0x10,%eax
 8048685:	77 6f                	ja     80486f6 <parse_conversion+0x91>
 8048687:	8b 04 85 f8 a2 04 08 	mov    0x804a2f8(,%eax,4),%eax
 804868e:	ff e0                	jmp    *%eax
 8048690:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048693:	8b 00                	mov    (%eax),%eax
 8048695:	83 c8 01             	or     $0x1,%eax
 8048698:	89 c2                	mov    %eax,%edx
 804869a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804869d:	89 10                	mov    %edx,(%eax)
 804869f:	eb 67                	jmp    8048708 <parse_conversion+0xa3>
 80486a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486a4:	8b 00                	mov    (%eax),%eax
 80486a6:	83 c8 02             	or     $0x2,%eax
 80486a9:	89 c2                	mov    %eax,%edx
 80486ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486ae:	89 10                	mov    %edx,(%eax)
 80486b0:	eb 56                	jmp    8048708 <parse_conversion+0xa3>
 80486b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486b5:	8b 00                	mov    (%eax),%eax
 80486b7:	83 c8 04             	or     $0x4,%eax
 80486ba:	89 c2                	mov    %eax,%edx
 80486bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486bf:	89 10                	mov    %edx,(%eax)
 80486c1:	eb 45                	jmp    8048708 <parse_conversion+0xa3>
 80486c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486c6:	8b 00                	mov    (%eax),%eax
 80486c8:	83 c8 08             	or     $0x8,%eax
 80486cb:	89 c2                	mov    %eax,%edx
 80486cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486d0:	89 10                	mov    %edx,(%eax)
 80486d2:	eb 34                	jmp    8048708 <parse_conversion+0xa3>
 80486d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486d7:	8b 00                	mov    (%eax),%eax
 80486d9:	83 c8 10             	or     $0x10,%eax
 80486dc:	89 c2                	mov    %eax,%edx
 80486de:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486e1:	89 10                	mov    %edx,(%eax)
 80486e3:	eb 23                	jmp    8048708 <parse_conversion+0xa3>
 80486e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486e8:	8b 00                	mov    (%eax),%eax
 80486ea:	83 c8 20             	or     $0x20,%eax
 80486ed:	89 c2                	mov    %eax,%edx
 80486ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486f2:	89 10                	mov    %edx,(%eax)
 80486f4:	eb 12                	jmp    8048708 <parse_conversion+0xa3>
 80486f6:	ff 4d 08             	decl   0x8(%ebp)
 80486f9:	90                   	nop
 80486fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486fd:	8b 00                	mov    (%eax),%eax
 80486ff:	83 e0 01             	and    $0x1,%eax
 8048702:	85 c0                	test   %eax,%eax
 8048704:	74 16                	je     804871c <parse_conversion+0xb7>
 8048706:	eb 05                	jmp    804870d <parse_conversion+0xa8>
 8048708:	e9 64 ff ff ff       	jmp    8048671 <parse_conversion+0xc>
 804870d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048710:	8b 00                	mov    (%eax),%eax
 8048712:	83 e0 ef             	and    $0xffffffef,%eax
 8048715:	89 c2                	mov    %eax,%edx
 8048717:	8b 45 0c             	mov    0xc(%ebp),%eax
 804871a:	89 10                	mov    %edx,(%eax)
 804871c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804871f:	8b 00                	mov    (%eax),%eax
 8048721:	83 e0 02             	and    $0x2,%eax
 8048724:	85 c0                	test   %eax,%eax
 8048726:	74 0f                	je     8048737 <parse_conversion+0xd2>
 8048728:	8b 45 0c             	mov    0xc(%ebp),%eax
 804872b:	8b 00                	mov    (%eax),%eax
 804872d:	83 e0 fb             	and    $0xfffffffb,%eax
 8048730:	89 c2                	mov    %eax,%edx
 8048732:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048735:	89 10                	mov    %edx,(%eax)
 8048737:	8b 45 0c             	mov    0xc(%ebp),%eax
 804873a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8048741:	8b 45 08             	mov    0x8(%ebp),%eax
 8048744:	8a 00                	mov    (%eax),%al
 8048746:	3c 2a                	cmp    $0x2a,%al
 8048748:	75 41                	jne    804878b <parse_conversion+0x126>
 804874a:	ff 45 08             	incl   0x8(%ebp)
 804874d:	8b 45 10             	mov    0x10(%ebp),%eax
 8048750:	8b 00                	mov    (%eax),%eax
 8048752:	8d 48 04             	lea    0x4(%eax),%ecx
 8048755:	8b 55 10             	mov    0x10(%ebp),%edx
 8048758:	89 0a                	mov    %ecx,(%edx)
 804875a:	8b 10                	mov    (%eax),%edx
 804875c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804875f:	89 50 04             	mov    %edx,0x4(%eax)
 8048762:	eb 3c                	jmp    80487a0 <parse_conversion+0x13b>
 8048764:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048767:	8b 50 04             	mov    0x4(%eax),%edx
 804876a:	89 d0                	mov    %edx,%eax
 804876c:	c1 e0 02             	shl    $0x2,%eax
 804876f:	01 d0                	add    %edx,%eax
 8048771:	01 c0                	add    %eax,%eax
 8048773:	89 c2                	mov    %eax,%edx
 8048775:	8b 45 08             	mov    0x8(%ebp),%eax
 8048778:	8a 00                	mov    (%eax),%al
 804877a:	0f be c0             	movsbl %al,%eax
 804877d:	01 d0                	add    %edx,%eax
 804877f:	8d 50 d0             	lea    -0x30(%eax),%edx
 8048782:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048785:	89 50 04             	mov    %edx,0x4(%eax)
 8048788:	ff 45 08             	incl   0x8(%ebp)
 804878b:	8b 45 08             	mov    0x8(%ebp),%eax
 804878e:	8a 00                	mov    (%eax),%al
 8048790:	0f be c0             	movsbl %al,%eax
 8048793:	50                   	push   %eax
 8048794:	e8 70 f9 ff ff       	call   8048109 <isdigit>
 8048799:	83 c4 04             	add    $0x4,%esp
 804879c:	85 c0                	test   %eax,%eax
 804879e:	75 c4                	jne    8048764 <parse_conversion+0xff>
 80487a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487a3:	8b 40 04             	mov    0x4(%eax),%eax
 80487a6:	85 c0                	test   %eax,%eax
 80487a8:	79 1f                	jns    80487c9 <parse_conversion+0x164>
 80487aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487ad:	8b 40 04             	mov    0x4(%eax),%eax
 80487b0:	f7 d8                	neg    %eax
 80487b2:	89 c2                	mov    %eax,%edx
 80487b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487b7:	89 50 04             	mov    %edx,0x4(%eax)
 80487ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487bd:	8b 00                	mov    (%eax),%eax
 80487bf:	83 c8 01             	or     $0x1,%eax
 80487c2:	89 c2                	mov    %eax,%edx
 80487c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487c7:	89 10                	mov    %edx,(%eax)
 80487c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487cc:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
 80487d3:	8b 45 08             	mov    0x8(%ebp),%eax
 80487d6:	8a 00                	mov    (%eax),%al
 80487d8:	3c 2e                	cmp    $0x2e,%al
 80487da:	0f 85 82 00 00 00    	jne    8048862 <parse_conversion+0x1fd>
 80487e0:	ff 45 08             	incl   0x8(%ebp)
 80487e3:	8b 45 08             	mov    0x8(%ebp),%eax
 80487e6:	8a 00                	mov    (%eax),%al
 80487e8:	3c 2a                	cmp    $0x2a,%al
 80487ea:	75 1a                	jne    8048806 <parse_conversion+0x1a1>
 80487ec:	ff 45 08             	incl   0x8(%ebp)
 80487ef:	8b 45 10             	mov    0x10(%ebp),%eax
 80487f2:	8b 00                	mov    (%eax),%eax
 80487f4:	8d 48 04             	lea    0x4(%eax),%ecx
 80487f7:	8b 55 10             	mov    0x10(%ebp),%edx
 80487fa:	89 0a                	mov    %ecx,(%edx)
 80487fc:	8b 10                	mov    (%eax),%edx
 80487fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048801:	89 50 08             	mov    %edx,0x8(%eax)
 8048804:	eb 48                	jmp    804884e <parse_conversion+0x1e9>
 8048806:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048809:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 8048810:	eb 27                	jmp    8048839 <parse_conversion+0x1d4>
 8048812:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048815:	8b 50 08             	mov    0x8(%eax),%edx
 8048818:	89 d0                	mov    %edx,%eax
 804881a:	c1 e0 02             	shl    $0x2,%eax
 804881d:	01 d0                	add    %edx,%eax
 804881f:	01 c0                	add    %eax,%eax
 8048821:	89 c2                	mov    %eax,%edx
 8048823:	8b 45 08             	mov    0x8(%ebp),%eax
 8048826:	8a 00                	mov    (%eax),%al
 8048828:	0f be c0             	movsbl %al,%eax
 804882b:	01 d0                	add    %edx,%eax
 804882d:	8d 50 d0             	lea    -0x30(%eax),%edx
 8048830:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048833:	89 50 08             	mov    %edx,0x8(%eax)
 8048836:	ff 45 08             	incl   0x8(%ebp)
 8048839:	8b 45 08             	mov    0x8(%ebp),%eax
 804883c:	8a 00                	mov    (%eax),%al
 804883e:	0f be c0             	movsbl %al,%eax
 8048841:	50                   	push   %eax
 8048842:	e8 c2 f8 ff ff       	call   8048109 <isdigit>
 8048847:	83 c4 04             	add    $0x4,%esp
 804884a:	85 c0                	test   %eax,%eax
 804884c:	75 c4                	jne    8048812 <parse_conversion+0x1ad>
 804884e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048851:	8b 40 08             	mov    0x8(%eax),%eax
 8048854:	85 c0                	test   %eax,%eax
 8048856:	79 0a                	jns    8048862 <parse_conversion+0x1fd>
 8048858:	8b 45 0c             	mov    0xc(%ebp),%eax
 804885b:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
 8048862:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048865:	8b 40 08             	mov    0x8(%eax),%eax
 8048868:	85 c0                	test   %eax,%eax
 804886a:	78 0f                	js     804887b <parse_conversion+0x216>
 804886c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804886f:	8b 00                	mov    (%eax),%eax
 8048871:	83 e0 ef             	and    $0xffffffef,%eax
 8048874:	89 c2                	mov    %eax,%edx
 8048876:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048879:	89 10                	mov    %edx,(%eax)
 804887b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804887e:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
 8048885:	8b 45 08             	mov    0x8(%ebp),%eax
 8048888:	8d 50 01             	lea    0x1(%eax),%edx
 804888b:	89 55 08             	mov    %edx,0x8(%ebp)
 804888e:	8a 00                	mov    (%eax),%al
 8048890:	0f be c0             	movsbl %al,%eax
 8048893:	83 e8 68             	sub    $0x68,%eax
 8048896:	83 f8 12             	cmp    $0x12,%eax
 8048899:	77 75                	ja     8048910 <parse_conversion+0x2ab>
 804889b:	8b 04 85 3c a3 04 08 	mov    0x804a33c(,%eax,4),%eax
 80488a2:	ff e0                	jmp    *%eax
 80488a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80488a7:	8a 00                	mov    (%eax),%al
 80488a9:	3c 68                	cmp    $0x68,%al
 80488ab:	75 0f                	jne    80488bc <parse_conversion+0x257>
 80488ad:	ff 45 08             	incl   0x8(%ebp)
 80488b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488b3:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
 80488ba:	eb 58                	jmp    8048914 <parse_conversion+0x2af>
 80488bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488bf:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
 80488c6:	eb 4c                	jmp    8048914 <parse_conversion+0x2af>
 80488c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488cb:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
 80488d2:	eb 40                	jmp    8048914 <parse_conversion+0x2af>
 80488d4:	8b 45 08             	mov    0x8(%ebp),%eax
 80488d7:	8a 00                	mov    (%eax),%al
 80488d9:	3c 6c                	cmp    $0x6c,%al
 80488db:	75 0f                	jne    80488ec <parse_conversion+0x287>
 80488dd:	ff 45 08             	incl   0x8(%ebp)
 80488e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488e3:	c7 40 0c 06 00 00 00 	movl   $0x6,0xc(%eax)
 80488ea:	eb 28                	jmp    8048914 <parse_conversion+0x2af>
 80488ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488ef:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
 80488f6:	eb 1c                	jmp    8048914 <parse_conversion+0x2af>
 80488f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488fb:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
 8048902:	eb 10                	jmp    8048914 <parse_conversion+0x2af>
 8048904:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048907:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
 804890e:	eb 04                	jmp    8048914 <parse_conversion+0x2af>
 8048910:	ff 4d 08             	decl   0x8(%ebp)
 8048913:	90                   	nop
 8048914:	8b 45 08             	mov    0x8(%ebp),%eax
 8048917:	c9                   	leave  
 8048918:	c3                   	ret    

08048919 <format_integer>:
 8048919:	55                   	push   %ebp
 804891a:	89 e5                	mov    %esp,%ebp
 804891c:	57                   	push   %edi
 804891d:	56                   	push   %esi
 804891e:	53                   	push   %ebx
 804891f:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 8048925:	8b 45 10             	mov    0x10(%ebp),%eax
 8048928:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
 804892e:	8b 5d 14             	mov    0x14(%ebp),%ebx
 8048931:	8b 45 08             	mov    0x8(%ebp),%eax
 8048934:	89 45 80             	mov    %eax,-0x80(%ebp)
 8048937:	8b 45 0c             	mov    0xc(%ebp),%eax
 804893a:	89 45 84             	mov    %eax,-0x7c(%ebp)
 804893d:	8a 85 6c ff ff ff    	mov    -0x94(%ebp),%al
 8048943:	88 85 7c ff ff ff    	mov    %al,-0x84(%ebp)
 8048949:	88 9d 78 ff ff ff    	mov    %bl,-0x88(%ebp)
 804894f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8048956:	80 bd 7c ff ff ff 00 	cmpb   $0x0,-0x84(%ebp)
 804895d:	74 5c                	je     80489bb <format_integer+0xa2>
 804895f:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048962:	8b 00                	mov    (%eax),%eax
 8048964:	83 e0 02             	and    $0x2,%eax
 8048967:	85 c0                	test   %eax,%eax
 8048969:	74 1a                	je     8048985 <format_integer+0x6c>
 804896b:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8048972:	74 07                	je     804897b <format_integer+0x62>
 8048974:	b8 2d 00 00 00       	mov    $0x2d,%eax
 8048979:	eb 05                	jmp    8048980 <format_integer+0x67>
 804897b:	b8 2b 00 00 00       	mov    $0x2b,%eax
 8048980:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048983:	eb 36                	jmp    80489bb <format_integer+0xa2>
 8048985:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048988:	8b 00                	mov    (%eax),%eax
 804898a:	83 e0 04             	and    $0x4,%eax
 804898d:	85 c0                	test   %eax,%eax
 804898f:	74 1a                	je     80489ab <format_integer+0x92>
 8048991:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8048998:	74 07                	je     80489a1 <format_integer+0x88>
 804899a:	b8 2d 00 00 00       	mov    $0x2d,%eax
 804899f:	eb 05                	jmp    80489a6 <format_integer+0x8d>
 80489a1:	b8 20 00 00 00       	mov    $0x20,%eax
 80489a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80489a9:	eb 10                	jmp    80489bb <format_integer+0xa2>
 80489ab:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 80489b2:	74 07                	je     80489bb <format_integer+0xa2>
 80489b4:	c7 45 e0 2d 00 00 00 	movl   $0x2d,-0x20(%ebp)
 80489bb:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80489be:	8b 00                	mov    (%eax),%eax
 80489c0:	83 e0 08             	and    $0x8,%eax
 80489c3:	85 c0                	test   %eax,%eax
 80489c5:	74 20                	je     80489e7 <format_integer+0xce>
 80489c7:	8b 45 80             	mov    -0x80(%ebp),%eax
 80489ca:	80 f4 00             	xor    $0x0,%ah
 80489cd:	89 c2                	mov    %eax,%edx
 80489cf:	8b 45 84             	mov    -0x7c(%ebp),%eax
 80489d2:	80 f4 00             	xor    $0x0,%ah
 80489d5:	89 c1                	mov    %eax,%ecx
 80489d7:	89 c8                	mov    %ecx,%eax
 80489d9:	09 d0                	or     %edx,%eax
 80489db:	85 c0                	test   %eax,%eax
 80489dd:	74 08                	je     80489e7 <format_integer+0xce>
 80489df:	8b 45 18             	mov    0x18(%ebp),%eax
 80489e2:	8b 40 08             	mov    0x8(%eax),%eax
 80489e5:	eb 05                	jmp    80489ec <format_integer+0xd3>
 80489e7:	b8 00 00 00 00       	mov    $0x0,%eax
 80489ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80489ef:	8d 45 90             	lea    -0x70(%ebp),%eax
 80489f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80489f5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 80489fc:	e9 82 00 00 00       	jmp    8048a83 <format_integer+0x16a>
 8048a01:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048a04:	8b 00                	mov    (%eax),%eax
 8048a06:	83 e0 20             	and    $0x20,%eax
 8048a09:	85 c0                	test   %eax,%eax
 8048a0b:	74 24                	je     8048a31 <format_integer+0x118>
 8048a0d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 8048a11:	7e 1e                	jle    8048a31 <format_integer+0x118>
 8048a13:	8b 45 18             	mov    0x18(%ebp),%eax
 8048a16:	8b 48 0c             	mov    0xc(%eax),%ecx
 8048a19:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8048a1c:	99                   	cltd   
 8048a1d:	f7 f9                	idiv   %ecx
 8048a1f:	89 d0                	mov    %edx,%eax
 8048a21:	85 c0                	test   %eax,%eax
 8048a23:	75 0c                	jne    8048a31 <format_integer+0x118>
 8048a25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048a28:	8d 50 01             	lea    0x1(%eax),%edx
 8048a2b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048a2e:	c6 00 2c             	movb   $0x2c,(%eax)
 8048a31:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 8048a34:	8d 46 01             	lea    0x1(%esi),%eax
 8048a37:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8048a3a:	8b 45 18             	mov    0x18(%ebp),%eax
 8048a3d:	8b 78 04             	mov    0x4(%eax),%edi
 8048a40:	8b 45 18             	mov    0x18(%ebp),%eax
 8048a43:	8b 00                	mov    (%eax),%eax
 8048a45:	89 c1                	mov    %eax,%ecx
 8048a47:	89 c3                	mov    %eax,%ebx
 8048a49:	c1 fb 1f             	sar    $0x1f,%ebx
 8048a4c:	8b 45 80             	mov    -0x80(%ebp),%eax
 8048a4f:	8b 55 84             	mov    -0x7c(%ebp),%edx
 8048a52:	53                   	push   %ebx
 8048a53:	51                   	push   %ecx
 8048a54:	52                   	push   %edx
 8048a55:	50                   	push   %eax
 8048a56:	e8 b0 11 00 00       	call   8049c0b <__umoddi3>
 8048a5b:	83 c4 10             	add    $0x10,%esp
 8048a5e:	01 f8                	add    %edi,%eax
 8048a60:	8a 00                	mov    (%eax),%al
 8048a62:	88 06                	mov    %al,(%esi)
 8048a64:	8b 45 18             	mov    0x18(%ebp),%eax
 8048a67:	8b 00                	mov    (%eax),%eax
 8048a69:	99                   	cltd   
 8048a6a:	52                   	push   %edx
 8048a6b:	50                   	push   %eax
 8048a6c:	ff 75 84             	push   -0x7c(%ebp)
 8048a6f:	ff 75 80             	push   -0x80(%ebp)
 8048a72:	e8 60 11 00 00       	call   8049bd7 <__udivdi3>
 8048a77:	83 c4 10             	add    $0x10,%esp
 8048a7a:	89 45 80             	mov    %eax,-0x80(%ebp)
 8048a7d:	89 55 84             	mov    %edx,-0x7c(%ebp)
 8048a80:	ff 45 d8             	incl   -0x28(%ebp)
 8048a83:	8b 45 80             	mov    -0x80(%ebp),%eax
 8048a86:	80 f4 00             	xor    $0x0,%ah
 8048a89:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
 8048a8f:	8b 45 84             	mov    -0x7c(%ebp),%eax
 8048a92:	80 f4 00             	xor    $0x0,%ah
 8048a95:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8048a9b:	8b 9d 70 ff ff ff    	mov    -0x90(%ebp),%ebx
 8048aa1:	8b b5 74 ff ff ff    	mov    -0x8c(%ebp),%esi
 8048aa7:	89 f0                	mov    %esi,%eax
 8048aa9:	09 d8                	or     %ebx,%eax
 8048aab:	85 c0                	test   %eax,%eax
 8048aad:	0f 85 4e ff ff ff    	jne    8048a01 <format_integer+0xe8>
 8048ab3:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048ab6:	8b 40 08             	mov    0x8(%eax),%eax
 8048ab9:	85 c0                	test   %eax,%eax
 8048abb:	78 08                	js     8048ac5 <format_integer+0x1ac>
 8048abd:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048ac0:	8b 40 08             	mov    0x8(%eax),%eax
 8048ac3:	eb 05                	jmp    8048aca <format_integer+0x1b1>
 8048ac5:	b8 01 00 00 00       	mov    $0x1,%eax
 8048aca:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8048acd:	eb 0c                	jmp    8048adb <format_integer+0x1c2>
 8048acf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048ad2:	8d 50 01             	lea    0x1(%eax),%edx
 8048ad5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048ad8:	c6 00 30             	movb   $0x30,(%eax)
 8048adb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048ade:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048ae1:	29 c2                	sub    %eax,%edx
 8048ae3:	89 d0                	mov    %edx,%eax
 8048ae5:	3b 45 d0             	cmp    -0x30(%ebp),%eax
 8048ae8:	7d 0b                	jge    8048af5 <format_integer+0x1dc>
 8048aea:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048aed:	83 c0 3f             	add    $0x3f,%eax
 8048af0:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8048af3:	77 da                	ja     8048acf <format_integer+0x1b6>
 8048af5:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048af8:	8b 00                	mov    (%eax),%eax
 8048afa:	83 e0 08             	and    $0x8,%eax
 8048afd:	85 c0                	test   %eax,%eax
 8048aff:	74 28                	je     8048b29 <format_integer+0x210>
 8048b01:	8b 45 18             	mov    0x18(%ebp),%eax
 8048b04:	8b 00                	mov    (%eax),%eax
 8048b06:	83 f8 08             	cmp    $0x8,%eax
 8048b09:	75 1e                	jne    8048b29 <format_integer+0x210>
 8048b0b:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048b0e:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 8048b11:	74 0a                	je     8048b1d <format_integer+0x204>
 8048b13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048b16:	48                   	dec    %eax
 8048b17:	8a 00                	mov    (%eax),%al
 8048b19:	3c 30                	cmp    $0x30,%al
 8048b1b:	74 0c                	je     8048b29 <format_integer+0x210>
 8048b1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048b20:	8d 50 01             	lea    0x1(%eax),%edx
 8048b23:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048b26:	c6 00 30             	movb   $0x30,(%eax)
 8048b29:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048b2c:	8b 40 04             	mov    0x4(%eax),%eax
 8048b2f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8048b32:	8d 55 90             	lea    -0x70(%ebp),%edx
 8048b35:	29 d1                	sub    %edx,%ecx
 8048b37:	89 ca                	mov    %ecx,%edx
 8048b39:	29 d0                	sub    %edx,%eax
 8048b3b:	89 c2                	mov    %eax,%edx
 8048b3d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8048b41:	74 07                	je     8048b4a <format_integer+0x231>
 8048b43:	b8 02 00 00 00       	mov    $0x2,%eax
 8048b48:	eb 05                	jmp    8048b4f <format_integer+0x236>
 8048b4a:	b8 00 00 00 00       	mov    $0x0,%eax
 8048b4f:	29 c2                	sub    %eax,%edx
 8048b51:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8048b55:	0f 95 c0             	setne  %al
 8048b58:	0f b6 c0             	movzbl %al,%eax
 8048b5b:	29 c2                	sub    %eax,%edx
 8048b5d:	89 d0                	mov    %edx,%eax
 8048b5f:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048b62:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8048b66:	79 07                	jns    8048b6f <format_integer+0x256>
 8048b68:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048b6f:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048b72:	8b 00                	mov    (%eax),%eax
 8048b74:	83 e0 11             	and    $0x11,%eax
 8048b77:	85 c0                	test   %eax,%eax
 8048b79:	75 14                	jne    8048b8f <format_integer+0x276>
 8048b7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048b7e:	ff 75 24             	push   0x24(%ebp)
 8048b81:	ff 75 20             	push   0x20(%ebp)
 8048b84:	50                   	push   %eax
 8048b85:	6a 20                	push   $0x20
 8048b87:	e8 b6 00 00 00       	call   8048c42 <output_dup>
 8048b8c:	83 c4 10             	add    $0x10,%esp
 8048b8f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8048b93:	74 15                	je     8048baa <format_integer+0x291>
 8048b95:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048b98:	0f be c0             	movsbl %al,%eax
 8048b9b:	83 ec 08             	sub    $0x8,%esp
 8048b9e:	ff 75 24             	push   0x24(%ebp)
 8048ba1:	50                   	push   %eax
 8048ba2:	8b 45 20             	mov    0x20(%ebp),%eax
 8048ba5:	ff d0                	call   *%eax
 8048ba7:	83 c4 10             	add    $0x10,%esp
 8048baa:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8048bae:	74 25                	je     8048bd5 <format_integer+0x2bc>
 8048bb0:	83 ec 08             	sub    $0x8,%esp
 8048bb3:	ff 75 24             	push   0x24(%ebp)
 8048bb6:	6a 30                	push   $0x30
 8048bb8:	8b 45 20             	mov    0x20(%ebp),%eax
 8048bbb:	ff d0                	call   *%eax
 8048bbd:	83 c4 10             	add    $0x10,%esp
 8048bc0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8048bc3:	0f be c0             	movsbl %al,%eax
 8048bc6:	83 ec 08             	sub    $0x8,%esp
 8048bc9:	ff 75 24             	push   0x24(%ebp)
 8048bcc:	50                   	push   %eax
 8048bcd:	8b 45 20             	mov    0x20(%ebp),%eax
 8048bd0:	ff d0                	call   *%eax
 8048bd2:	83 c4 10             	add    $0x10,%esp
 8048bd5:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048bd8:	8b 00                	mov    (%eax),%eax
 8048bda:	83 e0 10             	and    $0x10,%eax
 8048bdd:	85 c0                	test   %eax,%eax
 8048bdf:	74 30                	je     8048c11 <format_integer+0x2f8>
 8048be1:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048be4:	ff 75 24             	push   0x24(%ebp)
 8048be7:	ff 75 20             	push   0x20(%ebp)
 8048bea:	50                   	push   %eax
 8048beb:	6a 30                	push   $0x30
 8048bed:	e8 50 00 00 00       	call   8048c42 <output_dup>
 8048bf2:	83 c4 10             	add    $0x10,%esp
 8048bf5:	eb 1a                	jmp    8048c11 <format_integer+0x2f8>
 8048bf7:	ff 4d e4             	decl   -0x1c(%ebp)
 8048bfa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048bfd:	8a 00                	mov    (%eax),%al
 8048bff:	0f be c0             	movsbl %al,%eax
 8048c02:	83 ec 08             	sub    $0x8,%esp
 8048c05:	ff 75 24             	push   0x24(%ebp)
 8048c08:	50                   	push   %eax
 8048c09:	8b 45 20             	mov    0x20(%ebp),%eax
 8048c0c:	ff d0                	call   *%eax
 8048c0e:	83 c4 10             	add    $0x10,%esp
 8048c11:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048c14:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 8048c17:	77 de                	ja     8048bf7 <format_integer+0x2de>
 8048c19:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048c1c:	8b 00                	mov    (%eax),%eax
 8048c1e:	83 e0 01             	and    $0x1,%eax
 8048c21:	85 c0                	test   %eax,%eax
 8048c23:	74 14                	je     8048c39 <format_integer+0x320>
 8048c25:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048c28:	ff 75 24             	push   0x24(%ebp)
 8048c2b:	ff 75 20             	push   0x20(%ebp)
 8048c2e:	50                   	push   %eax
 8048c2f:	6a 20                	push   $0x20
 8048c31:	e8 0c 00 00 00       	call   8048c42 <output_dup>
 8048c36:	83 c4 10             	add    $0x10,%esp
 8048c39:	90                   	nop
 8048c3a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048c3d:	5b                   	pop    %ebx
 8048c3e:	5e                   	pop    %esi
 8048c3f:	5f                   	pop    %edi
 8048c40:	5d                   	pop    %ebp
 8048c41:	c3                   	ret    

08048c42 <output_dup>:
 8048c42:	55                   	push   %ebp
 8048c43:	89 e5                	mov    %esp,%ebp
 8048c45:	83 ec 18             	sub    $0x18,%esp
 8048c48:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c4b:	88 45 f4             	mov    %al,-0xc(%ebp)
 8048c4e:	eb 13                	jmp    8048c63 <output_dup+0x21>
 8048c50:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
 8048c54:	83 ec 08             	sub    $0x8,%esp
 8048c57:	ff 75 14             	push   0x14(%ebp)
 8048c5a:	50                   	push   %eax
 8048c5b:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c5e:	ff d0                	call   *%eax
 8048c60:	83 c4 10             	add    $0x10,%esp
 8048c63:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c66:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048c69:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048c6c:	85 c0                	test   %eax,%eax
 8048c6e:	75 e0                	jne    8048c50 <output_dup+0xe>
 8048c70:	90                   	nop
 8048c71:	c9                   	leave  
 8048c72:	c3                   	ret    

08048c73 <format_string>:
 8048c73:	55                   	push   %ebp
 8048c74:	89 e5                	mov    %esp,%ebp
 8048c76:	83 ec 18             	sub    $0x18,%esp
 8048c79:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c7c:	8b 40 04             	mov    0x4(%eax),%eax
 8048c7f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048c82:	7e 26                	jle    8048caa <format_string+0x37>
 8048c84:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c87:	8b 00                	mov    (%eax),%eax
 8048c89:	83 e0 01             	and    $0x1,%eax
 8048c8c:	85 c0                	test   %eax,%eax
 8048c8e:	75 1a                	jne    8048caa <format_string+0x37>
 8048c90:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c93:	8b 40 04             	mov    0x4(%eax),%eax
 8048c96:	2b 45 0c             	sub    0xc(%ebp),%eax
 8048c99:	ff 75 18             	push   0x18(%ebp)
 8048c9c:	ff 75 14             	push   0x14(%ebp)
 8048c9f:	50                   	push   %eax
 8048ca0:	6a 20                	push   $0x20
 8048ca2:	e8 9b ff ff ff       	call   8048c42 <output_dup>
 8048ca7:	83 c4 10             	add    $0x10,%esp
 8048caa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048cb1:	eb 1f                	jmp    8048cd2 <format_string+0x5f>
 8048cb3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048cb6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048cb9:	01 d0                	add    %edx,%eax
 8048cbb:	8a 00                	mov    (%eax),%al
 8048cbd:	0f be c0             	movsbl %al,%eax
 8048cc0:	83 ec 08             	sub    $0x8,%esp
 8048cc3:	ff 75 18             	push   0x18(%ebp)
 8048cc6:	50                   	push   %eax
 8048cc7:	8b 45 14             	mov    0x14(%ebp),%eax
 8048cca:	ff d0                	call   *%eax
 8048ccc:	83 c4 10             	add    $0x10,%esp
 8048ccf:	ff 45 f4             	incl   -0xc(%ebp)
 8048cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cd5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048cd8:	7c d9                	jl     8048cb3 <format_string+0x40>
 8048cda:	8b 45 10             	mov    0x10(%ebp),%eax
 8048cdd:	8b 40 04             	mov    0x4(%eax),%eax
 8048ce0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048ce3:	7e 26                	jle    8048d0b <format_string+0x98>
 8048ce5:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ce8:	8b 00                	mov    (%eax),%eax
 8048cea:	83 e0 01             	and    $0x1,%eax
 8048ced:	85 c0                	test   %eax,%eax
 8048cef:	74 1a                	je     8048d0b <format_string+0x98>
 8048cf1:	8b 45 10             	mov    0x10(%ebp),%eax
 8048cf4:	8b 40 04             	mov    0x4(%eax),%eax
 8048cf7:	2b 45 0c             	sub    0xc(%ebp),%eax
 8048cfa:	ff 75 18             	push   0x18(%ebp)
 8048cfd:	ff 75 14             	push   0x14(%ebp)
 8048d00:	50                   	push   %eax
 8048d01:	6a 20                	push   $0x20
 8048d03:	e8 3a ff ff ff       	call   8048c42 <output_dup>
 8048d08:	83 c4 10             	add    $0x10,%esp
 8048d0b:	90                   	nop
 8048d0c:	c9                   	leave  
 8048d0d:	c3                   	ret    

08048d0e <__printf>:
 8048d0e:	55                   	push   %ebp
 8048d0f:	89 e5                	mov    %esp,%ebp
 8048d11:	83 ec 18             	sub    $0x18,%esp
 8048d14:	8d 45 14             	lea    0x14(%ebp),%eax
 8048d17:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048d1d:	ff 75 10             	push   0x10(%ebp)
 8048d20:	ff 75 0c             	push   0xc(%ebp)
 8048d23:	50                   	push   %eax
 8048d24:	ff 75 08             	push   0x8(%ebp)
 8048d27:	e8 f5 f4 ff ff       	call   8048221 <__vprintf>
 8048d2c:	83 c4 10             	add    $0x10,%esp
 8048d2f:	90                   	nop
 8048d30:	c9                   	leave  
 8048d31:	c3                   	ret    

08048d32 <hex_dump>:
 8048d32:	55                   	push   %ebp
 8048d33:	89 e5                	mov    %esp,%ebp
 8048d35:	83 ec 38             	sub    $0x38,%esp
 8048d38:	8b 45 14             	mov    0x14(%ebp),%eax
 8048d3b:	88 45 d4             	mov    %al,-0x2c(%ebp)
 8048d3e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d41:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d44:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%ebp)
 8048d4b:	e9 b4 01 00 00       	jmp    8048f04 <hex_dump+0x1d2>
 8048d50:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d53:	ba 00 00 00 00       	mov    $0x0,%edx
 8048d58:	f7 75 e8             	divl   -0x18(%ebp)
 8048d5b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048d5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d61:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048d64:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d67:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048d6a:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048d6d:	76 0b                	jbe    8048d7a <hex_dump+0x48>
 8048d6f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048d72:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d75:	01 d0                	add    %edx,%eax
 8048d77:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048d7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d7d:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048d80:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048d83:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d86:	ba 00 00 00 00       	mov    $0x0,%edx
 8048d8b:	f7 75 e8             	divl   -0x18(%ebp)
 8048d8e:	0f af 45 e8          	imul   -0x18(%ebp),%eax
 8048d92:	ba 00 00 00 00       	mov    $0x0,%edx
 8048d97:	83 ec 04             	sub    $0x4,%esp
 8048d9a:	52                   	push   %edx
 8048d9b:	50                   	push   %eax
 8048d9c:	68 88 a3 04 08       	push   $0x804a388
 8048da1:	e8 55 f4 ff ff       	call   80481fb <printf>
 8048da6:	83 c4 10             	add    $0x10,%esp
 8048da9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048db0:	eb 13                	jmp    8048dc5 <hex_dump+0x93>
 8048db2:	83 ec 0c             	sub    $0xc,%esp
 8048db5:	68 90 a3 04 08       	push   $0x804a390
 8048dba:	e8 3c f4 ff ff       	call   80481fb <printf>
 8048dbf:	83 c4 10             	add    $0x10,%esp
 8048dc2:	ff 45 ec             	incl   -0x14(%ebp)
 8048dc5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048dc8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8048dcb:	72 e5                	jb     8048db2 <hex_dump+0x80>
 8048dcd:	eb 3e                	jmp    8048e0d <hex_dump+0xdb>
 8048dcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048dd2:	d1 e8                	shr    %eax
 8048dd4:	48                   	dec    %eax
 8048dd5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8048dd8:	75 07                	jne    8048de1 <hex_dump+0xaf>
 8048dda:	ba 2d 00 00 00       	mov    $0x2d,%edx
 8048ddf:	eb 05                	jmp    8048de6 <hex_dump+0xb4>
 8048de1:	ba 20 00 00 00       	mov    $0x20,%edx
 8048de6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048de9:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048dec:	89 c1                	mov    %eax,%ecx
 8048dee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048df1:	01 c8                	add    %ecx,%eax
 8048df3:	8a 00                	mov    (%eax),%al
 8048df5:	0f b6 c0             	movzbl %al,%eax
 8048df8:	83 ec 04             	sub    $0x4,%esp
 8048dfb:	52                   	push   %edx
 8048dfc:	50                   	push   %eax
 8048dfd:	68 94 a3 04 08       	push   $0x804a394
 8048e02:	e8 f4 f3 ff ff       	call   80481fb <printf>
 8048e07:	83 c4 10             	add    $0x10,%esp
 8048e0a:	ff 45 ec             	incl   -0x14(%ebp)
 8048e0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e10:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8048e13:	72 ba                	jb     8048dcf <hex_dump+0x9d>
 8048e15:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
 8048e19:	0f 84 c6 00 00 00    	je     8048ee5 <hex_dump+0x1b3>
 8048e1f:	eb 13                	jmp    8048e34 <hex_dump+0x102>
 8048e21:	83 ec 0c             	sub    $0xc,%esp
 8048e24:	68 90 a3 04 08       	push   $0x804a390
 8048e29:	e8 cd f3 ff ff       	call   80481fb <printf>
 8048e2e:	83 c4 10             	add    $0x10,%esp
 8048e31:	ff 45 ec             	incl   -0x14(%ebp)
 8048e34:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e37:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 8048e3a:	72 e5                	jb     8048e21 <hex_dump+0xef>
 8048e3c:	83 ec 0c             	sub    $0xc,%esp
 8048e3f:	6a 7c                	push   $0x7c
 8048e41:	e8 08 11 00 00       	call   8049f4e <putchar>
 8048e46:	83 c4 10             	add    $0x10,%esp
 8048e49:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048e50:	eb 10                	jmp    8048e62 <hex_dump+0x130>
 8048e52:	83 ec 0c             	sub    $0xc,%esp
 8048e55:	6a 20                	push   $0x20
 8048e57:	e8 f2 10 00 00       	call   8049f4e <putchar>
 8048e5c:	83 c4 10             	add    $0x10,%esp
 8048e5f:	ff 45 ec             	incl   -0x14(%ebp)
 8048e62:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e65:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8048e68:	72 e8                	jb     8048e52 <hex_dump+0x120>
 8048e6a:	eb 4a                	jmp    8048eb6 <hex_dump+0x184>
 8048e6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e6f:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048e72:	89 c2                	mov    %eax,%edx
 8048e74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e77:	01 d0                	add    %edx,%eax
 8048e79:	8a 00                	mov    (%eax),%al
 8048e7b:	0f b6 c0             	movzbl %al,%eax
 8048e7e:	83 ec 0c             	sub    $0xc,%esp
 8048e81:	50                   	push   %eax
 8048e82:	e8 9f f2 ff ff       	call   8048126 <isprint>
 8048e87:	83 c4 10             	add    $0x10,%esp
 8048e8a:	85 c0                	test   %eax,%eax
 8048e8c:	74 14                	je     8048ea2 <hex_dump+0x170>
 8048e8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e91:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048e94:	89 c2                	mov    %eax,%edx
 8048e96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e99:	01 d0                	add    %edx,%eax
 8048e9b:	8a 00                	mov    (%eax),%al
 8048e9d:	0f b6 c0             	movzbl %al,%eax
 8048ea0:	eb 05                	jmp    8048ea7 <hex_dump+0x175>
 8048ea2:	b8 2e 00 00 00       	mov    $0x2e,%eax
 8048ea7:	83 ec 0c             	sub    $0xc,%esp
 8048eaa:	50                   	push   %eax
 8048eab:	e8 9e 10 00 00       	call   8049f4e <putchar>
 8048eb0:	83 c4 10             	add    $0x10,%esp
 8048eb3:	ff 45 ec             	incl   -0x14(%ebp)
 8048eb6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048eb9:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8048ebc:	72 ae                	jb     8048e6c <hex_dump+0x13a>
 8048ebe:	eb 10                	jmp    8048ed0 <hex_dump+0x19e>
 8048ec0:	83 ec 0c             	sub    $0xc,%esp
 8048ec3:	6a 20                	push   $0x20
 8048ec5:	e8 84 10 00 00       	call   8049f4e <putchar>
 8048eca:	83 c4 10             	add    $0x10,%esp
 8048ecd:	ff 45 ec             	incl   -0x14(%ebp)
 8048ed0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048ed3:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 8048ed6:	72 e8                	jb     8048ec0 <hex_dump+0x18e>
 8048ed8:	83 ec 0c             	sub    $0xc,%esp
 8048edb:	6a 7c                	push   $0x7c
 8048edd:	e8 6c 10 00 00       	call   8049f4e <putchar>
 8048ee2:	83 c4 10             	add    $0x10,%esp
 8048ee5:	83 ec 0c             	sub    $0xc,%esp
 8048ee8:	6a 0a                	push   $0xa
 8048eea:	e8 5f 10 00 00       	call   8049f4e <putchar>
 8048eef:	83 c4 10             	add    $0x10,%esp
 8048ef2:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048ef5:	01 45 08             	add    %eax,0x8(%ebp)
 8048ef8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048efb:	01 45 f4             	add    %eax,-0xc(%ebp)
 8048efe:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048f01:	29 45 10             	sub    %eax,0x10(%ebp)
 8048f04:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048f08:	0f 85 42 fe ff ff    	jne    8048d50 <hex_dump+0x1e>
 8048f0e:	90                   	nop
 8048f0f:	c9                   	leave  
 8048f10:	c3                   	ret    

08048f11 <print_human_readable_size>:
 8048f11:	55                   	push   %ebp
 8048f12:	89 e5                	mov    %esp,%ebp
 8048f14:	83 ec 28             	sub    $0x28,%esp
 8048f17:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048f1a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8048f1d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8048f20:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8048f23:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8048f26:	83 f1 01             	xor    $0x1,%ecx
 8048f29:	89 c8                	mov    %ecx,%eax
 8048f2b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8048f2e:	80 f5 00             	xor    $0x0,%ch
 8048f31:	89 ca                	mov    %ecx,%edx
 8048f33:	09 d0                	or     %edx,%eax
 8048f35:	85 c0                	test   %eax,%eax
 8048f37:	75 12                	jne    8048f4b <print_human_readable_size+0x3a>
 8048f39:	83 ec 0c             	sub    $0xc,%esp
 8048f3c:	68 9d a3 04 08       	push   $0x804a39d
 8048f41:	e8 b5 f2 ff ff       	call   80481fb <printf>
 8048f46:	83 c4 10             	add    $0x10,%esp
 8048f49:	eb 5a                	jmp    8048fa5 <print_human_readable_size+0x94>
 8048f4b:	c7 45 f4 54 b6 04 08 	movl   $0x804b654,-0xc(%ebp)
 8048f52:	eb 17                	jmp    8048f6b <print_human_readable_size+0x5a>
 8048f54:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048f57:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048f5a:	0f ac d0 0a          	shrd   $0xa,%edx,%eax
 8048f5e:	c1 ea 0a             	shr    $0xa,%edx
 8048f61:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048f64:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048f67:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8048f6b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8048f6f:	72 1b                	jb     8048f8c <print_human_readable_size+0x7b>
 8048f71:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8048f75:	77 09                	ja     8048f80 <print_human_readable_size+0x6f>
 8048f77:	81 7d e0 ff 03 00 00 	cmpl   $0x3ff,-0x20(%ebp)
 8048f7e:	76 0c                	jbe    8048f8c <print_human_readable_size+0x7b>
 8048f80:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f83:	83 c0 04             	add    $0x4,%eax
 8048f86:	8b 00                	mov    (%eax),%eax
 8048f88:	85 c0                	test   %eax,%eax
 8048f8a:	75 c8                	jne    8048f54 <print_human_readable_size+0x43>
 8048f8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f8f:	8b 00                	mov    (%eax),%eax
 8048f91:	50                   	push   %eax
 8048f92:	ff 75 e4             	push   -0x1c(%ebp)
 8048f95:	ff 75 e0             	push   -0x20(%ebp)
 8048f98:	68 a4 a3 04 08       	push   $0x804a3a4
 8048f9d:	e8 59 f2 ff ff       	call   80481fb <printf>
 8048fa2:	83 c4 10             	add    $0x10,%esp
 8048fa5:	90                   	nop
 8048fa6:	c9                   	leave  
 8048fa7:	c3                   	ret    

08048fa8 <memcpy>:
 8048fa8:	55                   	push   %ebp
 8048fa9:	89 e5                	mov    %esp,%ebp
 8048fab:	83 ec 18             	sub    $0x18,%esp
 8048fae:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048fb4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048fb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048fba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048fbe:	75 24                	jne    8048fe4 <memcpy+0x3c>
 8048fc0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048fc4:	74 1e                	je     8048fe4 <memcpy+0x3c>
 8048fc6:	83 ec 0c             	sub    $0xc,%esp
 8048fc9:	68 c8 a3 04 08       	push   $0x804a3c8
 8048fce:	68 e1 a3 04 08       	push   $0x804a3e1
 8048fd3:	68 d4 a4 04 08       	push   $0x804a4d4
 8048fd8:	6a 0c                	push   $0xc
 8048fda:	68 f8 a3 04 08       	push   $0x804a3f8
 8048fdf:	e8 60 0c 00 00       	call   8049c44 <debug_panic>
 8048fe4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048fe8:	75 3a                	jne    8049024 <memcpy+0x7c>
 8048fea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048fee:	74 34                	je     8049024 <memcpy+0x7c>
 8048ff0:	83 ec 0c             	sub    $0xc,%esp
 8048ff3:	68 08 a4 04 08       	push   $0x804a408
 8048ff8:	68 e1 a3 04 08       	push   $0x804a3e1
 8048ffd:	68 d4 a4 04 08       	push   $0x804a4d4
 8049002:	6a 0d                	push   $0xd
 8049004:	68 f8 a3 04 08       	push   $0x804a3f8
 8049009:	e8 36 0c 00 00       	call   8049c44 <debug_panic>
 804900e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049011:	8d 50 01             	lea    0x1(%eax),%edx
 8049014:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8049017:	8b 55 f0             	mov    -0x10(%ebp),%edx
 804901a:	8d 4a 01             	lea    0x1(%edx),%ecx
 804901d:	89 4d f0             	mov    %ecx,-0x10(%ebp)
 8049020:	8a 12                	mov    (%edx),%dl
 8049022:	88 10                	mov    %dl,(%eax)
 8049024:	8b 45 10             	mov    0x10(%ebp),%eax
 8049027:	8d 50 ff             	lea    -0x1(%eax),%edx
 804902a:	89 55 10             	mov    %edx,0x10(%ebp)
 804902d:	85 c0                	test   %eax,%eax
 804902f:	75 dd                	jne    804900e <memcpy+0x66>
 8049031:	8b 45 08             	mov    0x8(%ebp),%eax
 8049034:	c9                   	leave  
 8049035:	c3                   	ret    

08049036 <memmove>:
 8049036:	55                   	push   %ebp
 8049037:	89 e5                	mov    %esp,%ebp
 8049039:	83 ec 18             	sub    $0x18,%esp
 804903c:	8b 45 08             	mov    0x8(%ebp),%eax
 804903f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049042:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049045:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049048:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804904c:	75 24                	jne    8049072 <memmove+0x3c>
 804904e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049052:	74 1e                	je     8049072 <memmove+0x3c>
 8049054:	83 ec 0c             	sub    $0xc,%esp
 8049057:	68 c8 a3 04 08       	push   $0x804a3c8
 804905c:	68 e1 a3 04 08       	push   $0x804a3e1
 8049061:	68 dc a4 04 08       	push   $0x804a4dc
 8049066:	6a 1d                	push   $0x1d
 8049068:	68 f8 a3 04 08       	push   $0x804a3f8
 804906d:	e8 d2 0b 00 00       	call   8049c44 <debug_panic>
 8049072:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049076:	75 24                	jne    804909c <memmove+0x66>
 8049078:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804907c:	74 1e                	je     804909c <memmove+0x66>
 804907e:	83 ec 0c             	sub    $0xc,%esp
 8049081:	68 08 a4 04 08       	push   $0x804a408
 8049086:	68 e1 a3 04 08       	push   $0x804a3e1
 804908b:	68 dc a4 04 08       	push   $0x804a4dc
 8049090:	6a 1e                	push   $0x1e
 8049092:	68 f8 a3 04 08       	push   $0x804a3f8
 8049097:	e8 a8 0b 00 00       	call   8049c44 <debug_panic>
 804909c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804909f:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 80490a2:	73 27                	jae    80490cb <memmove+0x95>
 80490a4:	eb 16                	jmp    80490bc <memmove+0x86>
 80490a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490a9:	8d 50 01             	lea    0x1(%eax),%edx
 80490ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80490af:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80490b2:	8d 4a 01             	lea    0x1(%edx),%ecx
 80490b5:	89 4d f0             	mov    %ecx,-0x10(%ebp)
 80490b8:	8a 12                	mov    (%edx),%dl
 80490ba:	88 10                	mov    %dl,(%eax)
 80490bc:	8b 45 10             	mov    0x10(%ebp),%eax
 80490bf:	8d 50 ff             	lea    -0x1(%eax),%edx
 80490c2:	89 55 10             	mov    %edx,0x10(%ebp)
 80490c5:	85 c0                	test   %eax,%eax
 80490c7:	75 dd                	jne    80490a6 <memmove+0x70>
 80490c9:	eb 2b                	jmp    80490f6 <memmove+0xc0>
 80490cb:	8b 45 10             	mov    0x10(%ebp),%eax
 80490ce:	01 45 f4             	add    %eax,-0xc(%ebp)
 80490d1:	8b 45 10             	mov    0x10(%ebp),%eax
 80490d4:	01 45 f0             	add    %eax,-0x10(%ebp)
 80490d7:	eb 10                	jmp    80490e9 <memmove+0xb3>
 80490d9:	ff 4d f4             	decl   -0xc(%ebp)
 80490dc:	ff 4d f0             	decl   -0x10(%ebp)
 80490df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80490e2:	8a 10                	mov    (%eax),%dl
 80490e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490e7:	88 10                	mov    %dl,(%eax)
 80490e9:	8b 45 10             	mov    0x10(%ebp),%eax
 80490ec:	8d 50 ff             	lea    -0x1(%eax),%edx
 80490ef:	89 55 10             	mov    %edx,0x10(%ebp)
 80490f2:	85 c0                	test   %eax,%eax
 80490f4:	75 e3                	jne    80490d9 <memmove+0xa3>
 80490f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490f9:	c9                   	leave  
 80490fa:	c3                   	ret    

080490fb <memcmp>:
 80490fb:	55                   	push   %ebp
 80490fc:	89 e5                	mov    %esp,%ebp
 80490fe:	83 ec 18             	sub    $0x18,%esp
 8049101:	8b 45 08             	mov    0x8(%ebp),%eax
 8049104:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049107:	8b 45 0c             	mov    0xc(%ebp),%eax
 804910a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804910d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049111:	75 24                	jne    8049137 <memcmp+0x3c>
 8049113:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049117:	74 1e                	je     8049137 <memcmp+0x3c>
 8049119:	83 ec 0c             	sub    $0xc,%esp
 804911c:	68 21 a4 04 08       	push   $0x804a421
 8049121:	68 e1 a3 04 08       	push   $0x804a3e1
 8049126:	68 e4 a4 04 08       	push   $0x804a4e4
 804912b:	6a 3a                	push   $0x3a
 804912d:	68 f8 a3 04 08       	push   $0x804a3f8
 8049132:	e8 0d 0b 00 00       	call   8049c44 <debug_panic>
 8049137:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804913b:	75 54                	jne    8049191 <memcmp+0x96>
 804913d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049141:	74 4e                	je     8049191 <memcmp+0x96>
 8049143:	83 ec 0c             	sub    $0xc,%esp
 8049146:	68 38 a4 04 08       	push   $0x804a438
 804914b:	68 e1 a3 04 08       	push   $0x804a3e1
 8049150:	68 e4 a4 04 08       	push   $0x804a4e4
 8049155:	6a 3b                	push   $0x3b
 8049157:	68 f8 a3 04 08       	push   $0x804a3f8
 804915c:	e8 e3 0a 00 00       	call   8049c44 <debug_panic>
 8049161:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049164:	8a 10                	mov    (%eax),%dl
 8049166:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049169:	8a 00                	mov    (%eax),%al
 804916b:	38 c2                	cmp    %al,%dl
 804916d:	74 1c                	je     804918b <memcmp+0x90>
 804916f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049172:	8a 10                	mov    (%eax),%dl
 8049174:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049177:	8a 00                	mov    (%eax),%al
 8049179:	38 c2                	cmp    %al,%dl
 804917b:	76 07                	jbe    8049184 <memcmp+0x89>
 804917d:	b8 01 00 00 00       	mov    $0x1,%eax
 8049182:	eb 1f                	jmp    80491a3 <memcmp+0xa8>
 8049184:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049189:	eb 18                	jmp    80491a3 <memcmp+0xa8>
 804918b:	ff 45 f4             	incl   -0xc(%ebp)
 804918e:	ff 45 f0             	incl   -0x10(%ebp)
 8049191:	8b 45 10             	mov    0x10(%ebp),%eax
 8049194:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049197:	89 55 10             	mov    %edx,0x10(%ebp)
 804919a:	85 c0                	test   %eax,%eax
 804919c:	75 c3                	jne    8049161 <memcmp+0x66>
 804919e:	b8 00 00 00 00       	mov    $0x0,%eax
 80491a3:	c9                   	leave  
 80491a4:	c3                   	ret    

080491a5 <strcmp>:
 80491a5:	55                   	push   %ebp
 80491a6:	89 e5                	mov    %esp,%ebp
 80491a8:	83 ec 18             	sub    $0x18,%esp
 80491ab:	8b 45 08             	mov    0x8(%ebp),%eax
 80491ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80491b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80491b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80491b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80491bb:	75 1e                	jne    80491db <strcmp+0x36>
 80491bd:	83 ec 0c             	sub    $0xc,%esp
 80491c0:	68 4f a4 04 08       	push   $0x804a44f
 80491c5:	68 e1 a3 04 08       	push   $0x804a3e1
 80491ca:	68 ec a4 04 08       	push   $0x804a4ec
 80491cf:	6a 4e                	push   $0x4e
 80491d1:	68 f8 a3 04 08       	push   $0x804a3f8
 80491d6:	e8 69 0a 00 00       	call   8049c44 <debug_panic>
 80491db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80491df:	75 24                	jne    8049205 <strcmp+0x60>
 80491e1:	83 ec 0c             	sub    $0xc,%esp
 80491e4:	68 59 a4 04 08       	push   $0x804a459
 80491e9:	68 e1 a3 04 08       	push   $0x804a3e1
 80491ee:	68 ec a4 04 08       	push   $0x804a4ec
 80491f3:	6a 4f                	push   $0x4f
 80491f5:	68 f8 a3 04 08       	push   $0x804a3f8
 80491fa:	e8 45 0a 00 00       	call   8049c44 <debug_panic>
 80491ff:	ff 45 f4             	incl   -0xc(%ebp)
 8049202:	ff 45 f0             	incl   -0x10(%ebp)
 8049205:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049208:	8a 00                	mov    (%eax),%al
 804920a:	84 c0                	test   %al,%al
 804920c:	74 0e                	je     804921c <strcmp+0x77>
 804920e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049211:	8a 10                	mov    (%eax),%dl
 8049213:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049216:	8a 00                	mov    (%eax),%al
 8049218:	38 c2                	cmp    %al,%dl
 804921a:	74 e3                	je     80491ff <strcmp+0x5a>
 804921c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804921f:	8a 10                	mov    (%eax),%dl
 8049221:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049224:	8a 00                	mov    (%eax),%al
 8049226:	38 c2                	cmp    %al,%dl
 8049228:	72 14                	jb     804923e <strcmp+0x99>
 804922a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804922d:	8a 10                	mov    (%eax),%dl
 804922f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049232:	8a 00                	mov    (%eax),%al
 8049234:	38 c2                	cmp    %al,%dl
 8049236:	0f 97 c0             	seta   %al
 8049239:	0f b6 c0             	movzbl %al,%eax
 804923c:	eb 05                	jmp    8049243 <strcmp+0x9e>
 804923e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049243:	c9                   	leave  
 8049244:	c3                   	ret    

08049245 <memchr>:
 8049245:	55                   	push   %ebp
 8049246:	89 e5                	mov    %esp,%ebp
 8049248:	83 ec 18             	sub    $0x18,%esp
 804924b:	8b 45 08             	mov    0x8(%ebp),%eax
 804924e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049251:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049254:	88 45 f3             	mov    %al,-0xd(%ebp)
 8049257:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804925b:	75 36                	jne    8049293 <memchr+0x4e>
 804925d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049261:	74 30                	je     8049293 <memchr+0x4e>
 8049263:	83 ec 0c             	sub    $0xc,%esp
 8049266:	68 63 a4 04 08       	push   $0x804a463
 804926b:	68 e1 a3 04 08       	push   $0x804a3e1
 8049270:	68 f4 a4 04 08       	push   $0x804a4f4
 8049275:	6a 63                	push   $0x63
 8049277:	68 f8 a3 04 08       	push   $0x804a3f8
 804927c:	e8 c3 09 00 00       	call   8049c44 <debug_panic>
 8049281:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049284:	8a 00                	mov    (%eax),%al
 8049286:	3a 45 f3             	cmp    -0xd(%ebp),%al
 8049289:	75 05                	jne    8049290 <memchr+0x4b>
 804928b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804928e:	eb 15                	jmp    80492a5 <memchr+0x60>
 8049290:	ff 45 f4             	incl   -0xc(%ebp)
 8049293:	8b 45 10             	mov    0x10(%ebp),%eax
 8049296:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049299:	89 55 10             	mov    %edx,0x10(%ebp)
 804929c:	85 c0                	test   %eax,%eax
 804929e:	75 e1                	jne    8049281 <memchr+0x3c>
 80492a0:	b8 00 00 00 00       	mov    $0x0,%eax
 80492a5:	c9                   	leave  
 80492a6:	c3                   	ret    

080492a7 <strchr>:
 80492a7:	55                   	push   %ebp
 80492a8:	89 e5                	mov    %esp,%ebp
 80492aa:	83 ec 18             	sub    $0x18,%esp
 80492ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 80492b0:	88 45 f7             	mov    %al,-0x9(%ebp)
 80492b3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80492b7:	75 1e                	jne    80492d7 <strchr+0x30>
 80492b9:	83 ec 0c             	sub    $0xc,%esp
 80492bc:	68 7e a4 04 08       	push   $0x804a47e
 80492c1:	68 e1 a3 04 08       	push   $0x804a3e1
 80492c6:	68 fc a4 04 08       	push   $0x804a4fc
 80492cb:	6a 75                	push   $0x75
 80492cd:	68 f8 a3 04 08       	push   $0x804a3f8
 80492d2:	e8 6d 09 00 00       	call   8049c44 <debug_panic>
 80492d7:	8b 45 08             	mov    0x8(%ebp),%eax
 80492da:	8a 00                	mov    (%eax),%al
 80492dc:	3a 45 f7             	cmp    -0x9(%ebp),%al
 80492df:	75 05                	jne    80492e6 <strchr+0x3f>
 80492e1:	8b 45 08             	mov    0x8(%ebp),%eax
 80492e4:	eb 15                	jmp    80492fb <strchr+0x54>
 80492e6:	8b 45 08             	mov    0x8(%ebp),%eax
 80492e9:	8a 00                	mov    (%eax),%al
 80492eb:	84 c0                	test   %al,%al
 80492ed:	75 07                	jne    80492f6 <strchr+0x4f>
 80492ef:	b8 00 00 00 00       	mov    $0x0,%eax
 80492f4:	eb 05                	jmp    80492fb <strchr+0x54>
 80492f6:	ff 45 08             	incl   0x8(%ebp)
 80492f9:	eb dc                	jmp    80492d7 <strchr+0x30>
 80492fb:	c9                   	leave  
 80492fc:	c3                   	ret    

080492fd <strcspn>:
 80492fd:	55                   	push   %ebp
 80492fe:	89 e5                	mov    %esp,%ebp
 8049300:	83 ec 18             	sub    $0x18,%esp
 8049303:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804930a:	eb 23                	jmp    804932f <strcspn+0x32>
 804930c:	8b 55 08             	mov    0x8(%ebp),%edx
 804930f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049312:	01 d0                	add    %edx,%eax
 8049314:	8a 00                	mov    (%eax),%al
 8049316:	0f be c0             	movsbl %al,%eax
 8049319:	83 ec 08             	sub    $0x8,%esp
 804931c:	50                   	push   %eax
 804931d:	ff 75 0c             	push   0xc(%ebp)
 8049320:	e8 82 ff ff ff       	call   80492a7 <strchr>
 8049325:	83 c4 10             	add    $0x10,%esp
 8049328:	85 c0                	test   %eax,%eax
 804932a:	75 13                	jne    804933f <strcspn+0x42>
 804932c:	ff 45 f4             	incl   -0xc(%ebp)
 804932f:	8b 55 08             	mov    0x8(%ebp),%edx
 8049332:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049335:	01 d0                	add    %edx,%eax
 8049337:	8a 00                	mov    (%eax),%al
 8049339:	84 c0                	test   %al,%al
 804933b:	75 cf                	jne    804930c <strcspn+0xf>
 804933d:	eb 01                	jmp    8049340 <strcspn+0x43>
 804933f:	90                   	nop
 8049340:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049343:	c9                   	leave  
 8049344:	c3                   	ret    

08049345 <strpbrk>:
 8049345:	55                   	push   %ebp
 8049346:	89 e5                	mov    %esp,%ebp
 8049348:	83 ec 08             	sub    $0x8,%esp
 804934b:	eb 23                	jmp    8049370 <strpbrk+0x2b>
 804934d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049350:	8a 00                	mov    (%eax),%al
 8049352:	0f be c0             	movsbl %al,%eax
 8049355:	83 ec 08             	sub    $0x8,%esp
 8049358:	50                   	push   %eax
 8049359:	ff 75 0c             	push   0xc(%ebp)
 804935c:	e8 46 ff ff ff       	call   80492a7 <strchr>
 8049361:	83 c4 10             	add    $0x10,%esp
 8049364:	85 c0                	test   %eax,%eax
 8049366:	74 05                	je     804936d <strpbrk+0x28>
 8049368:	8b 45 08             	mov    0x8(%ebp),%eax
 804936b:	eb 11                	jmp    804937e <strpbrk+0x39>
 804936d:	ff 45 08             	incl   0x8(%ebp)
 8049370:	8b 45 08             	mov    0x8(%ebp),%eax
 8049373:	8a 00                	mov    (%eax),%al
 8049375:	84 c0                	test   %al,%al
 8049377:	75 d4                	jne    804934d <strpbrk+0x8>
 8049379:	b8 00 00 00 00       	mov    $0x0,%eax
 804937e:	c9                   	leave  
 804937f:	c3                   	ret    

08049380 <strrchr>:
 8049380:	55                   	push   %ebp
 8049381:	89 e5                	mov    %esp,%ebp
 8049383:	83 ec 10             	sub    $0x10,%esp
 8049386:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049389:	88 45 fb             	mov    %al,-0x5(%ebp)
 804938c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049393:	eb 13                	jmp    80493a8 <strrchr+0x28>
 8049395:	8b 45 08             	mov    0x8(%ebp),%eax
 8049398:	8a 00                	mov    (%eax),%al
 804939a:	3a 45 fb             	cmp    -0x5(%ebp),%al
 804939d:	75 06                	jne    80493a5 <strrchr+0x25>
 804939f:	8b 45 08             	mov    0x8(%ebp),%eax
 80493a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80493a5:	ff 45 08             	incl   0x8(%ebp)
 80493a8:	8b 45 08             	mov    0x8(%ebp),%eax
 80493ab:	8a 00                	mov    (%eax),%al
 80493ad:	84 c0                	test   %al,%al
 80493af:	75 e4                	jne    8049395 <strrchr+0x15>
 80493b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80493b4:	c9                   	leave  
 80493b5:	c3                   	ret    

080493b6 <strspn>:
 80493b6:	55                   	push   %ebp
 80493b7:	89 e5                	mov    %esp,%ebp
 80493b9:	83 ec 18             	sub    $0x18,%esp
 80493bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80493c3:	eb 23                	jmp    80493e8 <strspn+0x32>
 80493c5:	8b 55 08             	mov    0x8(%ebp),%edx
 80493c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80493cb:	01 d0                	add    %edx,%eax
 80493cd:	8a 00                	mov    (%eax),%al
 80493cf:	0f be c0             	movsbl %al,%eax
 80493d2:	83 ec 08             	sub    $0x8,%esp
 80493d5:	50                   	push   %eax
 80493d6:	ff 75 0c             	push   0xc(%ebp)
 80493d9:	e8 c9 fe ff ff       	call   80492a7 <strchr>
 80493de:	83 c4 10             	add    $0x10,%esp
 80493e1:	85 c0                	test   %eax,%eax
 80493e3:	74 13                	je     80493f8 <strspn+0x42>
 80493e5:	ff 45 f4             	incl   -0xc(%ebp)
 80493e8:	8b 55 08             	mov    0x8(%ebp),%edx
 80493eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80493ee:	01 d0                	add    %edx,%eax
 80493f0:	8a 00                	mov    (%eax),%al
 80493f2:	84 c0                	test   %al,%al
 80493f4:	75 cf                	jne    80493c5 <strspn+0xf>
 80493f6:	eb 01                	jmp    80493f9 <strspn+0x43>
 80493f8:	90                   	nop
 80493f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80493fc:	c9                   	leave  
 80493fd:	c3                   	ret    

080493fe <strstr>:
 80493fe:	55                   	push   %ebp
 80493ff:	89 e5                	mov    %esp,%ebp
 8049401:	83 ec 18             	sub    $0x18,%esp
 8049404:	83 ec 0c             	sub    $0xc,%esp
 8049407:	ff 75 08             	push   0x8(%ebp)
 804940a:	e8 cc 01 00 00       	call   80495db <strlen>
 804940f:	83 c4 10             	add    $0x10,%esp
 8049412:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049415:	83 ec 0c             	sub    $0xc,%esp
 8049418:	ff 75 0c             	push   0xc(%ebp)
 804941b:	e8 bb 01 00 00       	call   80495db <strlen>
 8049420:	83 c4 10             	add    $0x10,%esp
 8049423:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049426:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049429:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 804942c:	72 3f                	jb     804946d <strstr+0x6f>
 804942e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049435:	eb 2b                	jmp    8049462 <strstr+0x64>
 8049437:	8b 55 08             	mov    0x8(%ebp),%edx
 804943a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804943d:	01 d0                	add    %edx,%eax
 804943f:	83 ec 04             	sub    $0x4,%esp
 8049442:	ff 75 ec             	push   -0x14(%ebp)
 8049445:	ff 75 0c             	push   0xc(%ebp)
 8049448:	50                   	push   %eax
 8049449:	e8 ad fc ff ff       	call   80490fb <memcmp>
 804944e:	83 c4 10             	add    $0x10,%esp
 8049451:	85 c0                	test   %eax,%eax
 8049453:	75 0a                	jne    804945f <strstr+0x61>
 8049455:	8b 55 08             	mov    0x8(%ebp),%edx
 8049458:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804945b:	01 d0                	add    %edx,%eax
 804945d:	eb 13                	jmp    8049472 <strstr+0x74>
 804945f:	ff 45 f4             	incl   -0xc(%ebp)
 8049462:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049465:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8049468:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804946b:	73 ca                	jae    8049437 <strstr+0x39>
 804946d:	b8 00 00 00 00       	mov    $0x0,%eax
 8049472:	c9                   	leave  
 8049473:	c3                   	ret    

08049474 <strtok_r>:
 8049474:	55                   	push   %ebp
 8049475:	89 e5                	mov    %esp,%ebp
 8049477:	83 ec 18             	sub    $0x18,%esp
 804947a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804947e:	75 21                	jne    80494a1 <strtok_r+0x2d>
 8049480:	83 ec 0c             	sub    $0xc,%esp
 8049483:	68 8d a4 04 08       	push   $0x804a48d
 8049488:	68 e1 a3 04 08       	push   $0x804a3e1
 804948d:	68 04 a5 04 08       	push   $0x804a504
 8049492:	68 ee 00 00 00       	push   $0xee
 8049497:	68 f8 a3 04 08       	push   $0x804a3f8
 804949c:	e8 a3 07 00 00       	call   8049c44 <debug_panic>
 80494a1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80494a5:	75 21                	jne    80494c8 <strtok_r+0x54>
 80494a7:	83 ec 0c             	sub    $0xc,%esp
 80494aa:	68 a0 a4 04 08       	push   $0x804a4a0
 80494af:	68 e1 a3 04 08       	push   $0x804a3e1
 80494b4:	68 04 a5 04 08       	push   $0x804a504
 80494b9:	68 ef 00 00 00       	push   $0xef
 80494be:	68 f8 a3 04 08       	push   $0x804a3f8
 80494c3:	e8 7c 07 00 00       	call   8049c44 <debug_panic>
 80494c8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80494cc:	75 08                	jne    80494d6 <strtok_r+0x62>
 80494ce:	8b 45 10             	mov    0x10(%ebp),%eax
 80494d1:	8b 00                	mov    (%eax),%eax
 80494d3:	89 45 08             	mov    %eax,0x8(%ebp)
 80494d6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80494da:	75 3c                	jne    8049518 <strtok_r+0xa4>
 80494dc:	83 ec 0c             	sub    $0xc,%esp
 80494df:	68 b1 a4 04 08       	push   $0x804a4b1
 80494e4:	68 e1 a3 04 08       	push   $0x804a3e1
 80494e9:	68 04 a5 04 08       	push   $0x804a504
 80494ee:	68 f5 00 00 00       	push   $0xf5
 80494f3:	68 f8 a3 04 08       	push   $0x804a3f8
 80494f8:	e8 47 07 00 00       	call   8049c44 <debug_panic>
 80494fd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049500:	8a 00                	mov    (%eax),%al
 8049502:	84 c0                	test   %al,%al
 8049504:	75 0f                	jne    8049515 <strtok_r+0xa1>
 8049506:	8b 45 10             	mov    0x10(%ebp),%eax
 8049509:	8b 55 08             	mov    0x8(%ebp),%edx
 804950c:	89 10                	mov    %edx,(%eax)
 804950e:	b8 00 00 00 00       	mov    $0x0,%eax
 8049513:	eb 6b                	jmp    8049580 <strtok_r+0x10c>
 8049515:	ff 45 08             	incl   0x8(%ebp)
 8049518:	8b 45 08             	mov    0x8(%ebp),%eax
 804951b:	8a 00                	mov    (%eax),%al
 804951d:	0f be c0             	movsbl %al,%eax
 8049520:	83 ec 08             	sub    $0x8,%esp
 8049523:	50                   	push   %eax
 8049524:	ff 75 0c             	push   0xc(%ebp)
 8049527:	e8 7b fd ff ff       	call   80492a7 <strchr>
 804952c:	83 c4 10             	add    $0x10,%esp
 804952f:	85 c0                	test   %eax,%eax
 8049531:	75 ca                	jne    80494fd <strtok_r+0x89>
 8049533:	8b 45 08             	mov    0x8(%ebp),%eax
 8049536:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049539:	eb 03                	jmp    804953e <strtok_r+0xca>
 804953b:	ff 45 08             	incl   0x8(%ebp)
 804953e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049541:	8a 00                	mov    (%eax),%al
 8049543:	0f be c0             	movsbl %al,%eax
 8049546:	83 ec 08             	sub    $0x8,%esp
 8049549:	50                   	push   %eax
 804954a:	ff 75 0c             	push   0xc(%ebp)
 804954d:	e8 55 fd ff ff       	call   80492a7 <strchr>
 8049552:	83 c4 10             	add    $0x10,%esp
 8049555:	85 c0                	test   %eax,%eax
 8049557:	74 e2                	je     804953b <strtok_r+0xc7>
 8049559:	8b 45 08             	mov    0x8(%ebp),%eax
 804955c:	8a 00                	mov    (%eax),%al
 804955e:	84 c0                	test   %al,%al
 8049560:	74 13                	je     8049575 <strtok_r+0x101>
 8049562:	8b 45 08             	mov    0x8(%ebp),%eax
 8049565:	c6 00 00             	movb   $0x0,(%eax)
 8049568:	8b 45 08             	mov    0x8(%ebp),%eax
 804956b:	8d 50 01             	lea    0x1(%eax),%edx
 804956e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049571:	89 10                	mov    %edx,(%eax)
 8049573:	eb 08                	jmp    804957d <strtok_r+0x109>
 8049575:	8b 45 10             	mov    0x10(%ebp),%eax
 8049578:	8b 55 08             	mov    0x8(%ebp),%edx
 804957b:	89 10                	mov    %edx,(%eax)
 804957d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049580:	c9                   	leave  
 8049581:	c3                   	ret    

08049582 <memset>:
 8049582:	55                   	push   %ebp
 8049583:	89 e5                	mov    %esp,%ebp
 8049585:	83 ec 18             	sub    $0x18,%esp
 8049588:	8b 45 08             	mov    0x8(%ebp),%eax
 804958b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804958e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049592:	75 35                	jne    80495c9 <memset+0x47>
 8049594:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049598:	74 2f                	je     80495c9 <memset+0x47>
 804959a:	83 ec 0c             	sub    $0xc,%esp
 804959d:	68 c8 a3 04 08       	push   $0x804a3c8
 80495a2:	68 e1 a3 04 08       	push   $0x804a3e1
 80495a7:	68 10 a5 04 08       	push   $0x804a510
 80495ac:	68 1a 01 00 00       	push   $0x11a
 80495b1:	68 f8 a3 04 08       	push   $0x804a3f8
 80495b6:	e8 89 06 00 00       	call   8049c44 <debug_panic>
 80495bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80495be:	8d 50 01             	lea    0x1(%eax),%edx
 80495c1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80495c4:	8b 55 0c             	mov    0xc(%ebp),%edx
 80495c7:	88 10                	mov    %dl,(%eax)
 80495c9:	8b 45 10             	mov    0x10(%ebp),%eax
 80495cc:	8d 50 ff             	lea    -0x1(%eax),%edx
 80495cf:	89 55 10             	mov    %edx,0x10(%ebp)
 80495d2:	85 c0                	test   %eax,%eax
 80495d4:	75 e5                	jne    80495bb <memset+0x39>
 80495d6:	8b 45 08             	mov    0x8(%ebp),%eax
 80495d9:	c9                   	leave  
 80495da:	c3                   	ret    

080495db <strlen>:
 80495db:	55                   	push   %ebp
 80495dc:	89 e5                	mov    %esp,%ebp
 80495de:	83 ec 18             	sub    $0x18,%esp
 80495e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80495e5:	75 21                	jne    8049608 <strlen+0x2d>
 80495e7:	83 ec 0c             	sub    $0xc,%esp
 80495ea:	68 7e a4 04 08       	push   $0x804a47e
 80495ef:	68 e1 a3 04 08       	push   $0x804a3e1
 80495f4:	68 18 a5 04 08       	push   $0x804a518
 80495f9:	68 28 01 00 00       	push   $0x128
 80495fe:	68 f8 a3 04 08       	push   $0x804a3f8
 8049603:	e8 3c 06 00 00       	call   8049c44 <debug_panic>
 8049608:	8b 45 08             	mov    0x8(%ebp),%eax
 804960b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804960e:	eb 03                	jmp    8049613 <strlen+0x38>
 8049610:	ff 45 f4             	incl   -0xc(%ebp)
 8049613:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049616:	8a 00                	mov    (%eax),%al
 8049618:	84 c0                	test   %al,%al
 804961a:	75 f4                	jne    8049610 <strlen+0x35>
 804961c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804961f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049622:	29 c2                	sub    %eax,%edx
 8049624:	89 d0                	mov    %edx,%eax
 8049626:	c9                   	leave  
 8049627:	c3                   	ret    

08049628 <strnlen>:
 8049628:	55                   	push   %ebp
 8049629:	89 e5                	mov    %esp,%ebp
 804962b:	83 ec 10             	sub    $0x10,%esp
 804962e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049635:	eb 03                	jmp    804963a <strnlen+0x12>
 8049637:	ff 45 fc             	incl   -0x4(%ebp)
 804963a:	8b 55 08             	mov    0x8(%ebp),%edx
 804963d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049640:	01 d0                	add    %edx,%eax
 8049642:	8a 00                	mov    (%eax),%al
 8049644:	84 c0                	test   %al,%al
 8049646:	74 08                	je     8049650 <strnlen+0x28>
 8049648:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804964b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804964e:	72 e7                	jb     8049637 <strnlen+0xf>
 8049650:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049653:	c9                   	leave  
 8049654:	c3                   	ret    

08049655 <strlcpy>:
 8049655:	55                   	push   %ebp
 8049656:	89 e5                	mov    %esp,%ebp
 8049658:	83 ec 18             	sub    $0x18,%esp
 804965b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804965f:	75 21                	jne    8049682 <strlcpy+0x2d>
 8049661:	83 ec 0c             	sub    $0xc,%esp
 8049664:	68 bb a4 04 08       	push   $0x804a4bb
 8049669:	68 e1 a3 04 08       	push   $0x804a3e1
 804966e:	68 20 a5 04 08       	push   $0x804a520
 8049673:	68 49 01 00 00       	push   $0x149
 8049678:	68 f8 a3 04 08       	push   $0x804a3f8
 804967d:	e8 c2 05 00 00       	call   8049c44 <debug_panic>
 8049682:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049686:	75 21                	jne    80496a9 <strlcpy+0x54>
 8049688:	83 ec 0c             	sub    $0xc,%esp
 804968b:	68 c7 a4 04 08       	push   $0x804a4c7
 8049690:	68 e1 a3 04 08       	push   $0x804a3e1
 8049695:	68 20 a5 04 08       	push   $0x804a520
 804969a:	68 4a 01 00 00       	push   $0x14a
 804969f:	68 f8 a3 04 08       	push   $0x804a3f8
 80496a4:	e8 9b 05 00 00       	call   8049c44 <debug_panic>
 80496a9:	83 ec 0c             	sub    $0xc,%esp
 80496ac:	ff 75 0c             	push   0xc(%ebp)
 80496af:	e8 27 ff ff ff       	call   80495db <strlen>
 80496b4:	83 c4 10             	add    $0x10,%esp
 80496b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80496ba:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80496be:	74 34                	je     80496f4 <strlcpy+0x9f>
 80496c0:	8b 45 10             	mov    0x10(%ebp),%eax
 80496c3:	48                   	dec    %eax
 80496c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80496c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80496ca:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 80496cd:	73 06                	jae    80496d5 <strlcpy+0x80>
 80496cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80496d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80496d5:	83 ec 04             	sub    $0x4,%esp
 80496d8:	ff 75 f4             	push   -0xc(%ebp)
 80496db:	ff 75 0c             	push   0xc(%ebp)
 80496de:	ff 75 08             	push   0x8(%ebp)
 80496e1:	e8 c2 f8 ff ff       	call   8048fa8 <memcpy>
 80496e6:	83 c4 10             	add    $0x10,%esp
 80496e9:	8b 55 08             	mov    0x8(%ebp),%edx
 80496ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80496ef:	01 d0                	add    %edx,%eax
 80496f1:	c6 00 00             	movb   $0x0,(%eax)
 80496f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80496f7:	c9                   	leave  
 80496f8:	c3                   	ret    

080496f9 <strlcat>:
 80496f9:	55                   	push   %ebp
 80496fa:	89 e5                	mov    %esp,%ebp
 80496fc:	83 ec 18             	sub    $0x18,%esp
 80496ff:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049703:	75 21                	jne    8049726 <strlcat+0x2d>
 8049705:	83 ec 0c             	sub    $0xc,%esp
 8049708:	68 bb a4 04 08       	push   $0x804a4bb
 804970d:	68 e1 a3 04 08       	push   $0x804a3e1
 8049712:	68 28 a5 04 08       	push   $0x804a528
 8049717:	68 67 01 00 00       	push   $0x167
 804971c:	68 f8 a3 04 08       	push   $0x804a3f8
 8049721:	e8 1e 05 00 00       	call   8049c44 <debug_panic>
 8049726:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804972a:	75 21                	jne    804974d <strlcat+0x54>
 804972c:	83 ec 0c             	sub    $0xc,%esp
 804972f:	68 c7 a4 04 08       	push   $0x804a4c7
 8049734:	68 e1 a3 04 08       	push   $0x804a3e1
 8049739:	68 28 a5 04 08       	push   $0x804a528
 804973e:	68 68 01 00 00       	push   $0x168
 8049743:	68 f8 a3 04 08       	push   $0x804a3f8
 8049748:	e8 f7 04 00 00       	call   8049c44 <debug_panic>
 804974d:	83 ec 0c             	sub    $0xc,%esp
 8049750:	ff 75 0c             	push   0xc(%ebp)
 8049753:	e8 83 fe ff ff       	call   80495db <strlen>
 8049758:	83 c4 10             	add    $0x10,%esp
 804975b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804975e:	83 ec 0c             	sub    $0xc,%esp
 8049761:	ff 75 08             	push   0x8(%ebp)
 8049764:	e8 72 fe ff ff       	call   80495db <strlen>
 8049769:	83 c4 10             	add    $0x10,%esp
 804976c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804976f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049773:	74 4a                	je     80497bf <strlcat+0xc6>
 8049775:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049778:	3b 45 10             	cmp    0x10(%ebp),%eax
 804977b:	73 42                	jae    80497bf <strlcat+0xc6>
 804977d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049780:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8049783:	48                   	dec    %eax
 8049784:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049787:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804978a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804978d:	73 06                	jae    8049795 <strlcat+0x9c>
 804978f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049792:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049795:	8b 55 08             	mov    0x8(%ebp),%edx
 8049798:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804979b:	01 d0                	add    %edx,%eax
 804979d:	83 ec 04             	sub    $0x4,%esp
 80497a0:	ff 75 f4             	push   -0xc(%ebp)
 80497a3:	ff 75 0c             	push   0xc(%ebp)
 80497a6:	50                   	push   %eax
 80497a7:	e8 fc f7 ff ff       	call   8048fa8 <memcpy>
 80497ac:	83 c4 10             	add    $0x10,%esp
 80497af:	8b 55 ec             	mov    -0x14(%ebp),%edx
 80497b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80497b5:	01 c2                	add    %eax,%edx
 80497b7:	8b 45 08             	mov    0x8(%ebp),%eax
 80497ba:	01 d0                	add    %edx,%eax
 80497bc:	c6 00 00             	movb   $0x0,(%eax)
 80497bf:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80497c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80497c5:	01 d0                	add    %edx,%eax
 80497c7:	c9                   	leave  
 80497c8:	c3                   	ret    

080497c9 <divl>:
 80497c9:	55                   	push   %ebp
 80497ca:	89 e5                	mov    %esp,%ebp
 80497cc:	83 ec 18             	sub    $0x18,%esp
 80497cf:	8b 45 08             	mov    0x8(%ebp),%eax
 80497d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80497d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80497d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80497db:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80497de:	8b 55 ec             	mov    -0x14(%ebp),%edx
 80497e1:	89 d0                	mov    %edx,%eax
 80497e3:	31 d2                	xor    %edx,%edx
 80497e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80497e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80497eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80497ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80497f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80497f4:	f7 75 10             	divl   0x10(%ebp)
 80497f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80497fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80497fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049800:	c9                   	leave  
 8049801:	c3                   	ret    

08049802 <nlz>:
 8049802:	55                   	push   %ebp
 8049803:	89 e5                	mov    %esp,%ebp
 8049805:	83 ec 10             	sub    $0x10,%esp
 8049808:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804980f:	81 7d 08 ff ff 00 00 	cmpl   $0xffff,0x8(%ebp)
 8049816:	77 08                	ja     8049820 <nlz+0x1e>
 8049818:	83 45 fc 10          	addl   $0x10,-0x4(%ebp)
 804981c:	c1 65 08 10          	shll   $0x10,0x8(%ebp)
 8049820:	81 7d 08 ff ff ff 00 	cmpl   $0xffffff,0x8(%ebp)
 8049827:	77 08                	ja     8049831 <nlz+0x2f>
 8049829:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 804982d:	c1 65 08 08          	shll   $0x8,0x8(%ebp)
 8049831:	81 7d 08 ff ff ff 0f 	cmpl   $0xfffffff,0x8(%ebp)
 8049838:	77 08                	ja     8049842 <nlz+0x40>
 804983a:	83 45 fc 04          	addl   $0x4,-0x4(%ebp)
 804983e:	c1 65 08 04          	shll   $0x4,0x8(%ebp)
 8049842:	81 7d 08 ff ff ff 3f 	cmpl   $0x3fffffff,0x8(%ebp)
 8049849:	77 08                	ja     8049853 <nlz+0x51>
 804984b:	83 45 fc 02          	addl   $0x2,-0x4(%ebp)
 804984f:	c1 65 08 02          	shll   $0x2,0x8(%ebp)
 8049853:	8b 45 08             	mov    0x8(%ebp),%eax
 8049856:	85 c0                	test   %eax,%eax
 8049858:	78 03                	js     804985d <nlz+0x5b>
 804985a:	ff 45 fc             	incl   -0x4(%ebp)
 804985d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049860:	c9                   	leave  
 8049861:	c3                   	ret    

08049862 <udiv64>:
 8049862:	55                   	push   %ebp
 8049863:	89 e5                	mov    %esp,%ebp
 8049865:	57                   	push   %edi
 8049866:	56                   	push   %esi
 8049867:	53                   	push   %ebx
 8049868:	83 ec 44             	sub    $0x44,%esp
 804986b:	8b 45 08             	mov    0x8(%ebp),%eax
 804986e:	89 45 b8             	mov    %eax,-0x48(%ebp)
 8049871:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049874:	89 45 bc             	mov    %eax,-0x44(%ebp)
 8049877:	8b 45 10             	mov    0x10(%ebp),%eax
 804987a:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804987d:	8b 45 14             	mov    0x14(%ebp),%eax
 8049880:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 8049883:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049886:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 8049889:	89 d0                	mov    %edx,%eax
 804988b:	31 d2                	xor    %edx,%edx
 804988d:	89 c7                	mov    %eax,%edi
 804988f:	83 f7 00             	xor    $0x0,%edi
 8049892:	89 f9                	mov    %edi,%ecx
 8049894:	89 d0                	mov    %edx,%eax
 8049896:	80 f4 00             	xor    $0x0,%ah
 8049899:	89 c3                	mov    %eax,%ebx
 804989b:	89 d8                	mov    %ebx,%eax
 804989d:	09 c8                	or     %ecx,%eax
 804989f:	85 c0                	test   %eax,%eax
 80498a1:	0f 85 a3 00 00 00    	jne    804994a <udiv64+0xe8>
 80498a7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 80498ae:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 80498b5:	8b 45 b8             	mov    -0x48(%ebp),%eax
 80498b8:	8b 55 bc             	mov    -0x44(%ebp),%edx
 80498bb:	89 d0                	mov    %edx,%eax
 80498bd:	31 d2                	xor    %edx,%edx
 80498bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80498c2:	8b 45 b8             	mov    -0x48(%ebp),%eax
 80498c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
 80498c8:	8b 45 b0             	mov    -0x50(%ebp),%eax
 80498cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80498ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80498d1:	ba 00 00 00 00       	mov    $0x0,%edx
 80498d6:	f7 75 dc             	divl   -0x24(%ebp)
 80498d9:	89 d0                	mov    %edx,%eax
 80498db:	ba 00 00 00 00       	mov    $0x0,%edx
 80498e0:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 80498e3:	89 cb                	mov    %ecx,%ebx
 80498e5:	0f af da             	imul   %edx,%ebx
 80498e8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 80498eb:	0f af c8             	imul   %eax,%ecx
 80498ee:	01 d9                	add    %ebx,%ecx
 80498f0:	f7 65 e8             	mull   -0x18(%ebp)
 80498f3:	01 d1                	add    %edx,%ecx
 80498f5:	89 ca                	mov    %ecx,%edx
 80498f7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 80498fa:	bb 00 00 00 00       	mov    $0x0,%ebx
 80498ff:	01 c8                	add    %ecx,%eax
 8049901:	11 da                	adc    %ebx,%edx
 8049903:	83 ec 04             	sub    $0x4,%esp
 8049906:	ff 75 dc             	push   -0x24(%ebp)
 8049909:	52                   	push   %edx
 804990a:	50                   	push   %eax
 804990b:	e8 b9 fe ff ff       	call   80497c9 <divl>
 8049910:	83 c4 10             	add    $0x10,%esp
 8049913:	89 c1                	mov    %eax,%ecx
 8049915:	bb 00 00 00 00       	mov    $0x0,%ebx
 804991a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804991d:	ba 00 00 00 00       	mov    $0x0,%edx
 8049922:	f7 75 dc             	divl   -0x24(%ebp)
 8049925:	ba 00 00 00 00       	mov    $0x0,%edx
 804992a:	8b 75 e8             	mov    -0x18(%ebp),%esi
 804992d:	89 f7                	mov    %esi,%edi
 804992f:	0f af fa             	imul   %edx,%edi
 8049932:	8b 75 ec             	mov    -0x14(%ebp),%esi
 8049935:	0f af f0             	imul   %eax,%esi
 8049938:	01 fe                	add    %edi,%esi
 804993a:	f7 65 e8             	mull   -0x18(%ebp)
 804993d:	01 d6                	add    %edx,%esi
 804993f:	89 f2                	mov    %esi,%edx
 8049941:	01 c8                	add    %ecx,%eax
 8049943:	11 da                	adc    %ebx,%edx
 8049945:	e9 e7 00 00 00       	jmp    8049a31 <udiv64+0x1cf>
 804994a:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804994d:	8b 55 bc             	mov    -0x44(%ebp),%edx
 8049950:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 8049953:	77 19                	ja     804996e <udiv64+0x10c>
 8049955:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 8049958:	72 05                	jb     804995f <udiv64+0xfd>
 804995a:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804995d:	73 0f                	jae    804996e <udiv64+0x10c>
 804995f:	b8 00 00 00 00       	mov    $0x0,%eax
 8049964:	ba 00 00 00 00       	mov    $0x0,%edx
 8049969:	e9 c3 00 00 00       	jmp    8049a31 <udiv64+0x1cf>
 804996e:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049971:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 8049974:	89 d0                	mov    %edx,%eax
 8049976:	31 d2                	xor    %edx,%edx
 8049978:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804997b:	83 ec 04             	sub    $0x4,%esp
 804997e:	ff 75 d8             	push   -0x28(%ebp)
 8049981:	e8 7c fe ff ff       	call   8049802 <nlz>
 8049986:	83 c4 08             	add    $0x8,%esp
 8049989:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804998c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 804998f:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049992:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 8049995:	0f a5 c2             	shld   %cl,%eax,%edx
 8049998:	d3 e0                	shl    %cl,%eax
 804999a:	f6 c1 20             	test   $0x20,%cl
 804999d:	74 04                	je     80499a3 <udiv64+0x141>
 804999f:	89 c2                	mov    %eax,%edx
 80499a1:	31 c0                	xor    %eax,%eax
 80499a3:	89 d0                	mov    %edx,%eax
 80499a5:	31 d2                	xor    %edx,%edx
 80499a7:	89 c1                	mov    %eax,%ecx
 80499a9:	8b 45 b8             	mov    -0x48(%ebp),%eax
 80499ac:	8b 55 bc             	mov    -0x44(%ebp),%edx
 80499af:	0f ac d0 01          	shrd   $0x1,%edx,%eax
 80499b3:	d1 ea                	shr    %edx
 80499b5:	83 ec 04             	sub    $0x4,%esp
 80499b8:	51                   	push   %ecx
 80499b9:	52                   	push   %edx
 80499ba:	50                   	push   %eax
 80499bb:	e8 09 fe ff ff       	call   80497c9 <divl>
 80499c0:	83 c4 10             	add    $0x10,%esp
 80499c3:	89 c2                	mov    %eax,%edx
 80499c5:	b8 1f 00 00 00       	mov    $0x1f,%eax
 80499ca:	2b 45 d4             	sub    -0x2c(%ebp),%eax
 80499cd:	88 c1                	mov    %al,%cl
 80499cf:	d3 ea                	shr    %cl,%edx
 80499d1:	89 d0                	mov    %edx,%eax
 80499d3:	89 45 c8             	mov    %eax,-0x38(%ebp)
 80499d6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
 80499dd:	8b 45 c8             	mov    -0x38(%ebp),%eax
 80499e0:	8b 55 cc             	mov    -0x34(%ebp),%edx
 80499e3:	83 c0 ff             	add    $0xffffffff,%eax
 80499e6:	83 d2 ff             	adc    $0xffffffff,%edx
 80499e9:	8b 4d b0             	mov    -0x50(%ebp),%ecx
 80499ec:	89 cb                	mov    %ecx,%ebx
 80499ee:	0f af da             	imul   %edx,%ebx
 80499f1:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 80499f4:	0f af c8             	imul   %eax,%ecx
 80499f7:	01 d9                	add    %ebx,%ecx
 80499f9:	f7 65 b0             	mull   -0x50(%ebp)
 80499fc:	01 d1                	add    %edx,%ecx
 80499fe:	89 ca                	mov    %ecx,%edx
 8049a00:	8b 4d b8             	mov    -0x48(%ebp),%ecx
 8049a03:	8b 5d bc             	mov    -0x44(%ebp),%ebx
 8049a06:	29 c1                	sub    %eax,%ecx
 8049a08:	19 d3                	sbb    %edx,%ebx
 8049a0a:	89 c8                	mov    %ecx,%eax
 8049a0c:	89 da                	mov    %ebx,%edx
 8049a0e:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 8049a11:	77 18                	ja     8049a2b <udiv64+0x1c9>
 8049a13:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 8049a16:	72 05                	jb     8049a1d <udiv64+0x1bb>
 8049a18:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 8049a1b:	73 0e                	jae    8049a2b <udiv64+0x1c9>
 8049a1d:	8b 45 c8             	mov    -0x38(%ebp),%eax
 8049a20:	8b 55 cc             	mov    -0x34(%ebp),%edx
 8049a23:	83 c0 ff             	add    $0xffffffff,%eax
 8049a26:	83 d2 ff             	adc    $0xffffffff,%edx
 8049a29:	eb 06                	jmp    8049a31 <udiv64+0x1cf>
 8049a2b:	8b 45 c8             	mov    -0x38(%ebp),%eax
 8049a2e:	8b 55 cc             	mov    -0x34(%ebp),%edx
 8049a31:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8049a34:	5b                   	pop    %ebx
 8049a35:	5e                   	pop    %esi
 8049a36:	5f                   	pop    %edi
 8049a37:	5d                   	pop    %ebp
 8049a38:	c3                   	ret    

08049a39 <umod64>:
 8049a39:	55                   	push   %ebp
 8049a3a:	89 e5                	mov    %esp,%ebp
 8049a3c:	53                   	push   %ebx
 8049a3d:	83 ec 14             	sub    $0x14,%esp
 8049a40:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a43:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a46:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049a4c:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049a52:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a55:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049a58:	8b 5d f0             	mov    -0x10(%ebp),%ebx
 8049a5b:	ff 75 ec             	push   -0x14(%ebp)
 8049a5e:	ff 75 e8             	push   -0x18(%ebp)
 8049a61:	ff 75 f4             	push   -0xc(%ebp)
 8049a64:	ff 75 f0             	push   -0x10(%ebp)
 8049a67:	e8 f6 fd ff ff       	call   8049862 <udiv64>
 8049a6c:	83 c4 10             	add    $0x10,%esp
 8049a6f:	89 c2                	mov    %eax,%edx
 8049a71:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049a74:	0f af c2             	imul   %edx,%eax
 8049a77:	29 c3                	sub    %eax,%ebx
 8049a79:	89 d8                	mov    %ebx,%eax
 8049a7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8049a7e:	c9                   	leave  
 8049a7f:	c3                   	ret    

08049a80 <sdiv64>:
 8049a80:	55                   	push   %ebp
 8049a81:	89 e5                	mov    %esp,%ebp
 8049a83:	83 ec 30             	sub    $0x30,%esp
 8049a86:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a89:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8049a8c:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a8f:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8049a92:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a95:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8049a98:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a9b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8049a9e:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049aa2:	79 0f                	jns    8049ab3 <sdiv64+0x33>
 8049aa4:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8049aa7:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8049aaa:	f7 d8                	neg    %eax
 8049aac:	83 d2 00             	adc    $0x0,%edx
 8049aaf:	f7 da                	neg    %edx
 8049ab1:	eb 06                	jmp    8049ab9 <sdiv64+0x39>
 8049ab3:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8049ab6:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8049ab9:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049abc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 8049abf:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8049ac3:	79 0f                	jns    8049ad4 <sdiv64+0x54>
 8049ac5:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8049ac8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8049acb:	f7 d8                	neg    %eax
 8049acd:	83 d2 00             	adc    $0x0,%edx
 8049ad0:	f7 da                	neg    %edx
 8049ad2:	eb 06                	jmp    8049ada <sdiv64+0x5a>
 8049ad4:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8049ad7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8049ada:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049add:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8049ae0:	ff 75 f4             	push   -0xc(%ebp)
 8049ae3:	ff 75 f0             	push   -0x10(%ebp)
 8049ae6:	ff 75 fc             	push   -0x4(%ebp)
 8049ae9:	ff 75 f8             	push   -0x8(%ebp)
 8049aec:	e8 71 fd ff ff       	call   8049862 <udiv64>
 8049af1:	83 c4 10             	add    $0x10,%esp
 8049af4:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049af7:	89 55 ec             	mov    %edx,-0x14(%ebp)
 8049afa:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8049afd:	f7 d0                	not    %eax
 8049aff:	c1 e8 1f             	shr    $0x1f,%eax
 8049b02:	88 c2                	mov    %al,%dl
 8049b04:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8049b07:	c1 e8 1f             	shr    $0x1f,%eax
 8049b0a:	31 d0                	xor    %edx,%eax
 8049b0c:	84 c0                	test   %al,%al
 8049b0e:	74 08                	je     8049b18 <sdiv64+0x98>
 8049b10:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b13:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049b16:	eb 0d                	jmp    8049b25 <sdiv64+0xa5>
 8049b18:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b1b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049b1e:	f7 d8                	neg    %eax
 8049b20:	83 d2 00             	adc    $0x0,%edx
 8049b23:	f7 da                	neg    %edx
 8049b25:	c9                   	leave  
 8049b26:	c3                   	ret    

08049b27 <smod64>:
 8049b27:	55                   	push   %ebp
 8049b28:	89 e5                	mov    %esp,%ebp
 8049b2a:	53                   	push   %ebx
 8049b2b:	83 ec 14             	sub    $0x14,%esp
 8049b2e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b31:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b34:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b3a:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b3d:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049b40:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b43:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049b46:	8b 5d f0             	mov    -0x10(%ebp),%ebx
 8049b49:	ff 75 ec             	push   -0x14(%ebp)
 8049b4c:	ff 75 e8             	push   -0x18(%ebp)
 8049b4f:	ff 75 f4             	push   -0xc(%ebp)
 8049b52:	ff 75 f0             	push   -0x10(%ebp)
 8049b55:	e8 26 ff ff ff       	call   8049a80 <sdiv64>
 8049b5a:	83 c4 10             	add    $0x10,%esp
 8049b5d:	89 c2                	mov    %eax,%edx
 8049b5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b62:	0f af c2             	imul   %edx,%eax
 8049b65:	29 c3                	sub    %eax,%ebx
 8049b67:	89 d8                	mov    %ebx,%eax
 8049b69:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8049b6c:	c9                   	leave  
 8049b6d:	c3                   	ret    

08049b6e <__divdi3>:
 8049b6e:	55                   	push   %ebp
 8049b6f:	89 e5                	mov    %esp,%ebp
 8049b71:	83 ec 10             	sub    $0x10,%esp
 8049b74:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b77:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049b7a:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049b80:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b83:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b86:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b89:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b8c:	ff 75 f4             	push   -0xc(%ebp)
 8049b8f:	ff 75 f0             	push   -0x10(%ebp)
 8049b92:	ff 75 fc             	push   -0x4(%ebp)
 8049b95:	ff 75 f8             	push   -0x8(%ebp)
 8049b98:	e8 e3 fe ff ff       	call   8049a80 <sdiv64>
 8049b9d:	83 c4 10             	add    $0x10,%esp
 8049ba0:	c9                   	leave  
 8049ba1:	c3                   	ret    

08049ba2 <__moddi3>:
 8049ba2:	55                   	push   %ebp
 8049ba3:	89 e5                	mov    %esp,%ebp
 8049ba5:	83 ec 10             	sub    $0x10,%esp
 8049ba8:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bab:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049bae:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bb1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049bb4:	8b 45 10             	mov    0x10(%ebp),%eax
 8049bb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bba:	8b 45 14             	mov    0x14(%ebp),%eax
 8049bbd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049bc0:	ff 75 f4             	push   -0xc(%ebp)
 8049bc3:	ff 75 f0             	push   -0x10(%ebp)
 8049bc6:	ff 75 fc             	push   -0x4(%ebp)
 8049bc9:	ff 75 f8             	push   -0x8(%ebp)
 8049bcc:	e8 56 ff ff ff       	call   8049b27 <smod64>
 8049bd1:	83 c4 10             	add    $0x10,%esp
 8049bd4:	99                   	cltd   
 8049bd5:	c9                   	leave  
 8049bd6:	c3                   	ret    

08049bd7 <__udivdi3>:
 8049bd7:	55                   	push   %ebp
 8049bd8:	89 e5                	mov    %esp,%ebp
 8049bda:	83 ec 10             	sub    $0x10,%esp
 8049bdd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049be0:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049be3:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049be6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049be9:	8b 45 10             	mov    0x10(%ebp),%eax
 8049bec:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bef:	8b 45 14             	mov    0x14(%ebp),%eax
 8049bf2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049bf5:	ff 75 f4             	push   -0xc(%ebp)
 8049bf8:	ff 75 f0             	push   -0x10(%ebp)
 8049bfb:	ff 75 fc             	push   -0x4(%ebp)
 8049bfe:	ff 75 f8             	push   -0x8(%ebp)
 8049c01:	e8 5c fc ff ff       	call   8049862 <udiv64>
 8049c06:	83 c4 10             	add    $0x10,%esp
 8049c09:	c9                   	leave  
 8049c0a:	c3                   	ret    

08049c0b <__umoddi3>:
 8049c0b:	55                   	push   %ebp
 8049c0c:	89 e5                	mov    %esp,%ebp
 8049c0e:	83 ec 10             	sub    $0x10,%esp
 8049c11:	8b 45 08             	mov    0x8(%ebp),%eax
 8049c14:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049c17:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049c1a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049c1d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049c20:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049c23:	8b 45 14             	mov    0x14(%ebp),%eax
 8049c26:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049c29:	ff 75 f4             	push   -0xc(%ebp)
 8049c2c:	ff 75 f0             	push   -0x10(%ebp)
 8049c2f:	ff 75 fc             	push   -0x4(%ebp)
 8049c32:	ff 75 f8             	push   -0x8(%ebp)
 8049c35:	e8 ff fd ff ff       	call   8049a39 <umod64>
 8049c3a:	83 c4 10             	add    $0x10,%esp
 8049c3d:	ba 00 00 00 00       	mov    $0x0,%edx
 8049c42:	c9                   	leave  
 8049c43:	c3                   	ret    

08049c44 <debug_panic>:
 8049c44:	55                   	push   %ebp
 8049c45:	89 e5                	mov    %esp,%ebp
 8049c47:	83 ec 18             	sub    $0x18,%esp
 8049c4a:	ff 75 10             	push   0x10(%ebp)
 8049c4d:	ff 75 0c             	push   0xc(%ebp)
 8049c50:	ff 75 08             	push   0x8(%ebp)
 8049c53:	68 30 a5 04 08       	push   $0x804a530
 8049c58:	e8 9e e5 ff ff       	call   80481fb <printf>
 8049c5d:	83 c4 10             	add    $0x10,%esp
 8049c60:	8d 45 18             	lea    0x18(%ebp),%eax
 8049c63:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c69:	83 ec 08             	sub    $0x8,%esp
 8049c6c:	50                   	push   %eax
 8049c6d:	ff 75 14             	push   0x14(%ebp)
 8049c70:	e8 5c 02 00 00       	call   8049ed1 <vprintf>
 8049c75:	83 c4 10             	add    $0x10,%esp
 8049c78:	83 ec 0c             	sub    $0xc,%esp
 8049c7b:	6a 0a                	push   $0xa
 8049c7d:	e8 cc 02 00 00       	call   8049f4e <putchar>
 8049c82:	83 c4 10             	add    $0x10,%esp
 8049c85:	e8 c9 03 00 00       	call   804a053 <debug_backtrace>
 8049c8a:	83 ec 0c             	sub    $0xc,%esp
 8049c8d:	6a 01                	push   $0x1
 8049c8f:	e8 26 00 00 00       	call   8049cba <exit>

08049c94 <halt>:
 8049c94:	55                   	push   %ebp
 8049c95:	89 e5                	mov    %esp,%ebp
 8049c97:	83 ec 18             	sub    $0x18,%esp
 8049c9a:	6a 00                	push   $0x0
 8049c9c:	cd 30                	int    $0x30
 8049c9e:	83 c4 04             	add    $0x4,%esp
 8049ca1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049ca4:	68 58 a5 04 08       	push   $0x804a558
 8049ca9:	68 90 a5 04 08       	push   $0x804a590
 8049cae:	6a 44                	push   $0x44
 8049cb0:	68 7a a5 04 08       	push   $0x804a57a
 8049cb5:	e8 8a ff ff ff       	call   8049c44 <debug_panic>

08049cba <exit>:
 8049cba:	55                   	push   %ebp
 8049cbb:	89 e5                	mov    %esp,%ebp
 8049cbd:	83 ec 18             	sub    $0x18,%esp
 8049cc0:	ff 75 08             	push   0x8(%ebp)
 8049cc3:	6a 01                	push   $0x1
 8049cc5:	cd 30                	int    $0x30
 8049cc7:	83 c4 08             	add    $0x8,%esp
 8049cca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049ccd:	68 58 a5 04 08       	push   $0x804a558
 8049cd2:	68 98 a5 04 08       	push   $0x804a598
 8049cd7:	6a 4b                	push   $0x4b
 8049cd9:	68 7a a5 04 08       	push   $0x804a57a
 8049cde:	e8 61 ff ff ff       	call   8049c44 <debug_panic>

08049ce3 <exec>:
 8049ce3:	55                   	push   %ebp
 8049ce4:	89 e5                	mov    %esp,%ebp
 8049ce6:	83 ec 10             	sub    $0x10,%esp
 8049ce9:	ff 75 08             	push   0x8(%ebp)
 8049cec:	6a 02                	push   $0x2
 8049cee:	cd 30                	int    $0x30
 8049cf0:	83 c4 08             	add    $0x8,%esp
 8049cf3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049cf6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049cf9:	c9                   	leave  
 8049cfa:	c3                   	ret    

08049cfb <wait>:
 8049cfb:	55                   	push   %ebp
 8049cfc:	89 e5                	mov    %esp,%ebp
 8049cfe:	83 ec 10             	sub    $0x10,%esp
 8049d01:	ff 75 08             	push   0x8(%ebp)
 8049d04:	6a 03                	push   $0x3
 8049d06:	cd 30                	int    $0x30
 8049d08:	83 c4 08             	add    $0x8,%esp
 8049d0b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d11:	c9                   	leave  
 8049d12:	c3                   	ret    

08049d13 <create>:
 8049d13:	55                   	push   %ebp
 8049d14:	89 e5                	mov    %esp,%ebp
 8049d16:	83 ec 10             	sub    $0x10,%esp
 8049d19:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d1c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d1f:	52                   	push   %edx
 8049d20:	50                   	push   %eax
 8049d21:	6a 04                	push   $0x4
 8049d23:	cd 30                	int    $0x30
 8049d25:	83 c4 0c             	add    $0xc,%esp
 8049d28:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d2e:	85 c0                	test   %eax,%eax
 8049d30:	0f 95 c0             	setne  %al
 8049d33:	c9                   	leave  
 8049d34:	c3                   	ret    

08049d35 <remove>:
 8049d35:	55                   	push   %ebp
 8049d36:	89 e5                	mov    %esp,%ebp
 8049d38:	83 ec 10             	sub    $0x10,%esp
 8049d3b:	ff 75 08             	push   0x8(%ebp)
 8049d3e:	6a 05                	push   $0x5
 8049d40:	cd 30                	int    $0x30
 8049d42:	83 c4 08             	add    $0x8,%esp
 8049d45:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d48:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d4b:	85 c0                	test   %eax,%eax
 8049d4d:	0f 95 c0             	setne  %al
 8049d50:	c9                   	leave  
 8049d51:	c3                   	ret    

08049d52 <open>:
 8049d52:	55                   	push   %ebp
 8049d53:	89 e5                	mov    %esp,%ebp
 8049d55:	83 ec 10             	sub    $0x10,%esp
 8049d58:	ff 75 08             	push   0x8(%ebp)
 8049d5b:	6a 06                	push   $0x6
 8049d5d:	cd 30                	int    $0x30
 8049d5f:	83 c4 08             	add    $0x8,%esp
 8049d62:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d65:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d68:	c9                   	leave  
 8049d69:	c3                   	ret    

08049d6a <filesize>:
 8049d6a:	55                   	push   %ebp
 8049d6b:	89 e5                	mov    %esp,%ebp
 8049d6d:	83 ec 10             	sub    $0x10,%esp
 8049d70:	ff 75 08             	push   0x8(%ebp)
 8049d73:	6a 07                	push   $0x7
 8049d75:	cd 30                	int    $0x30
 8049d77:	83 c4 08             	add    $0x8,%esp
 8049d7a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d80:	c9                   	leave  
 8049d81:	c3                   	ret    

08049d82 <read>:
 8049d82:	55                   	push   %ebp
 8049d83:	89 e5                	mov    %esp,%ebp
 8049d85:	83 ec 10             	sub    $0x10,%esp
 8049d88:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d8b:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d8e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049d91:	51                   	push   %ecx
 8049d92:	52                   	push   %edx
 8049d93:	50                   	push   %eax
 8049d94:	6a 08                	push   $0x8
 8049d96:	cd 30                	int    $0x30
 8049d98:	83 c4 10             	add    $0x10,%esp
 8049d9b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049da1:	c9                   	leave  
 8049da2:	c3                   	ret    

08049da3 <write>:
 8049da3:	55                   	push   %ebp
 8049da4:	89 e5                	mov    %esp,%ebp
 8049da6:	83 ec 10             	sub    $0x10,%esp
 8049da9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dac:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049daf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049db2:	51                   	push   %ecx
 8049db3:	52                   	push   %edx
 8049db4:	50                   	push   %eax
 8049db5:	6a 09                	push   $0x9
 8049db7:	cd 30                	int    $0x30
 8049db9:	83 c4 10             	add    $0x10,%esp
 8049dbc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049dbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049dc2:	c9                   	leave  
 8049dc3:	c3                   	ret    

08049dc4 <seek>:
 8049dc4:	55                   	push   %ebp
 8049dc5:	89 e5                	mov    %esp,%ebp
 8049dc7:	83 ec 10             	sub    $0x10,%esp
 8049dca:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dcd:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049dd0:	52                   	push   %edx
 8049dd1:	50                   	push   %eax
 8049dd2:	6a 0a                	push   $0xa
 8049dd4:	cd 30                	int    $0x30
 8049dd6:	83 c4 0c             	add    $0xc,%esp
 8049dd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049ddc:	90                   	nop
 8049ddd:	c9                   	leave  
 8049dde:	c3                   	ret    

08049ddf <tell>:
 8049ddf:	55                   	push   %ebp
 8049de0:	89 e5                	mov    %esp,%ebp
 8049de2:	83 ec 10             	sub    $0x10,%esp
 8049de5:	ff 75 08             	push   0x8(%ebp)
 8049de8:	6a 0b                	push   $0xb
 8049dea:	cd 30                	int    $0x30
 8049dec:	83 c4 08             	add    $0x8,%esp
 8049def:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049df2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049df5:	c9                   	leave  
 8049df6:	c3                   	ret    

08049df7 <close>:
 8049df7:	55                   	push   %ebp
 8049df8:	89 e5                	mov    %esp,%ebp
 8049dfa:	83 ec 10             	sub    $0x10,%esp
 8049dfd:	ff 75 08             	push   0x8(%ebp)
 8049e00:	6a 0c                	push   $0xc
 8049e02:	cd 30                	int    $0x30
 8049e04:	83 c4 08             	add    $0x8,%esp
 8049e07:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e0a:	90                   	nop
 8049e0b:	c9                   	leave  
 8049e0c:	c3                   	ret    

08049e0d <mmap>:
 8049e0d:	55                   	push   %ebp
 8049e0e:	89 e5                	mov    %esp,%ebp
 8049e10:	83 ec 10             	sub    $0x10,%esp
 8049e13:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e16:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049e19:	52                   	push   %edx
 8049e1a:	50                   	push   %eax
 8049e1b:	6a 0d                	push   $0xd
 8049e1d:	cd 30                	int    $0x30
 8049e1f:	83 c4 0c             	add    $0xc,%esp
 8049e22:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e25:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e28:	c9                   	leave  
 8049e29:	c3                   	ret    

08049e2a <munmap>:
 8049e2a:	55                   	push   %ebp
 8049e2b:	89 e5                	mov    %esp,%ebp
 8049e2d:	83 ec 10             	sub    $0x10,%esp
 8049e30:	ff 75 08             	push   0x8(%ebp)
 8049e33:	6a 0e                	push   $0xe
 8049e35:	cd 30                	int    $0x30
 8049e37:	83 c4 08             	add    $0x8,%esp
 8049e3a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e3d:	90                   	nop
 8049e3e:	c9                   	leave  
 8049e3f:	c3                   	ret    

08049e40 <chdir>:
 8049e40:	55                   	push   %ebp
 8049e41:	89 e5                	mov    %esp,%ebp
 8049e43:	83 ec 10             	sub    $0x10,%esp
 8049e46:	ff 75 08             	push   0x8(%ebp)
 8049e49:	6a 0f                	push   $0xf
 8049e4b:	cd 30                	int    $0x30
 8049e4d:	83 c4 08             	add    $0x8,%esp
 8049e50:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e56:	85 c0                	test   %eax,%eax
 8049e58:	0f 95 c0             	setne  %al
 8049e5b:	c9                   	leave  
 8049e5c:	c3                   	ret    

08049e5d <mkdir>:
 8049e5d:	55                   	push   %ebp
 8049e5e:	89 e5                	mov    %esp,%ebp
 8049e60:	83 ec 10             	sub    $0x10,%esp
 8049e63:	ff 75 08             	push   0x8(%ebp)
 8049e66:	6a 10                	push   $0x10
 8049e68:	cd 30                	int    $0x30
 8049e6a:	83 c4 08             	add    $0x8,%esp
 8049e6d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e70:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e73:	85 c0                	test   %eax,%eax
 8049e75:	0f 95 c0             	setne  %al
 8049e78:	c9                   	leave  
 8049e79:	c3                   	ret    

08049e7a <readdir>:
 8049e7a:	55                   	push   %ebp
 8049e7b:	89 e5                	mov    %esp,%ebp
 8049e7d:	83 ec 10             	sub    $0x10,%esp
 8049e80:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e83:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049e86:	52                   	push   %edx
 8049e87:	50                   	push   %eax
 8049e88:	6a 11                	push   $0x11
 8049e8a:	cd 30                	int    $0x30
 8049e8c:	83 c4 0c             	add    $0xc,%esp
 8049e8f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e92:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e95:	85 c0                	test   %eax,%eax
 8049e97:	0f 95 c0             	setne  %al
 8049e9a:	c9                   	leave  
 8049e9b:	c3                   	ret    

08049e9c <isdir>:
 8049e9c:	55                   	push   %ebp
 8049e9d:	89 e5                	mov    %esp,%ebp
 8049e9f:	83 ec 10             	sub    $0x10,%esp
 8049ea2:	ff 75 08             	push   0x8(%ebp)
 8049ea5:	6a 12                	push   $0x12
 8049ea7:	cd 30                	int    $0x30
 8049ea9:	83 c4 08             	add    $0x8,%esp
 8049eac:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049eaf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049eb2:	85 c0                	test   %eax,%eax
 8049eb4:	0f 95 c0             	setne  %al
 8049eb7:	c9                   	leave  
 8049eb8:	c3                   	ret    

08049eb9 <inumber>:
 8049eb9:	55                   	push   %ebp
 8049eba:	89 e5                	mov    %esp,%ebp
 8049ebc:	83 ec 10             	sub    $0x10,%esp
 8049ebf:	ff 75 08             	push   0x8(%ebp)
 8049ec2:	6a 13                	push   $0x13
 8049ec4:	cd 30                	int    $0x30
 8049ec6:	83 c4 08             	add    $0x8,%esp
 8049ec9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049ecc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049ecf:	c9                   	leave  
 8049ed0:	c3                   	ret    

08049ed1 <vprintf>:
 8049ed1:	55                   	push   %ebp
 8049ed2:	89 e5                	mov    %esp,%ebp
 8049ed4:	83 ec 08             	sub    $0x8,%esp
 8049ed7:	83 ec 04             	sub    $0x4,%esp
 8049eda:	ff 75 0c             	push   0xc(%ebp)
 8049edd:	ff 75 08             	push   0x8(%ebp)
 8049ee0:	6a 01                	push   $0x1
 8049ee2:	e8 8b 00 00 00       	call   8049f72 <vhprintf>
 8049ee7:	83 c4 10             	add    $0x10,%esp
 8049eea:	c9                   	leave  
 8049eeb:	c3                   	ret    

08049eec <hprintf>:
 8049eec:	55                   	push   %ebp
 8049eed:	89 e5                	mov    %esp,%ebp
 8049eef:	83 ec 18             	sub    $0x18,%esp
 8049ef2:	8d 45 10             	lea    0x10(%ebp),%eax
 8049ef5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049ef8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049efb:	83 ec 04             	sub    $0x4,%esp
 8049efe:	50                   	push   %eax
 8049eff:	ff 75 0c             	push   0xc(%ebp)
 8049f02:	ff 75 08             	push   0x8(%ebp)
 8049f05:	e8 68 00 00 00       	call   8049f72 <vhprintf>
 8049f0a:	83 c4 10             	add    $0x10,%esp
 8049f0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049f10:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f13:	c9                   	leave  
 8049f14:	c3                   	ret    

08049f15 <puts>:
 8049f15:	55                   	push   %ebp
 8049f16:	89 e5                	mov    %esp,%ebp
 8049f18:	83 ec 08             	sub    $0x8,%esp
 8049f1b:	83 ec 0c             	sub    $0xc,%esp
 8049f1e:	ff 75 08             	push   0x8(%ebp)
 8049f21:	e8 b5 f6 ff ff       	call   80495db <strlen>
 8049f26:	83 c4 10             	add    $0x10,%esp
 8049f29:	83 ec 04             	sub    $0x4,%esp
 8049f2c:	50                   	push   %eax
 8049f2d:	ff 75 08             	push   0x8(%ebp)
 8049f30:	6a 01                	push   $0x1
 8049f32:	e8 6c fe ff ff       	call   8049da3 <write>
 8049f37:	83 c4 10             	add    $0x10,%esp
 8049f3a:	83 ec 0c             	sub    $0xc,%esp
 8049f3d:	6a 0a                	push   $0xa
 8049f3f:	e8 0a 00 00 00       	call   8049f4e <putchar>
 8049f44:	83 c4 10             	add    $0x10,%esp
 8049f47:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f4c:	c9                   	leave  
 8049f4d:	c3                   	ret    

08049f4e <putchar>:
 8049f4e:	55                   	push   %ebp
 8049f4f:	89 e5                	mov    %esp,%ebp
 8049f51:	83 ec 18             	sub    $0x18,%esp
 8049f54:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f57:	88 45 f7             	mov    %al,-0x9(%ebp)
 8049f5a:	83 ec 04             	sub    $0x4,%esp
 8049f5d:	6a 01                	push   $0x1
 8049f5f:	8d 45 f7             	lea    -0x9(%ebp),%eax
 8049f62:	50                   	push   %eax
 8049f63:	6a 01                	push   $0x1
 8049f65:	e8 39 fe ff ff       	call   8049da3 <write>
 8049f6a:	83 c4 10             	add    $0x10,%esp
 8049f6d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f70:	c9                   	leave  
 8049f71:	c3                   	ret    

08049f72 <vhprintf>:
 8049f72:	55                   	push   %ebp
 8049f73:	89 e5                	mov    %esp,%ebp
 8049f75:	83 ec 58             	sub    $0x58,%esp
 8049f78:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049f7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049f7e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049f85:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f88:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049f8b:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049f8e:	50                   	push   %eax
 8049f8f:	68 b6 9f 04 08       	push   $0x8049fb6
 8049f94:	ff 75 10             	push   0x10(%ebp)
 8049f97:	ff 75 0c             	push   0xc(%ebp)
 8049f9a:	e8 82 e2 ff ff       	call   8048221 <__vprintf>
 8049f9f:	83 c4 10             	add    $0x10,%esp
 8049fa2:	83 ec 0c             	sub    $0xc,%esp
 8049fa5:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049fa8:	50                   	push   %eax
 8049fa9:	e8 5e 00 00 00       	call   804a00c <flush>
 8049fae:	83 c4 10             	add    $0x10,%esp
 8049fb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049fb4:	c9                   	leave  
 8049fb5:	c3                   	ret    

08049fb6 <add_char>:
 8049fb6:	55                   	push   %ebp
 8049fb7:	89 e5                	mov    %esp,%ebp
 8049fb9:	83 ec 28             	sub    $0x28,%esp
 8049fbc:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fbf:	88 45 e4             	mov    %al,-0x1c(%ebp)
 8049fc2:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049fc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049fc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049fcb:	8b 40 40             	mov    0x40(%eax),%eax
 8049fce:	8d 48 01             	lea    0x1(%eax),%ecx
 8049fd1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049fd4:	89 4a 40             	mov    %ecx,0x40(%edx)
 8049fd7:	8a 55 e4             	mov    -0x1c(%ebp),%dl
 8049fda:	88 10                	mov    %dl,(%eax)
 8049fdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049fdf:	8b 40 40             	mov    0x40(%eax),%eax
 8049fe2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049fe5:	83 c2 40             	add    $0x40,%edx
 8049fe8:	39 d0                	cmp    %edx,%eax
 8049fea:	72 0e                	jb     8049ffa <add_char+0x44>
 8049fec:	83 ec 0c             	sub    $0xc,%esp
 8049fef:	ff 75 f4             	push   -0xc(%ebp)
 8049ff2:	e8 15 00 00 00       	call   804a00c <flush>
 8049ff7:	83 c4 10             	add    $0x10,%esp
 8049ffa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ffd:	8b 40 44             	mov    0x44(%eax),%eax
 804a000:	8d 50 01             	lea    0x1(%eax),%edx
 804a003:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a006:	89 50 44             	mov    %edx,0x44(%eax)
 804a009:	90                   	nop
 804a00a:	c9                   	leave  
 804a00b:	c3                   	ret    

0804a00c <flush>:
 804a00c:	55                   	push   %ebp
 804a00d:	89 e5                	mov    %esp,%ebp
 804a00f:	83 ec 08             	sub    $0x8,%esp
 804a012:	8b 45 08             	mov    0x8(%ebp),%eax
 804a015:	8b 50 40             	mov    0x40(%eax),%edx
 804a018:	8b 45 08             	mov    0x8(%ebp),%eax
 804a01b:	39 c2                	cmp    %eax,%edx
 804a01d:	76 28                	jbe    804a047 <flush+0x3b>
 804a01f:	8b 45 08             	mov    0x8(%ebp),%eax
 804a022:	8b 40 40             	mov    0x40(%eax),%eax
 804a025:	89 c2                	mov    %eax,%edx
 804a027:	8b 45 08             	mov    0x8(%ebp),%eax
 804a02a:	29 c2                	sub    %eax,%edx
 804a02c:	89 d0                	mov    %edx,%eax
 804a02e:	89 c1                	mov    %eax,%ecx
 804a030:	8b 55 08             	mov    0x8(%ebp),%edx
 804a033:	8b 45 08             	mov    0x8(%ebp),%eax
 804a036:	8b 40 48             	mov    0x48(%eax),%eax
 804a039:	83 ec 04             	sub    $0x4,%esp
 804a03c:	51                   	push   %ecx
 804a03d:	52                   	push   %edx
 804a03e:	50                   	push   %eax
 804a03f:	e8 5f fd ff ff       	call   8049da3 <write>
 804a044:	83 c4 10             	add    $0x10,%esp
 804a047:	8b 55 08             	mov    0x8(%ebp),%edx
 804a04a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a04d:	89 50 40             	mov    %edx,0x40(%eax)
 804a050:	90                   	nop
 804a051:	c9                   	leave  
 804a052:	c3                   	ret    

0804a053 <debug_backtrace>:
 804a053:	55                   	push   %ebp
 804a054:	89 e5                	mov    %esp,%ebp
 804a056:	83 ec 18             	sub    $0x18,%esp
 804a059:	8b 45 04             	mov    0x4(%ebp),%eax
 804a05c:	83 ec 08             	sub    $0x8,%esp
 804a05f:	50                   	push   %eax
 804a060:	68 a0 a5 04 08       	push   $0x804a5a0
 804a065:	e8 91 e1 ff ff       	call   80481fb <printf>
 804a06a:	83 c4 10             	add    $0x10,%esp
 804a06d:	8b 45 00             	mov    0x0(%ebp),%eax
 804a070:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a073:	eb 21                	jmp    804a096 <debug_backtrace+0x43>
 804a075:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a078:	83 c0 04             	add    $0x4,%eax
 804a07b:	8b 00                	mov    (%eax),%eax
 804a07d:	83 ec 08             	sub    $0x8,%esp
 804a080:	50                   	push   %eax
 804a081:	68 af a5 04 08       	push   $0x804a5af
 804a086:	e8 70 e1 ff ff       	call   80481fb <printf>
 804a08b:	83 c4 10             	add    $0x10,%esp
 804a08e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a091:	8b 00                	mov    (%eax),%eax
 804a093:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a096:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a099:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 804a09e:	76 09                	jbe    804a0a9 <debug_backtrace+0x56>
 804a0a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a0a3:	8b 00                	mov    (%eax),%eax
 804a0a5:	85 c0                	test   %eax,%eax
 804a0a7:	75 cc                	jne    804a075 <debug_backtrace+0x22>
 804a0a9:	83 ec 0c             	sub    $0xc,%esp
 804a0ac:	68 b3 a5 04 08       	push   $0x804a5b3
 804a0b1:	e8 5f fe ff ff       	call   8049f15 <puts>
 804a0b6:	83 c4 10             	add    $0x10,%esp
 804a0b9:	a0 6c b6 04 08       	mov    0x804b66c,%al
 804a0be:	83 f0 01             	xor    $0x1,%eax
 804a0c1:	84 c0                	test   %al,%al
 804a0c3:	74 17                	je     804a0dc <debug_backtrace+0x89>
 804a0c5:	c6 05 6c b6 04 08 01 	movb   $0x1,0x804b66c
 804a0cc:	83 ec 0c             	sub    $0xc,%esp
 804a0cf:	68 b8 a5 04 08       	push   $0x804a5b8
 804a0d4:	e8 3c fe ff ff       	call   8049f15 <puts>
 804a0d9:	83 c4 10             	add    $0x10,%esp
 804a0dc:	90                   	nop
 804a0dd:	c9                   	leave  
 804a0de:	c3                   	ret    
