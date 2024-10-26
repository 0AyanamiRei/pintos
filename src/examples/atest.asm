
atest:     file format elf32-i386


Disassembly of section .text:

08048074 <main>:
 8048074:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048078:	83 e4 f0             	and    $0xfffffff0,%esp
 804807b:	ff 71 fc             	push   -0x4(%ecx)
 804807e:	55                   	push   %ebp
 804807f:	89 e5                	mov    %esp,%ebp
 8048081:	51                   	push   %ecx
 8048082:	83 ec 04             	sub    $0x4,%esp
 8048085:	b8 00 00 00 00       	mov    $0x0,%eax
 804808a:	c7 00 2a 00 00 00    	movl   $0x2a,(%eax)
 8048090:	83 ec 0c             	sub    $0xc,%esp
 8048093:	68 a0 a0 04 08       	push   $0x804a0a0
 8048098:	e8 1f 01 00 00       	call   80481bc <printf>
 804809d:	83 c4 10             	add    $0x10,%esp
 80480a0:	83 ec 0c             	sub    $0xc,%esp
 80480a3:	6a 01                	push   $0x1
 80480a5:	e8 d1 1b 00 00       	call   8049c7b <exit>

080480aa <_start>:
 80480aa:	55                   	push   %ebp
 80480ab:	89 e5                	mov    %esp,%ebp
 80480ad:	83 ec 08             	sub    $0x8,%esp
 80480b0:	83 ec 08             	sub    $0x8,%esp
 80480b3:	ff 75 0c             	push   0xc(%ebp)
 80480b6:	ff 75 08             	push   0x8(%ebp)
 80480b9:	e8 b6 ff ff ff       	call   8048074 <main>
 80480be:	83 c4 10             	add    $0x10,%esp
 80480c1:	83 ec 0c             	sub    $0xc,%esp
 80480c4:	50                   	push   %eax
 80480c5:	e8 b1 1b 00 00       	call   8049c7b <exit>

080480ca <isdigit>:
 80480ca:	55                   	push   %ebp
 80480cb:	89 e5                	mov    %esp,%ebp
 80480cd:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
 80480d1:	7e 0d                	jle    80480e0 <isdigit+0x16>
 80480d3:	83 7d 08 39          	cmpl   $0x39,0x8(%ebp)
 80480d7:	7f 07                	jg     80480e0 <isdigit+0x16>
 80480d9:	b8 01 00 00 00       	mov    $0x1,%eax
 80480de:	eb 05                	jmp    80480e5 <isdigit+0x1b>
 80480e0:	b8 00 00 00 00       	mov    $0x0,%eax
 80480e5:	5d                   	pop    %ebp
 80480e6:	c3                   	ret    

080480e7 <isprint>:
 80480e7:	55                   	push   %ebp
 80480e8:	89 e5                	mov    %esp,%ebp
 80480ea:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
 80480ee:	7e 0d                	jle    80480fd <isprint+0x16>
 80480f0:	83 7d 08 7e          	cmpl   $0x7e,0x8(%ebp)
 80480f4:	7f 07                	jg     80480fd <isprint+0x16>
 80480f6:	b8 01 00 00 00       	mov    $0x1,%eax
 80480fb:	eb 05                	jmp    8048102 <isprint+0x1b>
 80480fd:	b8 00 00 00 00       	mov    $0x0,%eax
 8048102:	5d                   	pop    %ebp
 8048103:	c3                   	ret    

08048104 <vsnprintf>:
 8048104:	55                   	push   %ebp
 8048105:	89 e5                	mov    %esp,%ebp
 8048107:	83 ec 18             	sub    $0x18,%esp
 804810a:	8b 45 08             	mov    0x8(%ebp),%eax
 804810d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048110:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048117:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804811b:	74 06                	je     8048123 <vsnprintf+0x1f>
 804811d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048120:	48                   	dec    %eax
 8048121:	eb 05                	jmp    8048128 <vsnprintf+0x24>
 8048123:	b8 00 00 00 00       	mov    $0x0,%eax
 8048128:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804812b:	8d 45 ec             	lea    -0x14(%ebp),%eax
 804812e:	50                   	push   %eax
 804812f:	68 53 81 04 08       	push   $0x8048153
 8048134:	ff 75 14             	push   0x14(%ebp)
 8048137:	ff 75 10             	push   0x10(%ebp)
 804813a:	e8 a3 00 00 00       	call   80481e2 <__vprintf>
 804813f:	83 c4 10             	add    $0x10,%esp
 8048142:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8048146:	74 06                	je     804814e <vsnprintf+0x4a>
 8048148:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804814b:	c6 00 00             	movb   $0x0,(%eax)
 804814e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048151:	c9                   	leave  
 8048152:	c3                   	ret    

08048153 <vsnprintf_helper>:
 8048153:	55                   	push   %ebp
 8048154:	89 e5                	mov    %esp,%ebp
 8048156:	83 ec 14             	sub    $0x14,%esp
 8048159:	8b 45 08             	mov    0x8(%ebp),%eax
 804815c:	88 45 ec             	mov    %al,-0x14(%ebp)
 804815f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048162:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8048165:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048168:	8b 40 04             	mov    0x4(%eax),%eax
 804816b:	8d 48 01             	lea    0x1(%eax),%ecx
 804816e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048171:	89 4a 04             	mov    %ecx,0x4(%edx)
 8048174:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048177:	8b 52 08             	mov    0x8(%edx),%edx
 804817a:	39 d0                	cmp    %edx,%eax
 804817c:	7d 12                	jge    8048190 <vsnprintf_helper+0x3d>
 804817e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8048181:	8b 00                	mov    (%eax),%eax
 8048183:	8d 48 01             	lea    0x1(%eax),%ecx
 8048186:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8048189:	89 0a                	mov    %ecx,(%edx)
 804818b:	8a 55 ec             	mov    -0x14(%ebp),%dl
 804818e:	88 10                	mov    %dl,(%eax)
 8048190:	90                   	nop
 8048191:	c9                   	leave  
 8048192:	c3                   	ret    

08048193 <snprintf>:
 8048193:	55                   	push   %ebp
 8048194:	89 e5                	mov    %esp,%ebp
 8048196:	83 ec 18             	sub    $0x18,%esp
 8048199:	8d 45 14             	lea    0x14(%ebp),%eax
 804819c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804819f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80481a2:	50                   	push   %eax
 80481a3:	ff 75 10             	push   0x10(%ebp)
 80481a6:	ff 75 0c             	push   0xc(%ebp)
 80481a9:	ff 75 08             	push   0x8(%ebp)
 80481ac:	e8 53 ff ff ff       	call   8048104 <vsnprintf>
 80481b1:	83 c4 10             	add    $0x10,%esp
 80481b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80481b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481ba:	c9                   	leave  
 80481bb:	c3                   	ret    

080481bc <printf>:
 80481bc:	55                   	push   %ebp
 80481bd:	89 e5                	mov    %esp,%ebp
 80481bf:	83 ec 18             	sub    $0x18,%esp
 80481c2:	8d 45 0c             	lea    0xc(%ebp),%eax
 80481c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80481c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80481cb:	83 ec 08             	sub    $0x8,%esp
 80481ce:	50                   	push   %eax
 80481cf:	ff 75 08             	push   0x8(%ebp)
 80481d2:	e8 bb 1c 00 00       	call   8049e92 <vprintf>
 80481d7:	83 c4 10             	add    $0x10,%esp
 80481da:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80481dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80481e0:	c9                   	leave  
 80481e1:	c3                   	ret    

080481e2 <__vprintf>:
 80481e2:	55                   	push   %ebp
 80481e3:	89 e5                	mov    %esp,%ebp
 80481e5:	53                   	push   %ebx
 80481e6:	83 ec 34             	sub    $0x34,%esp
 80481e9:	e9 25 04 00 00       	jmp    8048613 <__vprintf+0x431>
 80481ee:	8b 45 08             	mov    0x8(%ebp),%eax
 80481f1:	8a 00                	mov    (%eax),%al
 80481f3:	3c 25                	cmp    $0x25,%al
 80481f5:	74 1c                	je     8048213 <__vprintf+0x31>
 80481f7:	8b 45 08             	mov    0x8(%ebp),%eax
 80481fa:	8a 00                	mov    (%eax),%al
 80481fc:	0f be c0             	movsbl %al,%eax
 80481ff:	83 ec 08             	sub    $0x8,%esp
 8048202:	ff 75 14             	push   0x14(%ebp)
 8048205:	50                   	push   %eax
 8048206:	8b 45 10             	mov    0x10(%ebp),%eax
 8048209:	ff d0                	call   *%eax
 804820b:	83 c4 10             	add    $0x10,%esp
 804820e:	e9 fd 03 00 00       	jmp    8048610 <__vprintf+0x42e>
 8048213:	ff 45 08             	incl   0x8(%ebp)
 8048216:	8b 45 08             	mov    0x8(%ebp),%eax
 8048219:	8a 00                	mov    (%eax),%al
 804821b:	3c 25                	cmp    $0x25,%al
 804821d:	75 15                	jne    8048234 <__vprintf+0x52>
 804821f:	83 ec 08             	sub    $0x8,%esp
 8048222:	ff 75 14             	push   0x14(%ebp)
 8048225:	6a 25                	push   $0x25
 8048227:	8b 45 10             	mov    0x10(%ebp),%eax
 804822a:	ff d0                	call   *%eax
 804822c:	83 c4 10             	add    $0x10,%esp
 804822f:	e9 dc 03 00 00       	jmp    8048610 <__vprintf+0x42e>
 8048234:	83 ec 04             	sub    $0x4,%esp
 8048237:	8d 45 0c             	lea    0xc(%ebp),%eax
 804823a:	50                   	push   %eax
 804823b:	8d 45 cc             	lea    -0x34(%ebp),%eax
 804823e:	50                   	push   %eax
 804823f:	ff 75 08             	push   0x8(%ebp)
 8048242:	e8 df 03 00 00       	call   8048626 <parse_conversion>
 8048247:	83 c4 10             	add    $0x10,%esp
 804824a:	89 45 08             	mov    %eax,0x8(%ebp)
 804824d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048250:	8a 00                	mov    (%eax),%al
 8048252:	0f be c0             	movsbl %al,%eax
 8048255:	83 e8 45             	sub    $0x45,%eax
 8048258:	83 f8 33             	cmp    $0x33,%eax
 804825b:	0f 87 92 03 00 00    	ja     80485f3 <__vprintf+0x411>
 8048261:	8b 04 85 98 a1 04 08 	mov    0x804a198(,%eax,4),%eax
 8048268:	ff e0                	jmp    *%eax
 804826a:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804826d:	83 f8 08             	cmp    $0x8,%eax
 8048270:	0f 87 d8 00 00 00    	ja     804834e <__vprintf+0x16c>
 8048276:	8b 04 85 68 a2 04 08 	mov    0x804a268(,%eax,4),%eax
 804827d:	ff e0                	jmp    *%eax
 804827f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048282:	8d 50 04             	lea    0x4(%eax),%edx
 8048285:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048288:	8b 00                	mov    (%eax),%eax
 804828a:	0f be c0             	movsbl %al,%eax
 804828d:	99                   	cltd   
 804828e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048291:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048294:	e9 cf 00 00 00       	jmp    8048368 <__vprintf+0x186>
 8048299:	8b 45 0c             	mov    0xc(%ebp),%eax
 804829c:	8d 50 04             	lea    0x4(%eax),%edx
 804829f:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482a2:	8b 00                	mov    (%eax),%eax
 80482a4:	98                   	cwtl   
 80482a5:	99                   	cltd   
 80482a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482a9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80482ac:	e9 b7 00 00 00       	jmp    8048368 <__vprintf+0x186>
 80482b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482b4:	8d 50 04             	lea    0x4(%eax),%edx
 80482b7:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482ba:	8b 00                	mov    (%eax),%eax
 80482bc:	99                   	cltd   
 80482bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482c0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80482c3:	e9 a0 00 00 00       	jmp    8048368 <__vprintf+0x186>
 80482c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482cb:	8d 50 08             	lea    0x8(%eax),%edx
 80482ce:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482d1:	8b 50 04             	mov    0x4(%eax),%edx
 80482d4:	8b 00                	mov    (%eax),%eax
 80482d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482d9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80482dc:	e9 87 00 00 00       	jmp    8048368 <__vprintf+0x186>
 80482e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482e4:	8d 50 04             	lea    0x4(%eax),%edx
 80482e7:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482ea:	8b 00                	mov    (%eax),%eax
 80482ec:	99                   	cltd   
 80482ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80482f0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80482f3:	eb 73                	jmp    8048368 <__vprintf+0x186>
 80482f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80482f8:	8d 50 08             	lea    0x8(%eax),%edx
 80482fb:	89 55 0c             	mov    %edx,0xc(%ebp)
 80482fe:	8b 50 04             	mov    0x4(%eax),%edx
 8048301:	8b 00                	mov    (%eax),%eax
 8048303:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048306:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048309:	eb 5d                	jmp    8048368 <__vprintf+0x186>
 804830b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804830e:	8d 50 04             	lea    0x4(%eax),%edx
 8048311:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048314:	8b 00                	mov    (%eax),%eax
 8048316:	99                   	cltd   
 8048317:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804831a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 804831d:	eb 49                	jmp    8048368 <__vprintf+0x186>
 804831f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048322:	8d 50 04             	lea    0x4(%eax),%edx
 8048325:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048328:	8b 00                	mov    (%eax),%eax
 804832a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804832d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048334:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048338:	78 2d                	js     8048367 <__vprintf+0x185>
 804833a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804833e:	7f 09                	jg     8048349 <__vprintf+0x167>
 8048340:	81 7d f0 ff ff ff 7f 	cmpl   $0x7fffffff,-0x10(%ebp)
 8048347:	76 1e                	jbe    8048367 <__vprintf+0x185>
 8048349:	ff 4d f4             	decl   -0xc(%ebp)
 804834c:	eb 19                	jmp    8048367 <__vprintf+0x185>
 804834e:	68 30 a1 04 08       	push   $0x804a130
 8048353:	68 64 a3 04 08       	push   $0x804a364
 8048358:	68 dc 00 00 00       	push   $0xdc
 804835d:	68 52 a1 04 08       	push   $0x804a152
 8048362:	e8 9e 18 00 00       	call   8049c05 <debug_panic>
 8048367:	90                   	nop
 8048368:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804836b:	c1 e8 1f             	shr    $0x1f,%eax
 804836e:	0f b6 c8             	movzbl %al,%ecx
 8048371:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048374:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048377:	85 d2                	test   %edx,%edx
 8048379:	79 07                	jns    8048382 <__vprintf+0x1a0>
 804837b:	f7 d8                	neg    %eax
 804837d:	83 d2 00             	adc    $0x0,%edx
 8048380:	f7 da                	neg    %edx
 8048382:	ff 75 14             	push   0x14(%ebp)
 8048385:	ff 75 10             	push   0x10(%ebp)
 8048388:	8d 5d cc             	lea    -0x34(%ebp),%ebx
 804838b:	53                   	push   %ebx
 804838c:	68 bc a0 04 08       	push   $0x804a0bc
 8048391:	51                   	push   %ecx
 8048392:	6a 01                	push   $0x1
 8048394:	52                   	push   %edx
 8048395:	50                   	push   %eax
 8048396:	e8 3f 05 00 00       	call   80488da <format_integer>
 804839b:	83 c4 20             	add    $0x20,%esp
 804839e:	e9 6d 02 00 00       	jmp    8048610 <__vprintf+0x42e>
 80483a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80483a6:	83 f8 08             	cmp    $0x8,%eax
 80483a9:	0f 87 d3 00 00 00    	ja     8048482 <__vprintf+0x2a0>
 80483af:	8b 04 85 8c a2 04 08 	mov    0x804a28c(,%eax,4),%eax
 80483b6:	ff e0                	jmp    *%eax
 80483b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80483bb:	8d 50 04             	lea    0x4(%eax),%edx
 80483be:	89 55 0c             	mov    %edx,0xc(%ebp)
 80483c1:	8b 00                	mov    (%eax),%eax
 80483c3:	0f b6 c0             	movzbl %al,%eax
 80483c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80483c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80483d0:	e9 c6 00 00 00       	jmp    804849b <__vprintf+0x2b9>
 80483d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80483d8:	8d 50 04             	lea    0x4(%eax),%edx
 80483db:	89 55 0c             	mov    %edx,0xc(%ebp)
 80483de:	8b 00                	mov    (%eax),%eax
 80483e0:	0f b7 c0             	movzwl %ax,%eax
 80483e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80483e6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80483ed:	e9 a9 00 00 00       	jmp    804849b <__vprintf+0x2b9>
 80483f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80483f5:	8d 50 04             	lea    0x4(%eax),%edx
 80483f8:	89 55 0c             	mov    %edx,0xc(%ebp)
 80483fb:	8b 00                	mov    (%eax),%eax
 80483fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048400:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048407:	e9 8f 00 00 00       	jmp    804849b <__vprintf+0x2b9>
 804840c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804840f:	8d 50 08             	lea    0x8(%eax),%edx
 8048412:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048415:	8b 50 04             	mov    0x4(%eax),%edx
 8048418:	8b 00                	mov    (%eax),%eax
 804841a:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804841d:	89 55 ec             	mov    %edx,-0x14(%ebp)
 8048420:	eb 79                	jmp    804849b <__vprintf+0x2b9>
 8048422:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048425:	8d 50 04             	lea    0x4(%eax),%edx
 8048428:	89 55 0c             	mov    %edx,0xc(%ebp)
 804842b:	8b 00                	mov    (%eax),%eax
 804842d:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048430:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048437:	eb 62                	jmp    804849b <__vprintf+0x2b9>
 8048439:	8b 45 0c             	mov    0xc(%ebp),%eax
 804843c:	8d 50 08             	lea    0x8(%eax),%edx
 804843f:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048442:	8b 50 04             	mov    0x4(%eax),%edx
 8048445:	8b 00                	mov    (%eax),%eax
 8048447:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804844a:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804844d:	eb 4c                	jmp    804849b <__vprintf+0x2b9>
 804844f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048452:	8d 50 04             	lea    0x4(%eax),%edx
 8048455:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048458:	8b 00                	mov    (%eax),%eax
 804845a:	99                   	cltd   
 804845b:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804845e:	89 55 ec             	mov    %edx,-0x14(%ebp)
 8048461:	83 65 e8 ff          	andl   $0xffffffff,-0x18(%ebp)
 8048465:	83 65 ec 00          	andl   $0x0,-0x14(%ebp)
 8048469:	eb 30                	jmp    804849b <__vprintf+0x2b9>
 804846b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804846e:	8d 50 04             	lea    0x4(%eax),%edx
 8048471:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048474:	8b 00                	mov    (%eax),%eax
 8048476:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048479:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048480:	eb 19                	jmp    804849b <__vprintf+0x2b9>
 8048482:	68 30 a1 04 08       	push   $0x804a130
 8048487:	68 64 a3 04 08       	push   $0x804a364
 804848c:	68 0b 01 00 00       	push   $0x10b
 8048491:	68 52 a1 04 08       	push   $0x804a152
 8048496:	e8 6a 17 00 00       	call   8049c05 <debug_panic>
 804849b:	8b 45 08             	mov    0x8(%ebp),%eax
 804849e:	8a 00                	mov    (%eax),%al
 80484a0:	0f be c0             	movsbl %al,%eax
 80484a3:	83 f8 6f             	cmp    $0x6f,%eax
 80484a6:	74 18                	je     80484c0 <__vprintf+0x2de>
 80484a8:	83 f8 6f             	cmp    $0x6f,%eax
 80484ab:	7f 07                	jg     80484b4 <__vprintf+0x2d2>
 80484ad:	83 f8 58             	cmp    $0x58,%eax
 80484b0:	74 29                	je     80484db <__vprintf+0x2f9>
 80484b2:	eb 30                	jmp    80484e4 <__vprintf+0x302>
 80484b4:	83 f8 75             	cmp    $0x75,%eax
 80484b7:	74 10                	je     80484c9 <__vprintf+0x2e7>
 80484b9:	83 f8 78             	cmp    $0x78,%eax
 80484bc:	74 14                	je     80484d2 <__vprintf+0x2f0>
 80484be:	eb 24                	jmp    80484e4 <__vprintf+0x302>
 80484c0:	c7 45 e4 d8 a0 04 08 	movl   $0x804a0d8,-0x1c(%ebp)
 80484c7:	eb 34                	jmp    80484fd <__vprintf+0x31b>
 80484c9:	c7 45 e4 bc a0 04 08 	movl   $0x804a0bc,-0x1c(%ebp)
 80484d0:	eb 2b                	jmp    80484fd <__vprintf+0x31b>
 80484d2:	c7 45 e4 fc a0 04 08 	movl   $0x804a0fc,-0x1c(%ebp)
 80484d9:	eb 22                	jmp    80484fd <__vprintf+0x31b>
 80484db:	c7 45 e4 20 a1 04 08 	movl   $0x804a120,-0x1c(%ebp)
 80484e2:	eb 19                	jmp    80484fd <__vprintf+0x31b>
 80484e4:	68 30 a1 04 08       	push   $0x804a130
 80484e9:	68 64 a3 04 08       	push   $0x804a364
 80484ee:	68 14 01 00 00       	push   $0x114
 80484f3:	68 52 a1 04 08       	push   $0x804a152
 80484f8:	e8 08 17 00 00       	call   8049c05 <debug_panic>
 80484fd:	ff 75 14             	push   0x14(%ebp)
 8048500:	ff 75 10             	push   0x10(%ebp)
 8048503:	8d 45 cc             	lea    -0x34(%ebp),%eax
 8048506:	50                   	push   %eax
 8048507:	ff 75 e4             	push   -0x1c(%ebp)
 804850a:	6a 00                	push   $0x0
 804850c:	6a 00                	push   $0x0
 804850e:	ff 75 ec             	push   -0x14(%ebp)
 8048511:	ff 75 e8             	push   -0x18(%ebp)
 8048514:	e8 c1 03 00 00       	call   80488da <format_integer>
 8048519:	83 c4 20             	add    $0x20,%esp
 804851c:	e9 ef 00 00 00       	jmp    8048610 <__vprintf+0x42e>
 8048521:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048524:	8d 50 04             	lea    0x4(%eax),%edx
 8048527:	89 55 0c             	mov    %edx,0xc(%ebp)
 804852a:	8b 00                	mov    (%eax),%eax
 804852c:	88 45 cb             	mov    %al,-0x35(%ebp)
 804852f:	83 ec 0c             	sub    $0xc,%esp
 8048532:	ff 75 14             	push   0x14(%ebp)
 8048535:	ff 75 10             	push   0x10(%ebp)
 8048538:	8d 45 cc             	lea    -0x34(%ebp),%eax
 804853b:	50                   	push   %eax
 804853c:	6a 01                	push   $0x1
 804853e:	8d 45 cb             	lea    -0x35(%ebp),%eax
 8048541:	50                   	push   %eax
 8048542:	e8 ed 06 00 00       	call   8048c34 <format_string>
 8048547:	83 c4 20             	add    $0x20,%esp
 804854a:	e9 c1 00 00 00       	jmp    8048610 <__vprintf+0x42e>
 804854f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048552:	8d 50 04             	lea    0x4(%eax),%edx
 8048555:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048558:	8b 00                	mov    (%eax),%eax
 804855a:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804855d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8048561:	75 07                	jne    804856a <__vprintf+0x388>
 8048563:	c7 45 e0 61 a1 04 08 	movl   $0x804a161,-0x20(%ebp)
 804856a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804856d:	83 ec 08             	sub    $0x8,%esp
 8048570:	50                   	push   %eax
 8048571:	ff 75 e0             	push   -0x20(%ebp)
 8048574:	e8 70 10 00 00       	call   80495e9 <strnlen>
 8048579:	83 c4 10             	add    $0x10,%esp
 804857c:	89 c2                	mov    %eax,%edx
 804857e:	83 ec 0c             	sub    $0xc,%esp
 8048581:	ff 75 14             	push   0x14(%ebp)
 8048584:	ff 75 10             	push   0x10(%ebp)
 8048587:	8d 45 cc             	lea    -0x34(%ebp),%eax
 804858a:	50                   	push   %eax
 804858b:	52                   	push   %edx
 804858c:	ff 75 e0             	push   -0x20(%ebp)
 804858f:	e8 a0 06 00 00       	call   8048c34 <format_string>
 8048594:	83 c4 20             	add    $0x20,%esp
 8048597:	eb 77                	jmp    8048610 <__vprintf+0x42e>
 8048599:	8b 45 0c             	mov    0xc(%ebp),%eax
 804859c:	8d 50 04             	lea    0x4(%eax),%edx
 804859f:	89 55 0c             	mov    %edx,0xc(%ebp)
 80485a2:	8b 00                	mov    (%eax),%eax
 80485a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
 80485a7:	c7 45 cc 08 00 00 00 	movl   $0x8,-0x34(%ebp)
 80485ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
 80485b1:	ba 00 00 00 00       	mov    $0x0,%edx
 80485b6:	ff 75 14             	push   0x14(%ebp)
 80485b9:	ff 75 10             	push   0x10(%ebp)
 80485bc:	8d 4d cc             	lea    -0x34(%ebp),%ecx
 80485bf:	51                   	push   %ecx
 80485c0:	68 fc a0 04 08       	push   $0x804a0fc
 80485c5:	6a 00                	push   $0x0
 80485c7:	6a 00                	push   $0x0
 80485c9:	52                   	push   %edx
 80485ca:	50                   	push   %eax
 80485cb:	e8 0a 03 00 00       	call   80488da <format_integer>
 80485d0:	83 c4 20             	add    $0x20,%esp
 80485d3:	eb 3b                	jmp    8048610 <__vprintf+0x42e>
 80485d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80485d8:	8a 00                	mov    (%eax),%al
 80485da:	0f be c0             	movsbl %al,%eax
 80485dd:	50                   	push   %eax
 80485de:	ff 75 14             	push   0x14(%ebp)
 80485e1:	ff 75 10             	push   0x10(%ebp)
 80485e4:	68 68 a1 04 08       	push   $0x804a168
 80485e9:	e8 e1 06 00 00       	call   8048ccf <__printf>
 80485ee:	83 c4 10             	add    $0x10,%esp
 80485f1:	eb 1d                	jmp    8048610 <__vprintf+0x42e>
 80485f3:	8b 45 08             	mov    0x8(%ebp),%eax
 80485f6:	8a 00                	mov    (%eax),%al
 80485f8:	0f be c0             	movsbl %al,%eax
 80485fb:	50                   	push   %eax
 80485fc:	ff 75 14             	push   0x14(%ebp)
 80485ff:	ff 75 10             	push   0x10(%ebp)
 8048602:	68 7e a1 04 08       	push   $0x804a17e
 8048607:	e8 c3 06 00 00       	call   8048ccf <__printf>
 804860c:	83 c4 10             	add    $0x10,%esp
 804860f:	90                   	nop
 8048610:	ff 45 08             	incl   0x8(%ebp)
 8048613:	8b 45 08             	mov    0x8(%ebp),%eax
 8048616:	8a 00                	mov    (%eax),%al
 8048618:	84 c0                	test   %al,%al
 804861a:	0f 85 ce fb ff ff    	jne    80481ee <__vprintf+0xc>
 8048620:	90                   	nop
 8048621:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8048624:	c9                   	leave  
 8048625:	c3                   	ret    

08048626 <parse_conversion>:
 8048626:	55                   	push   %ebp
 8048627:	89 e5                	mov    %esp,%ebp
 8048629:	8b 45 0c             	mov    0xc(%ebp),%eax
 804862c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8048632:	8b 45 08             	mov    0x8(%ebp),%eax
 8048635:	8d 50 01             	lea    0x1(%eax),%edx
 8048638:	89 55 08             	mov    %edx,0x8(%ebp)
 804863b:	8a 00                	mov    (%eax),%al
 804863d:	0f be c0             	movsbl %al,%eax
 8048640:	83 e8 20             	sub    $0x20,%eax
 8048643:	83 f8 10             	cmp    $0x10,%eax
 8048646:	77 6f                	ja     80486b7 <parse_conversion+0x91>
 8048648:	8b 04 85 b0 a2 04 08 	mov    0x804a2b0(,%eax,4),%eax
 804864f:	ff e0                	jmp    *%eax
 8048651:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048654:	8b 00                	mov    (%eax),%eax
 8048656:	83 c8 01             	or     $0x1,%eax
 8048659:	89 c2                	mov    %eax,%edx
 804865b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804865e:	89 10                	mov    %edx,(%eax)
 8048660:	eb 67                	jmp    80486c9 <parse_conversion+0xa3>
 8048662:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048665:	8b 00                	mov    (%eax),%eax
 8048667:	83 c8 02             	or     $0x2,%eax
 804866a:	89 c2                	mov    %eax,%edx
 804866c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804866f:	89 10                	mov    %edx,(%eax)
 8048671:	eb 56                	jmp    80486c9 <parse_conversion+0xa3>
 8048673:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048676:	8b 00                	mov    (%eax),%eax
 8048678:	83 c8 04             	or     $0x4,%eax
 804867b:	89 c2                	mov    %eax,%edx
 804867d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048680:	89 10                	mov    %edx,(%eax)
 8048682:	eb 45                	jmp    80486c9 <parse_conversion+0xa3>
 8048684:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048687:	8b 00                	mov    (%eax),%eax
 8048689:	83 c8 08             	or     $0x8,%eax
 804868c:	89 c2                	mov    %eax,%edx
 804868e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048691:	89 10                	mov    %edx,(%eax)
 8048693:	eb 34                	jmp    80486c9 <parse_conversion+0xa3>
 8048695:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048698:	8b 00                	mov    (%eax),%eax
 804869a:	83 c8 10             	or     $0x10,%eax
 804869d:	89 c2                	mov    %eax,%edx
 804869f:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486a2:	89 10                	mov    %edx,(%eax)
 80486a4:	eb 23                	jmp    80486c9 <parse_conversion+0xa3>
 80486a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486a9:	8b 00                	mov    (%eax),%eax
 80486ab:	83 c8 20             	or     $0x20,%eax
 80486ae:	89 c2                	mov    %eax,%edx
 80486b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486b3:	89 10                	mov    %edx,(%eax)
 80486b5:	eb 12                	jmp    80486c9 <parse_conversion+0xa3>
 80486b7:	ff 4d 08             	decl   0x8(%ebp)
 80486ba:	90                   	nop
 80486bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486be:	8b 00                	mov    (%eax),%eax
 80486c0:	83 e0 01             	and    $0x1,%eax
 80486c3:	85 c0                	test   %eax,%eax
 80486c5:	74 16                	je     80486dd <parse_conversion+0xb7>
 80486c7:	eb 05                	jmp    80486ce <parse_conversion+0xa8>
 80486c9:	e9 64 ff ff ff       	jmp    8048632 <parse_conversion+0xc>
 80486ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486d1:	8b 00                	mov    (%eax),%eax
 80486d3:	83 e0 ef             	and    $0xffffffef,%eax
 80486d6:	89 c2                	mov    %eax,%edx
 80486d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486db:	89 10                	mov    %edx,(%eax)
 80486dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486e0:	8b 00                	mov    (%eax),%eax
 80486e2:	83 e0 02             	and    $0x2,%eax
 80486e5:	85 c0                	test   %eax,%eax
 80486e7:	74 0f                	je     80486f8 <parse_conversion+0xd2>
 80486e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486ec:	8b 00                	mov    (%eax),%eax
 80486ee:	83 e0 fb             	and    $0xfffffffb,%eax
 80486f1:	89 c2                	mov    %eax,%edx
 80486f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486f6:	89 10                	mov    %edx,(%eax)
 80486f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80486fb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 8048702:	8b 45 08             	mov    0x8(%ebp),%eax
 8048705:	8a 00                	mov    (%eax),%al
 8048707:	3c 2a                	cmp    $0x2a,%al
 8048709:	75 41                	jne    804874c <parse_conversion+0x126>
 804870b:	ff 45 08             	incl   0x8(%ebp)
 804870e:	8b 45 10             	mov    0x10(%ebp),%eax
 8048711:	8b 00                	mov    (%eax),%eax
 8048713:	8d 48 04             	lea    0x4(%eax),%ecx
 8048716:	8b 55 10             	mov    0x10(%ebp),%edx
 8048719:	89 0a                	mov    %ecx,(%edx)
 804871b:	8b 10                	mov    (%eax),%edx
 804871d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048720:	89 50 04             	mov    %edx,0x4(%eax)
 8048723:	eb 3c                	jmp    8048761 <parse_conversion+0x13b>
 8048725:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048728:	8b 50 04             	mov    0x4(%eax),%edx
 804872b:	89 d0                	mov    %edx,%eax
 804872d:	c1 e0 02             	shl    $0x2,%eax
 8048730:	01 d0                	add    %edx,%eax
 8048732:	01 c0                	add    %eax,%eax
 8048734:	89 c2                	mov    %eax,%edx
 8048736:	8b 45 08             	mov    0x8(%ebp),%eax
 8048739:	8a 00                	mov    (%eax),%al
 804873b:	0f be c0             	movsbl %al,%eax
 804873e:	01 d0                	add    %edx,%eax
 8048740:	8d 50 d0             	lea    -0x30(%eax),%edx
 8048743:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048746:	89 50 04             	mov    %edx,0x4(%eax)
 8048749:	ff 45 08             	incl   0x8(%ebp)
 804874c:	8b 45 08             	mov    0x8(%ebp),%eax
 804874f:	8a 00                	mov    (%eax),%al
 8048751:	0f be c0             	movsbl %al,%eax
 8048754:	50                   	push   %eax
 8048755:	e8 70 f9 ff ff       	call   80480ca <isdigit>
 804875a:	83 c4 04             	add    $0x4,%esp
 804875d:	85 c0                	test   %eax,%eax
 804875f:	75 c4                	jne    8048725 <parse_conversion+0xff>
 8048761:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048764:	8b 40 04             	mov    0x4(%eax),%eax
 8048767:	85 c0                	test   %eax,%eax
 8048769:	79 1f                	jns    804878a <parse_conversion+0x164>
 804876b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804876e:	8b 40 04             	mov    0x4(%eax),%eax
 8048771:	f7 d8                	neg    %eax
 8048773:	89 c2                	mov    %eax,%edx
 8048775:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048778:	89 50 04             	mov    %edx,0x4(%eax)
 804877b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804877e:	8b 00                	mov    (%eax),%eax
 8048780:	83 c8 01             	or     $0x1,%eax
 8048783:	89 c2                	mov    %eax,%edx
 8048785:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048788:	89 10                	mov    %edx,(%eax)
 804878a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804878d:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
 8048794:	8b 45 08             	mov    0x8(%ebp),%eax
 8048797:	8a 00                	mov    (%eax),%al
 8048799:	3c 2e                	cmp    $0x2e,%al
 804879b:	0f 85 82 00 00 00    	jne    8048823 <parse_conversion+0x1fd>
 80487a1:	ff 45 08             	incl   0x8(%ebp)
 80487a4:	8b 45 08             	mov    0x8(%ebp),%eax
 80487a7:	8a 00                	mov    (%eax),%al
 80487a9:	3c 2a                	cmp    $0x2a,%al
 80487ab:	75 1a                	jne    80487c7 <parse_conversion+0x1a1>
 80487ad:	ff 45 08             	incl   0x8(%ebp)
 80487b0:	8b 45 10             	mov    0x10(%ebp),%eax
 80487b3:	8b 00                	mov    (%eax),%eax
 80487b5:	8d 48 04             	lea    0x4(%eax),%ecx
 80487b8:	8b 55 10             	mov    0x10(%ebp),%edx
 80487bb:	89 0a                	mov    %ecx,(%edx)
 80487bd:	8b 10                	mov    (%eax),%edx
 80487bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487c2:	89 50 08             	mov    %edx,0x8(%eax)
 80487c5:	eb 48                	jmp    804880f <parse_conversion+0x1e9>
 80487c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487ca:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 80487d1:	eb 27                	jmp    80487fa <parse_conversion+0x1d4>
 80487d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487d6:	8b 50 08             	mov    0x8(%eax),%edx
 80487d9:	89 d0                	mov    %edx,%eax
 80487db:	c1 e0 02             	shl    $0x2,%eax
 80487de:	01 d0                	add    %edx,%eax
 80487e0:	01 c0                	add    %eax,%eax
 80487e2:	89 c2                	mov    %eax,%edx
 80487e4:	8b 45 08             	mov    0x8(%ebp),%eax
 80487e7:	8a 00                	mov    (%eax),%al
 80487e9:	0f be c0             	movsbl %al,%eax
 80487ec:	01 d0                	add    %edx,%eax
 80487ee:	8d 50 d0             	lea    -0x30(%eax),%edx
 80487f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487f4:	89 50 08             	mov    %edx,0x8(%eax)
 80487f7:	ff 45 08             	incl   0x8(%ebp)
 80487fa:	8b 45 08             	mov    0x8(%ebp),%eax
 80487fd:	8a 00                	mov    (%eax),%al
 80487ff:	0f be c0             	movsbl %al,%eax
 8048802:	50                   	push   %eax
 8048803:	e8 c2 f8 ff ff       	call   80480ca <isdigit>
 8048808:	83 c4 04             	add    $0x4,%esp
 804880b:	85 c0                	test   %eax,%eax
 804880d:	75 c4                	jne    80487d3 <parse_conversion+0x1ad>
 804880f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048812:	8b 40 08             	mov    0x8(%eax),%eax
 8048815:	85 c0                	test   %eax,%eax
 8048817:	79 0a                	jns    8048823 <parse_conversion+0x1fd>
 8048819:	8b 45 0c             	mov    0xc(%ebp),%eax
 804881c:	c7 40 08 ff ff ff ff 	movl   $0xffffffff,0x8(%eax)
 8048823:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048826:	8b 40 08             	mov    0x8(%eax),%eax
 8048829:	85 c0                	test   %eax,%eax
 804882b:	78 0f                	js     804883c <parse_conversion+0x216>
 804882d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048830:	8b 00                	mov    (%eax),%eax
 8048832:	83 e0 ef             	and    $0xffffffef,%eax
 8048835:	89 c2                	mov    %eax,%edx
 8048837:	8b 45 0c             	mov    0xc(%ebp),%eax
 804883a:	89 10                	mov    %edx,(%eax)
 804883c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804883f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
 8048846:	8b 45 08             	mov    0x8(%ebp),%eax
 8048849:	8d 50 01             	lea    0x1(%eax),%edx
 804884c:	89 55 08             	mov    %edx,0x8(%ebp)
 804884f:	8a 00                	mov    (%eax),%al
 8048851:	0f be c0             	movsbl %al,%eax
 8048854:	83 e8 68             	sub    $0x68,%eax
 8048857:	83 f8 12             	cmp    $0x12,%eax
 804885a:	77 75                	ja     80488d1 <parse_conversion+0x2ab>
 804885c:	8b 04 85 f4 a2 04 08 	mov    0x804a2f4(,%eax,4),%eax
 8048863:	ff e0                	jmp    *%eax
 8048865:	8b 45 08             	mov    0x8(%ebp),%eax
 8048868:	8a 00                	mov    (%eax),%al
 804886a:	3c 68                	cmp    $0x68,%al
 804886c:	75 0f                	jne    804887d <parse_conversion+0x257>
 804886e:	ff 45 08             	incl   0x8(%ebp)
 8048871:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048874:	c7 40 0c 01 00 00 00 	movl   $0x1,0xc(%eax)
 804887b:	eb 58                	jmp    80488d5 <parse_conversion+0x2af>
 804887d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048880:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
 8048887:	eb 4c                	jmp    80488d5 <parse_conversion+0x2af>
 8048889:	8b 45 0c             	mov    0xc(%ebp),%eax
 804888c:	c7 40 0c 04 00 00 00 	movl   $0x4,0xc(%eax)
 8048893:	eb 40                	jmp    80488d5 <parse_conversion+0x2af>
 8048895:	8b 45 08             	mov    0x8(%ebp),%eax
 8048898:	8a 00                	mov    (%eax),%al
 804889a:	3c 6c                	cmp    $0x6c,%al
 804889c:	75 0f                	jne    80488ad <parse_conversion+0x287>
 804889e:	ff 45 08             	incl   0x8(%ebp)
 80488a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488a4:	c7 40 0c 06 00 00 00 	movl   $0x6,0xc(%eax)
 80488ab:	eb 28                	jmp    80488d5 <parse_conversion+0x2af>
 80488ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488b0:	c7 40 0c 05 00 00 00 	movl   $0x5,0xc(%eax)
 80488b7:	eb 1c                	jmp    80488d5 <parse_conversion+0x2af>
 80488b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488bc:	c7 40 0c 07 00 00 00 	movl   $0x7,0xc(%eax)
 80488c3:	eb 10                	jmp    80488d5 <parse_conversion+0x2af>
 80488c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488c8:	c7 40 0c 08 00 00 00 	movl   $0x8,0xc(%eax)
 80488cf:	eb 04                	jmp    80488d5 <parse_conversion+0x2af>
 80488d1:	ff 4d 08             	decl   0x8(%ebp)
 80488d4:	90                   	nop
 80488d5:	8b 45 08             	mov    0x8(%ebp),%eax
 80488d8:	c9                   	leave  
 80488d9:	c3                   	ret    

080488da <format_integer>:
 80488da:	55                   	push   %ebp
 80488db:	89 e5                	mov    %esp,%ebp
 80488dd:	57                   	push   %edi
 80488de:	56                   	push   %esi
 80488df:	53                   	push   %ebx
 80488e0:	81 ec 8c 00 00 00    	sub    $0x8c,%esp
 80488e6:	8b 45 10             	mov    0x10(%ebp),%eax
 80488e9:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
 80488ef:	8b 5d 14             	mov    0x14(%ebp),%ebx
 80488f2:	8b 45 08             	mov    0x8(%ebp),%eax
 80488f5:	89 45 80             	mov    %eax,-0x80(%ebp)
 80488f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80488fb:	89 45 84             	mov    %eax,-0x7c(%ebp)
 80488fe:	8a 85 6c ff ff ff    	mov    -0x94(%ebp),%al
 8048904:	88 85 7c ff ff ff    	mov    %al,-0x84(%ebp)
 804890a:	88 9d 78 ff ff ff    	mov    %bl,-0x88(%ebp)
 8048910:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8048917:	80 bd 7c ff ff ff 00 	cmpb   $0x0,-0x84(%ebp)
 804891e:	74 5c                	je     804897c <format_integer+0xa2>
 8048920:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048923:	8b 00                	mov    (%eax),%eax
 8048925:	83 e0 02             	and    $0x2,%eax
 8048928:	85 c0                	test   %eax,%eax
 804892a:	74 1a                	je     8048946 <format_integer+0x6c>
 804892c:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8048933:	74 07                	je     804893c <format_integer+0x62>
 8048935:	b8 2d 00 00 00       	mov    $0x2d,%eax
 804893a:	eb 05                	jmp    8048941 <format_integer+0x67>
 804893c:	b8 2b 00 00 00       	mov    $0x2b,%eax
 8048941:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048944:	eb 36                	jmp    804897c <format_integer+0xa2>
 8048946:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048949:	8b 00                	mov    (%eax),%eax
 804894b:	83 e0 04             	and    $0x4,%eax
 804894e:	85 c0                	test   %eax,%eax
 8048950:	74 1a                	je     804896c <format_integer+0x92>
 8048952:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8048959:	74 07                	je     8048962 <format_integer+0x88>
 804895b:	b8 2d 00 00 00       	mov    $0x2d,%eax
 8048960:	eb 05                	jmp    8048967 <format_integer+0x8d>
 8048962:	b8 20 00 00 00       	mov    $0x20,%eax
 8048967:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804896a:	eb 10                	jmp    804897c <format_integer+0xa2>
 804896c:	80 bd 78 ff ff ff 00 	cmpb   $0x0,-0x88(%ebp)
 8048973:	74 07                	je     804897c <format_integer+0xa2>
 8048975:	c7 45 e0 2d 00 00 00 	movl   $0x2d,-0x20(%ebp)
 804897c:	8b 45 1c             	mov    0x1c(%ebp),%eax
 804897f:	8b 00                	mov    (%eax),%eax
 8048981:	83 e0 08             	and    $0x8,%eax
 8048984:	85 c0                	test   %eax,%eax
 8048986:	74 20                	je     80489a8 <format_integer+0xce>
 8048988:	8b 45 80             	mov    -0x80(%ebp),%eax
 804898b:	80 f4 00             	xor    $0x0,%ah
 804898e:	89 c2                	mov    %eax,%edx
 8048990:	8b 45 84             	mov    -0x7c(%ebp),%eax
 8048993:	80 f4 00             	xor    $0x0,%ah
 8048996:	89 c1                	mov    %eax,%ecx
 8048998:	89 c8                	mov    %ecx,%eax
 804899a:	09 d0                	or     %edx,%eax
 804899c:	85 c0                	test   %eax,%eax
 804899e:	74 08                	je     80489a8 <format_integer+0xce>
 80489a0:	8b 45 18             	mov    0x18(%ebp),%eax
 80489a3:	8b 40 08             	mov    0x8(%eax),%eax
 80489a6:	eb 05                	jmp    80489ad <format_integer+0xd3>
 80489a8:	b8 00 00 00 00       	mov    $0x0,%eax
 80489ad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80489b0:	8d 45 90             	lea    -0x70(%ebp),%eax
 80489b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80489b6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 80489bd:	e9 82 00 00 00       	jmp    8048a44 <format_integer+0x16a>
 80489c2:	8b 45 1c             	mov    0x1c(%ebp),%eax
 80489c5:	8b 00                	mov    (%eax),%eax
 80489c7:	83 e0 20             	and    $0x20,%eax
 80489ca:	85 c0                	test   %eax,%eax
 80489cc:	74 24                	je     80489f2 <format_integer+0x118>
 80489ce:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 80489d2:	7e 1e                	jle    80489f2 <format_integer+0x118>
 80489d4:	8b 45 18             	mov    0x18(%ebp),%eax
 80489d7:	8b 48 0c             	mov    0xc(%eax),%ecx
 80489da:	8b 45 d8             	mov    -0x28(%ebp),%eax
 80489dd:	99                   	cltd   
 80489de:	f7 f9                	idiv   %ecx
 80489e0:	89 d0                	mov    %edx,%eax
 80489e2:	85 c0                	test   %eax,%eax
 80489e4:	75 0c                	jne    80489f2 <format_integer+0x118>
 80489e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80489e9:	8d 50 01             	lea    0x1(%eax),%edx
 80489ec:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 80489ef:	c6 00 2c             	movb   $0x2c,(%eax)
 80489f2:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 80489f5:	8d 46 01             	lea    0x1(%esi),%eax
 80489f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 80489fb:	8b 45 18             	mov    0x18(%ebp),%eax
 80489fe:	8b 78 04             	mov    0x4(%eax),%edi
 8048a01:	8b 45 18             	mov    0x18(%ebp),%eax
 8048a04:	8b 00                	mov    (%eax),%eax
 8048a06:	89 c1                	mov    %eax,%ecx
 8048a08:	89 c3                	mov    %eax,%ebx
 8048a0a:	c1 fb 1f             	sar    $0x1f,%ebx
 8048a0d:	8b 45 80             	mov    -0x80(%ebp),%eax
 8048a10:	8b 55 84             	mov    -0x7c(%ebp),%edx
 8048a13:	53                   	push   %ebx
 8048a14:	51                   	push   %ecx
 8048a15:	52                   	push   %edx
 8048a16:	50                   	push   %eax
 8048a17:	e8 b0 11 00 00       	call   8049bcc <__umoddi3>
 8048a1c:	83 c4 10             	add    $0x10,%esp
 8048a1f:	01 f8                	add    %edi,%eax
 8048a21:	8a 00                	mov    (%eax),%al
 8048a23:	88 06                	mov    %al,(%esi)
 8048a25:	8b 45 18             	mov    0x18(%ebp),%eax
 8048a28:	8b 00                	mov    (%eax),%eax
 8048a2a:	99                   	cltd   
 8048a2b:	52                   	push   %edx
 8048a2c:	50                   	push   %eax
 8048a2d:	ff 75 84             	push   -0x7c(%ebp)
 8048a30:	ff 75 80             	push   -0x80(%ebp)
 8048a33:	e8 60 11 00 00       	call   8049b98 <__udivdi3>
 8048a38:	83 c4 10             	add    $0x10,%esp
 8048a3b:	89 45 80             	mov    %eax,-0x80(%ebp)
 8048a3e:	89 55 84             	mov    %edx,-0x7c(%ebp)
 8048a41:	ff 45 d8             	incl   -0x28(%ebp)
 8048a44:	8b 45 80             	mov    -0x80(%ebp),%eax
 8048a47:	80 f4 00             	xor    $0x0,%ah
 8048a4a:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
 8048a50:	8b 45 84             	mov    -0x7c(%ebp),%eax
 8048a53:	80 f4 00             	xor    $0x0,%ah
 8048a56:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
 8048a5c:	8b 9d 70 ff ff ff    	mov    -0x90(%ebp),%ebx
 8048a62:	8b b5 74 ff ff ff    	mov    -0x8c(%ebp),%esi
 8048a68:	89 f0                	mov    %esi,%eax
 8048a6a:	09 d8                	or     %ebx,%eax
 8048a6c:	85 c0                	test   %eax,%eax
 8048a6e:	0f 85 4e ff ff ff    	jne    80489c2 <format_integer+0xe8>
 8048a74:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048a77:	8b 40 08             	mov    0x8(%eax),%eax
 8048a7a:	85 c0                	test   %eax,%eax
 8048a7c:	78 08                	js     8048a86 <format_integer+0x1ac>
 8048a7e:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048a81:	8b 40 08             	mov    0x8(%eax),%eax
 8048a84:	eb 05                	jmp    8048a8b <format_integer+0x1b1>
 8048a86:	b8 01 00 00 00       	mov    $0x1,%eax
 8048a8b:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8048a8e:	eb 0c                	jmp    8048a9c <format_integer+0x1c2>
 8048a90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048a93:	8d 50 01             	lea    0x1(%eax),%edx
 8048a96:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048a99:	c6 00 30             	movb   $0x30,(%eax)
 8048a9c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048a9f:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048aa2:	29 c2                	sub    %eax,%edx
 8048aa4:	89 d0                	mov    %edx,%eax
 8048aa6:	3b 45 d0             	cmp    -0x30(%ebp),%eax
 8048aa9:	7d 0b                	jge    8048ab6 <format_integer+0x1dc>
 8048aab:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048aae:	83 c0 3f             	add    $0x3f,%eax
 8048ab1:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8048ab4:	77 da                	ja     8048a90 <format_integer+0x1b6>
 8048ab6:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048ab9:	8b 00                	mov    (%eax),%eax
 8048abb:	83 e0 08             	and    $0x8,%eax
 8048abe:	85 c0                	test   %eax,%eax
 8048ac0:	74 28                	je     8048aea <format_integer+0x210>
 8048ac2:	8b 45 18             	mov    0x18(%ebp),%eax
 8048ac5:	8b 00                	mov    (%eax),%eax
 8048ac7:	83 f8 08             	cmp    $0x8,%eax
 8048aca:	75 1e                	jne    8048aea <format_integer+0x210>
 8048acc:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048acf:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 8048ad2:	74 0a                	je     8048ade <format_integer+0x204>
 8048ad4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048ad7:	48                   	dec    %eax
 8048ad8:	8a 00                	mov    (%eax),%al
 8048ada:	3c 30                	cmp    $0x30,%al
 8048adc:	74 0c                	je     8048aea <format_integer+0x210>
 8048ade:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048ae1:	8d 50 01             	lea    0x1(%eax),%edx
 8048ae4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048ae7:	c6 00 30             	movb   $0x30,(%eax)
 8048aea:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048aed:	8b 40 04             	mov    0x4(%eax),%eax
 8048af0:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8048af3:	8d 55 90             	lea    -0x70(%ebp),%edx
 8048af6:	29 d1                	sub    %edx,%ecx
 8048af8:	89 ca                	mov    %ecx,%edx
 8048afa:	29 d0                	sub    %edx,%eax
 8048afc:	89 c2                	mov    %eax,%edx
 8048afe:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8048b02:	74 07                	je     8048b0b <format_integer+0x231>
 8048b04:	b8 02 00 00 00       	mov    $0x2,%eax
 8048b09:	eb 05                	jmp    8048b10 <format_integer+0x236>
 8048b0b:	b8 00 00 00 00       	mov    $0x0,%eax
 8048b10:	29 c2                	sub    %eax,%edx
 8048b12:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8048b16:	0f 95 c0             	setne  %al
 8048b19:	0f b6 c0             	movzbl %al,%eax
 8048b1c:	29 c2                	sub    %eax,%edx
 8048b1e:	89 d0                	mov    %edx,%eax
 8048b20:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8048b23:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8048b27:	79 07                	jns    8048b30 <format_integer+0x256>
 8048b29:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8048b30:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048b33:	8b 00                	mov    (%eax),%eax
 8048b35:	83 e0 11             	and    $0x11,%eax
 8048b38:	85 c0                	test   %eax,%eax
 8048b3a:	75 14                	jne    8048b50 <format_integer+0x276>
 8048b3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048b3f:	ff 75 24             	push   0x24(%ebp)
 8048b42:	ff 75 20             	push   0x20(%ebp)
 8048b45:	50                   	push   %eax
 8048b46:	6a 20                	push   $0x20
 8048b48:	e8 b6 00 00 00       	call   8048c03 <output_dup>
 8048b4d:	83 c4 10             	add    $0x10,%esp
 8048b50:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 8048b54:	74 15                	je     8048b6b <format_integer+0x291>
 8048b56:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048b59:	0f be c0             	movsbl %al,%eax
 8048b5c:	83 ec 08             	sub    $0x8,%esp
 8048b5f:	ff 75 24             	push   0x24(%ebp)
 8048b62:	50                   	push   %eax
 8048b63:	8b 45 20             	mov    0x20(%ebp),%eax
 8048b66:	ff d0                	call   *%eax
 8048b68:	83 c4 10             	add    $0x10,%esp
 8048b6b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8048b6f:	74 25                	je     8048b96 <format_integer+0x2bc>
 8048b71:	83 ec 08             	sub    $0x8,%esp
 8048b74:	ff 75 24             	push   0x24(%ebp)
 8048b77:	6a 30                	push   $0x30
 8048b79:	8b 45 20             	mov    0x20(%ebp),%eax
 8048b7c:	ff d0                	call   *%eax
 8048b7e:	83 c4 10             	add    $0x10,%esp
 8048b81:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8048b84:	0f be c0             	movsbl %al,%eax
 8048b87:	83 ec 08             	sub    $0x8,%esp
 8048b8a:	ff 75 24             	push   0x24(%ebp)
 8048b8d:	50                   	push   %eax
 8048b8e:	8b 45 20             	mov    0x20(%ebp),%eax
 8048b91:	ff d0                	call   *%eax
 8048b93:	83 c4 10             	add    $0x10,%esp
 8048b96:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048b99:	8b 00                	mov    (%eax),%eax
 8048b9b:	83 e0 10             	and    $0x10,%eax
 8048b9e:	85 c0                	test   %eax,%eax
 8048ba0:	74 30                	je     8048bd2 <format_integer+0x2f8>
 8048ba2:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048ba5:	ff 75 24             	push   0x24(%ebp)
 8048ba8:	ff 75 20             	push   0x20(%ebp)
 8048bab:	50                   	push   %eax
 8048bac:	6a 30                	push   $0x30
 8048bae:	e8 50 00 00 00       	call   8048c03 <output_dup>
 8048bb3:	83 c4 10             	add    $0x10,%esp
 8048bb6:	eb 1a                	jmp    8048bd2 <format_integer+0x2f8>
 8048bb8:	ff 4d e4             	decl   -0x1c(%ebp)
 8048bbb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8048bbe:	8a 00                	mov    (%eax),%al
 8048bc0:	0f be c0             	movsbl %al,%eax
 8048bc3:	83 ec 08             	sub    $0x8,%esp
 8048bc6:	ff 75 24             	push   0x24(%ebp)
 8048bc9:	50                   	push   %eax
 8048bca:	8b 45 20             	mov    0x20(%ebp),%eax
 8048bcd:	ff d0                	call   *%eax
 8048bcf:	83 c4 10             	add    $0x10,%esp
 8048bd2:	8d 45 90             	lea    -0x70(%ebp),%eax
 8048bd5:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 8048bd8:	77 de                	ja     8048bb8 <format_integer+0x2de>
 8048bda:	8b 45 1c             	mov    0x1c(%ebp),%eax
 8048bdd:	8b 00                	mov    (%eax),%eax
 8048bdf:	83 e0 01             	and    $0x1,%eax
 8048be2:	85 c0                	test   %eax,%eax
 8048be4:	74 14                	je     8048bfa <format_integer+0x320>
 8048be6:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048be9:	ff 75 24             	push   0x24(%ebp)
 8048bec:	ff 75 20             	push   0x20(%ebp)
 8048bef:	50                   	push   %eax
 8048bf0:	6a 20                	push   $0x20
 8048bf2:	e8 0c 00 00 00       	call   8048c03 <output_dup>
 8048bf7:	83 c4 10             	add    $0x10,%esp
 8048bfa:	90                   	nop
 8048bfb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8048bfe:	5b                   	pop    %ebx
 8048bff:	5e                   	pop    %esi
 8048c00:	5f                   	pop    %edi
 8048c01:	5d                   	pop    %ebp
 8048c02:	c3                   	ret    

08048c03 <output_dup>:
 8048c03:	55                   	push   %ebp
 8048c04:	89 e5                	mov    %esp,%ebp
 8048c06:	83 ec 18             	sub    $0x18,%esp
 8048c09:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c0c:	88 45 f4             	mov    %al,-0xc(%ebp)
 8048c0f:	eb 13                	jmp    8048c24 <output_dup+0x21>
 8048c11:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
 8048c15:	83 ec 08             	sub    $0x8,%esp
 8048c18:	ff 75 14             	push   0x14(%ebp)
 8048c1b:	50                   	push   %eax
 8048c1c:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c1f:	ff d0                	call   *%eax
 8048c21:	83 c4 10             	add    $0x10,%esp
 8048c24:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c27:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048c2a:	89 55 0c             	mov    %edx,0xc(%ebp)
 8048c2d:	85 c0                	test   %eax,%eax
 8048c2f:	75 e0                	jne    8048c11 <output_dup+0xe>
 8048c31:	90                   	nop
 8048c32:	c9                   	leave  
 8048c33:	c3                   	ret    

08048c34 <format_string>:
 8048c34:	55                   	push   %ebp
 8048c35:	89 e5                	mov    %esp,%ebp
 8048c37:	83 ec 18             	sub    $0x18,%esp
 8048c3a:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c3d:	8b 40 04             	mov    0x4(%eax),%eax
 8048c40:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048c43:	7e 26                	jle    8048c6b <format_string+0x37>
 8048c45:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c48:	8b 00                	mov    (%eax),%eax
 8048c4a:	83 e0 01             	and    $0x1,%eax
 8048c4d:	85 c0                	test   %eax,%eax
 8048c4f:	75 1a                	jne    8048c6b <format_string+0x37>
 8048c51:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c54:	8b 40 04             	mov    0x4(%eax),%eax
 8048c57:	2b 45 0c             	sub    0xc(%ebp),%eax
 8048c5a:	ff 75 18             	push   0x18(%ebp)
 8048c5d:	ff 75 14             	push   0x14(%ebp)
 8048c60:	50                   	push   %eax
 8048c61:	6a 20                	push   $0x20
 8048c63:	e8 9b ff ff ff       	call   8048c03 <output_dup>
 8048c68:	83 c4 10             	add    $0x10,%esp
 8048c6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048c72:	eb 1f                	jmp    8048c93 <format_string+0x5f>
 8048c74:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048c77:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c7a:	01 d0                	add    %edx,%eax
 8048c7c:	8a 00                	mov    (%eax),%al
 8048c7e:	0f be c0             	movsbl %al,%eax
 8048c81:	83 ec 08             	sub    $0x8,%esp
 8048c84:	ff 75 18             	push   0x18(%ebp)
 8048c87:	50                   	push   %eax
 8048c88:	8b 45 14             	mov    0x14(%ebp),%eax
 8048c8b:	ff d0                	call   *%eax
 8048c8d:	83 c4 10             	add    $0x10,%esp
 8048c90:	ff 45 f4             	incl   -0xc(%ebp)
 8048c93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048c96:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048c99:	7c d9                	jl     8048c74 <format_string+0x40>
 8048c9b:	8b 45 10             	mov    0x10(%ebp),%eax
 8048c9e:	8b 40 04             	mov    0x4(%eax),%eax
 8048ca1:	3b 45 0c             	cmp    0xc(%ebp),%eax
 8048ca4:	7e 26                	jle    8048ccc <format_string+0x98>
 8048ca6:	8b 45 10             	mov    0x10(%ebp),%eax
 8048ca9:	8b 00                	mov    (%eax),%eax
 8048cab:	83 e0 01             	and    $0x1,%eax
 8048cae:	85 c0                	test   %eax,%eax
 8048cb0:	74 1a                	je     8048ccc <format_string+0x98>
 8048cb2:	8b 45 10             	mov    0x10(%ebp),%eax
 8048cb5:	8b 40 04             	mov    0x4(%eax),%eax
 8048cb8:	2b 45 0c             	sub    0xc(%ebp),%eax
 8048cbb:	ff 75 18             	push   0x18(%ebp)
 8048cbe:	ff 75 14             	push   0x14(%ebp)
 8048cc1:	50                   	push   %eax
 8048cc2:	6a 20                	push   $0x20
 8048cc4:	e8 3a ff ff ff       	call   8048c03 <output_dup>
 8048cc9:	83 c4 10             	add    $0x10,%esp
 8048ccc:	90                   	nop
 8048ccd:	c9                   	leave  
 8048cce:	c3                   	ret    

08048ccf <__printf>:
 8048ccf:	55                   	push   %ebp
 8048cd0:	89 e5                	mov    %esp,%ebp
 8048cd2:	83 ec 18             	sub    $0x18,%esp
 8048cd5:	8d 45 14             	lea    0x14(%ebp),%eax
 8048cd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048cdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048cde:	ff 75 10             	push   0x10(%ebp)
 8048ce1:	ff 75 0c             	push   0xc(%ebp)
 8048ce4:	50                   	push   %eax
 8048ce5:	ff 75 08             	push   0x8(%ebp)
 8048ce8:	e8 f5 f4 ff ff       	call   80481e2 <__vprintf>
 8048ced:	83 c4 10             	add    $0x10,%esp
 8048cf0:	90                   	nop
 8048cf1:	c9                   	leave  
 8048cf2:	c3                   	ret    

08048cf3 <hex_dump>:
 8048cf3:	55                   	push   %ebp
 8048cf4:	89 e5                	mov    %esp,%ebp
 8048cf6:	83 ec 38             	sub    $0x38,%esp
 8048cf9:	8b 45 14             	mov    0x14(%ebp),%eax
 8048cfc:	88 45 d4             	mov    %al,-0x2c(%ebp)
 8048cff:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048d02:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048d05:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%ebp)
 8048d0c:	e9 b4 01 00 00       	jmp    8048ec5 <hex_dump+0x1d2>
 8048d11:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d14:	ba 00 00 00 00       	mov    $0x0,%edx
 8048d19:	f7 75 e8             	divl   -0x18(%ebp)
 8048d1c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048d1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d22:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048d25:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d28:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048d2b:	3b 45 10             	cmp    0x10(%ebp),%eax
 8048d2e:	76 0b                	jbe    8048d3b <hex_dump+0x48>
 8048d30:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048d33:	8b 45 10             	mov    0x10(%ebp),%eax
 8048d36:	01 d0                	add    %edx,%eax
 8048d38:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048d3e:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048d41:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048d44:	8b 45 08             	mov    0x8(%ebp),%eax
 8048d47:	ba 00 00 00 00       	mov    $0x0,%edx
 8048d4c:	f7 75 e8             	divl   -0x18(%ebp)
 8048d4f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
 8048d53:	ba 00 00 00 00       	mov    $0x0,%edx
 8048d58:	83 ec 04             	sub    $0x4,%esp
 8048d5b:	52                   	push   %edx
 8048d5c:	50                   	push   %eax
 8048d5d:	68 40 a3 04 08       	push   $0x804a340
 8048d62:	e8 55 f4 ff ff       	call   80481bc <printf>
 8048d67:	83 c4 10             	add    $0x10,%esp
 8048d6a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048d71:	eb 13                	jmp    8048d86 <hex_dump+0x93>
 8048d73:	83 ec 0c             	sub    $0xc,%esp
 8048d76:	68 48 a3 04 08       	push   $0x804a348
 8048d7b:	e8 3c f4 ff ff       	call   80481bc <printf>
 8048d80:	83 c4 10             	add    $0x10,%esp
 8048d83:	ff 45 ec             	incl   -0x14(%ebp)
 8048d86:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048d89:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8048d8c:	72 e5                	jb     8048d73 <hex_dump+0x80>
 8048d8e:	eb 3e                	jmp    8048dce <hex_dump+0xdb>
 8048d90:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048d93:	d1 e8                	shr    %eax
 8048d95:	48                   	dec    %eax
 8048d96:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8048d99:	75 07                	jne    8048da2 <hex_dump+0xaf>
 8048d9b:	ba 2d 00 00 00       	mov    $0x2d,%edx
 8048da0:	eb 05                	jmp    8048da7 <hex_dump+0xb4>
 8048da2:	ba 20 00 00 00       	mov    $0x20,%edx
 8048da7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048daa:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048dad:	89 c1                	mov    %eax,%ecx
 8048daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048db2:	01 c8                	add    %ecx,%eax
 8048db4:	8a 00                	mov    (%eax),%al
 8048db6:	0f b6 c0             	movzbl %al,%eax
 8048db9:	83 ec 04             	sub    $0x4,%esp
 8048dbc:	52                   	push   %edx
 8048dbd:	50                   	push   %eax
 8048dbe:	68 4c a3 04 08       	push   $0x804a34c
 8048dc3:	e8 f4 f3 ff ff       	call   80481bc <printf>
 8048dc8:	83 c4 10             	add    $0x10,%esp
 8048dcb:	ff 45 ec             	incl   -0x14(%ebp)
 8048dce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048dd1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8048dd4:	72 ba                	jb     8048d90 <hex_dump+0x9d>
 8048dd6:	80 7d d4 00          	cmpb   $0x0,-0x2c(%ebp)
 8048dda:	0f 84 c6 00 00 00    	je     8048ea6 <hex_dump+0x1b3>
 8048de0:	eb 13                	jmp    8048df5 <hex_dump+0x102>
 8048de2:	83 ec 0c             	sub    $0xc,%esp
 8048de5:	68 48 a3 04 08       	push   $0x804a348
 8048dea:	e8 cd f3 ff ff       	call   80481bc <printf>
 8048def:	83 c4 10             	add    $0x10,%esp
 8048df2:	ff 45 ec             	incl   -0x14(%ebp)
 8048df5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048df8:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 8048dfb:	72 e5                	jb     8048de2 <hex_dump+0xef>
 8048dfd:	83 ec 0c             	sub    $0xc,%esp
 8048e00:	6a 7c                	push   $0x7c
 8048e02:	e8 08 11 00 00       	call   8049f0f <putchar>
 8048e07:	83 c4 10             	add    $0x10,%esp
 8048e0a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048e11:	eb 10                	jmp    8048e23 <hex_dump+0x130>
 8048e13:	83 ec 0c             	sub    $0xc,%esp
 8048e16:	6a 20                	push   $0x20
 8048e18:	e8 f2 10 00 00       	call   8049f0f <putchar>
 8048e1d:	83 c4 10             	add    $0x10,%esp
 8048e20:	ff 45 ec             	incl   -0x14(%ebp)
 8048e23:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e26:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 8048e29:	72 e8                	jb     8048e13 <hex_dump+0x120>
 8048e2b:	eb 4a                	jmp    8048e77 <hex_dump+0x184>
 8048e2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e30:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048e33:	89 c2                	mov    %eax,%edx
 8048e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e38:	01 d0                	add    %edx,%eax
 8048e3a:	8a 00                	mov    (%eax),%al
 8048e3c:	0f b6 c0             	movzbl %al,%eax
 8048e3f:	83 ec 0c             	sub    $0xc,%esp
 8048e42:	50                   	push   %eax
 8048e43:	e8 9f f2 ff ff       	call   80480e7 <isprint>
 8048e48:	83 c4 10             	add    $0x10,%esp
 8048e4b:	85 c0                	test   %eax,%eax
 8048e4d:	74 14                	je     8048e63 <hex_dump+0x170>
 8048e4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e52:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 8048e55:	89 c2                	mov    %eax,%edx
 8048e57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e5a:	01 d0                	add    %edx,%eax
 8048e5c:	8a 00                	mov    (%eax),%al
 8048e5e:	0f b6 c0             	movzbl %al,%eax
 8048e61:	eb 05                	jmp    8048e68 <hex_dump+0x175>
 8048e63:	b8 2e 00 00 00       	mov    $0x2e,%eax
 8048e68:	83 ec 0c             	sub    $0xc,%esp
 8048e6b:	50                   	push   %eax
 8048e6c:	e8 9e 10 00 00       	call   8049f0f <putchar>
 8048e71:	83 c4 10             	add    $0x10,%esp
 8048e74:	ff 45 ec             	incl   -0x14(%ebp)
 8048e77:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e7a:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8048e7d:	72 ae                	jb     8048e2d <hex_dump+0x13a>
 8048e7f:	eb 10                	jmp    8048e91 <hex_dump+0x19e>
 8048e81:	83 ec 0c             	sub    $0xc,%esp
 8048e84:	6a 20                	push   $0x20
 8048e86:	e8 84 10 00 00       	call   8049f0f <putchar>
 8048e8b:	83 c4 10             	add    $0x10,%esp
 8048e8e:	ff 45 ec             	incl   -0x14(%ebp)
 8048e91:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e94:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 8048e97:	72 e8                	jb     8048e81 <hex_dump+0x18e>
 8048e99:	83 ec 0c             	sub    $0xc,%esp
 8048e9c:	6a 7c                	push   $0x7c
 8048e9e:	e8 6c 10 00 00       	call   8049f0f <putchar>
 8048ea3:	83 c4 10             	add    $0x10,%esp
 8048ea6:	83 ec 0c             	sub    $0xc,%esp
 8048ea9:	6a 0a                	push   $0xa
 8048eab:	e8 5f 10 00 00       	call   8049f0f <putchar>
 8048eb0:	83 c4 10             	add    $0x10,%esp
 8048eb3:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048eb6:	01 45 08             	add    %eax,0x8(%ebp)
 8048eb9:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048ebc:	01 45 f4             	add    %eax,-0xc(%ebp)
 8048ebf:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048ec2:	29 45 10             	sub    %eax,0x10(%ebp)
 8048ec5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048ec9:	0f 85 42 fe ff ff    	jne    8048d11 <hex_dump+0x1e>
 8048ecf:	90                   	nop
 8048ed0:	c9                   	leave  
 8048ed1:	c3                   	ret    

08048ed2 <print_human_readable_size>:
 8048ed2:	55                   	push   %ebp
 8048ed3:	89 e5                	mov    %esp,%ebp
 8048ed5:	83 ec 28             	sub    $0x28,%esp
 8048ed8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8048edb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 8048ede:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8048ee1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 8048ee4:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 8048ee7:	83 f1 01             	xor    $0x1,%ecx
 8048eea:	89 c8                	mov    %ecx,%eax
 8048eec:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 8048eef:	80 f5 00             	xor    $0x0,%ch
 8048ef2:	89 ca                	mov    %ecx,%edx
 8048ef4:	09 d0                	or     %edx,%eax
 8048ef6:	85 c0                	test   %eax,%eax
 8048ef8:	75 12                	jne    8048f0c <print_human_readable_size+0x3a>
 8048efa:	83 ec 0c             	sub    $0xc,%esp
 8048efd:	68 55 a3 04 08       	push   $0x804a355
 8048f02:	e8 b5 f2 ff ff       	call   80481bc <printf>
 8048f07:	83 c4 10             	add    $0x10,%esp
 8048f0a:	eb 5a                	jmp    8048f66 <print_human_readable_size+0x94>
 8048f0c:	c7 45 f4 0c b6 04 08 	movl   $0x804b60c,-0xc(%ebp)
 8048f13:	eb 17                	jmp    8048f2c <print_human_readable_size+0x5a>
 8048f15:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048f18:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 8048f1b:	0f ac d0 0a          	shrd   $0xa,%edx,%eax
 8048f1f:	c1 ea 0a             	shr    $0xa,%edx
 8048f22:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048f25:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8048f28:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8048f2c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8048f30:	72 1b                	jb     8048f4d <print_human_readable_size+0x7b>
 8048f32:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 8048f36:	77 09                	ja     8048f41 <print_human_readable_size+0x6f>
 8048f38:	81 7d e0 ff 03 00 00 	cmpl   $0x3ff,-0x20(%ebp)
 8048f3f:	76 0c                	jbe    8048f4d <print_human_readable_size+0x7b>
 8048f41:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f44:	83 c0 04             	add    $0x4,%eax
 8048f47:	8b 00                	mov    (%eax),%eax
 8048f49:	85 c0                	test   %eax,%eax
 8048f4b:	75 c8                	jne    8048f15 <print_human_readable_size+0x43>
 8048f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048f50:	8b 00                	mov    (%eax),%eax
 8048f52:	50                   	push   %eax
 8048f53:	ff 75 e4             	push   -0x1c(%ebp)
 8048f56:	ff 75 e0             	push   -0x20(%ebp)
 8048f59:	68 5c a3 04 08       	push   $0x804a35c
 8048f5e:	e8 59 f2 ff ff       	call   80481bc <printf>
 8048f63:	83 c4 10             	add    $0x10,%esp
 8048f66:	90                   	nop
 8048f67:	c9                   	leave  
 8048f68:	c3                   	ret    

08048f69 <memcpy>:
 8048f69:	55                   	push   %ebp
 8048f6a:	89 e5                	mov    %esp,%ebp
 8048f6c:	83 ec 18             	sub    $0x18,%esp
 8048f6f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f72:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048f75:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048f78:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048f7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8048f7f:	75 24                	jne    8048fa5 <memcpy+0x3c>
 8048f81:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048f85:	74 1e                	je     8048fa5 <memcpy+0x3c>
 8048f87:	83 ec 0c             	sub    $0xc,%esp
 8048f8a:	68 80 a3 04 08       	push   $0x804a380
 8048f8f:	68 99 a3 04 08       	push   $0x804a399
 8048f94:	68 8c a4 04 08       	push   $0x804a48c
 8048f99:	6a 0c                	push   $0xc
 8048f9b:	68 b0 a3 04 08       	push   $0x804a3b0
 8048fa0:	e8 60 0c 00 00       	call   8049c05 <debug_panic>
 8048fa5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8048fa9:	75 3a                	jne    8048fe5 <memcpy+0x7c>
 8048fab:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8048faf:	74 34                	je     8048fe5 <memcpy+0x7c>
 8048fb1:	83 ec 0c             	sub    $0xc,%esp
 8048fb4:	68 c0 a3 04 08       	push   $0x804a3c0
 8048fb9:	68 99 a3 04 08       	push   $0x804a399
 8048fbe:	68 8c a4 04 08       	push   $0x804a48c
 8048fc3:	6a 0d                	push   $0xd
 8048fc5:	68 b0 a3 04 08       	push   $0x804a3b0
 8048fca:	e8 36 0c 00 00       	call   8049c05 <debug_panic>
 8048fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048fd2:	8d 50 01             	lea    0x1(%eax),%edx
 8048fd5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048fd8:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048fdb:	8d 4a 01             	lea    0x1(%edx),%ecx
 8048fde:	89 4d f0             	mov    %ecx,-0x10(%ebp)
 8048fe1:	8a 12                	mov    (%edx),%dl
 8048fe3:	88 10                	mov    %dl,(%eax)
 8048fe5:	8b 45 10             	mov    0x10(%ebp),%eax
 8048fe8:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048feb:	89 55 10             	mov    %edx,0x10(%ebp)
 8048fee:	85 c0                	test   %eax,%eax
 8048ff0:	75 dd                	jne    8048fcf <memcpy+0x66>
 8048ff2:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ff5:	c9                   	leave  
 8048ff6:	c3                   	ret    

08048ff7 <memmove>:
 8048ff7:	55                   	push   %ebp
 8048ff8:	89 e5                	mov    %esp,%ebp
 8048ffa:	83 ec 18             	sub    $0x18,%esp
 8048ffd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049000:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049003:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049006:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049009:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804900d:	75 24                	jne    8049033 <memmove+0x3c>
 804900f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049013:	74 1e                	je     8049033 <memmove+0x3c>
 8049015:	83 ec 0c             	sub    $0xc,%esp
 8049018:	68 80 a3 04 08       	push   $0x804a380
 804901d:	68 99 a3 04 08       	push   $0x804a399
 8049022:	68 94 a4 04 08       	push   $0x804a494
 8049027:	6a 1d                	push   $0x1d
 8049029:	68 b0 a3 04 08       	push   $0x804a3b0
 804902e:	e8 d2 0b 00 00       	call   8049c05 <debug_panic>
 8049033:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049037:	75 24                	jne    804905d <memmove+0x66>
 8049039:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804903d:	74 1e                	je     804905d <memmove+0x66>
 804903f:	83 ec 0c             	sub    $0xc,%esp
 8049042:	68 c0 a3 04 08       	push   $0x804a3c0
 8049047:	68 99 a3 04 08       	push   $0x804a399
 804904c:	68 94 a4 04 08       	push   $0x804a494
 8049051:	6a 1e                	push   $0x1e
 8049053:	68 b0 a3 04 08       	push   $0x804a3b0
 8049058:	e8 a8 0b 00 00       	call   8049c05 <debug_panic>
 804905d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049060:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049063:	73 27                	jae    804908c <memmove+0x95>
 8049065:	eb 16                	jmp    804907d <memmove+0x86>
 8049067:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804906a:	8d 50 01             	lea    0x1(%eax),%edx
 804906d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8049070:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8049073:	8d 4a 01             	lea    0x1(%edx),%ecx
 8049076:	89 4d f0             	mov    %ecx,-0x10(%ebp)
 8049079:	8a 12                	mov    (%edx),%dl
 804907b:	88 10                	mov    %dl,(%eax)
 804907d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049080:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049083:	89 55 10             	mov    %edx,0x10(%ebp)
 8049086:	85 c0                	test   %eax,%eax
 8049088:	75 dd                	jne    8049067 <memmove+0x70>
 804908a:	eb 2b                	jmp    80490b7 <memmove+0xc0>
 804908c:	8b 45 10             	mov    0x10(%ebp),%eax
 804908f:	01 45 f4             	add    %eax,-0xc(%ebp)
 8049092:	8b 45 10             	mov    0x10(%ebp),%eax
 8049095:	01 45 f0             	add    %eax,-0x10(%ebp)
 8049098:	eb 10                	jmp    80490aa <memmove+0xb3>
 804909a:	ff 4d f4             	decl   -0xc(%ebp)
 804909d:	ff 4d f0             	decl   -0x10(%ebp)
 80490a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80490a3:	8a 10                	mov    (%eax),%dl
 80490a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490a8:	88 10                	mov    %dl,(%eax)
 80490aa:	8b 45 10             	mov    0x10(%ebp),%eax
 80490ad:	8d 50 ff             	lea    -0x1(%eax),%edx
 80490b0:	89 55 10             	mov    %edx,0x10(%ebp)
 80490b3:	85 c0                	test   %eax,%eax
 80490b5:	75 e3                	jne    804909a <memmove+0xa3>
 80490b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490ba:	c9                   	leave  
 80490bb:	c3                   	ret    

080490bc <memcmp>:
 80490bc:	55                   	push   %ebp
 80490bd:	89 e5                	mov    %esp,%ebp
 80490bf:	83 ec 18             	sub    $0x18,%esp
 80490c2:	8b 45 08             	mov    0x8(%ebp),%eax
 80490c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80490c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80490cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80490ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80490d2:	75 24                	jne    80490f8 <memcmp+0x3c>
 80490d4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80490d8:	74 1e                	je     80490f8 <memcmp+0x3c>
 80490da:	83 ec 0c             	sub    $0xc,%esp
 80490dd:	68 d9 a3 04 08       	push   $0x804a3d9
 80490e2:	68 99 a3 04 08       	push   $0x804a399
 80490e7:	68 9c a4 04 08       	push   $0x804a49c
 80490ec:	6a 3a                	push   $0x3a
 80490ee:	68 b0 a3 04 08       	push   $0x804a3b0
 80490f3:	e8 0d 0b 00 00       	call   8049c05 <debug_panic>
 80490f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80490fc:	75 54                	jne    8049152 <memcmp+0x96>
 80490fe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049102:	74 4e                	je     8049152 <memcmp+0x96>
 8049104:	83 ec 0c             	sub    $0xc,%esp
 8049107:	68 f0 a3 04 08       	push   $0x804a3f0
 804910c:	68 99 a3 04 08       	push   $0x804a399
 8049111:	68 9c a4 04 08       	push   $0x804a49c
 8049116:	6a 3b                	push   $0x3b
 8049118:	68 b0 a3 04 08       	push   $0x804a3b0
 804911d:	e8 e3 0a 00 00       	call   8049c05 <debug_panic>
 8049122:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049125:	8a 10                	mov    (%eax),%dl
 8049127:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804912a:	8a 00                	mov    (%eax),%al
 804912c:	38 c2                	cmp    %al,%dl
 804912e:	74 1c                	je     804914c <memcmp+0x90>
 8049130:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049133:	8a 10                	mov    (%eax),%dl
 8049135:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049138:	8a 00                	mov    (%eax),%al
 804913a:	38 c2                	cmp    %al,%dl
 804913c:	76 07                	jbe    8049145 <memcmp+0x89>
 804913e:	b8 01 00 00 00       	mov    $0x1,%eax
 8049143:	eb 1f                	jmp    8049164 <memcmp+0xa8>
 8049145:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804914a:	eb 18                	jmp    8049164 <memcmp+0xa8>
 804914c:	ff 45 f4             	incl   -0xc(%ebp)
 804914f:	ff 45 f0             	incl   -0x10(%ebp)
 8049152:	8b 45 10             	mov    0x10(%ebp),%eax
 8049155:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049158:	89 55 10             	mov    %edx,0x10(%ebp)
 804915b:	85 c0                	test   %eax,%eax
 804915d:	75 c3                	jne    8049122 <memcmp+0x66>
 804915f:	b8 00 00 00 00       	mov    $0x0,%eax
 8049164:	c9                   	leave  
 8049165:	c3                   	ret    

08049166 <strcmp>:
 8049166:	55                   	push   %ebp
 8049167:	89 e5                	mov    %esp,%ebp
 8049169:	83 ec 18             	sub    $0x18,%esp
 804916c:	8b 45 08             	mov    0x8(%ebp),%eax
 804916f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049172:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049175:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049178:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804917c:	75 1e                	jne    804919c <strcmp+0x36>
 804917e:	83 ec 0c             	sub    $0xc,%esp
 8049181:	68 07 a4 04 08       	push   $0x804a407
 8049186:	68 99 a3 04 08       	push   $0x804a399
 804918b:	68 a4 a4 04 08       	push   $0x804a4a4
 8049190:	6a 4e                	push   $0x4e
 8049192:	68 b0 a3 04 08       	push   $0x804a3b0
 8049197:	e8 69 0a 00 00       	call   8049c05 <debug_panic>
 804919c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80491a0:	75 24                	jne    80491c6 <strcmp+0x60>
 80491a2:	83 ec 0c             	sub    $0xc,%esp
 80491a5:	68 11 a4 04 08       	push   $0x804a411
 80491aa:	68 99 a3 04 08       	push   $0x804a399
 80491af:	68 a4 a4 04 08       	push   $0x804a4a4
 80491b4:	6a 4f                	push   $0x4f
 80491b6:	68 b0 a3 04 08       	push   $0x804a3b0
 80491bb:	e8 45 0a 00 00       	call   8049c05 <debug_panic>
 80491c0:	ff 45 f4             	incl   -0xc(%ebp)
 80491c3:	ff 45 f0             	incl   -0x10(%ebp)
 80491c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80491c9:	8a 00                	mov    (%eax),%al
 80491cb:	84 c0                	test   %al,%al
 80491cd:	74 0e                	je     80491dd <strcmp+0x77>
 80491cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80491d2:	8a 10                	mov    (%eax),%dl
 80491d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80491d7:	8a 00                	mov    (%eax),%al
 80491d9:	38 c2                	cmp    %al,%dl
 80491db:	74 e3                	je     80491c0 <strcmp+0x5a>
 80491dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80491e0:	8a 10                	mov    (%eax),%dl
 80491e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80491e5:	8a 00                	mov    (%eax),%al
 80491e7:	38 c2                	cmp    %al,%dl
 80491e9:	72 14                	jb     80491ff <strcmp+0x99>
 80491eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80491ee:	8a 10                	mov    (%eax),%dl
 80491f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80491f3:	8a 00                	mov    (%eax),%al
 80491f5:	38 c2                	cmp    %al,%dl
 80491f7:	0f 97 c0             	seta   %al
 80491fa:	0f b6 c0             	movzbl %al,%eax
 80491fd:	eb 05                	jmp    8049204 <strcmp+0x9e>
 80491ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049204:	c9                   	leave  
 8049205:	c3                   	ret    

08049206 <memchr>:
 8049206:	55                   	push   %ebp
 8049207:	89 e5                	mov    %esp,%ebp
 8049209:	83 ec 18             	sub    $0x18,%esp
 804920c:	8b 45 08             	mov    0x8(%ebp),%eax
 804920f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049212:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049215:	88 45 f3             	mov    %al,-0xd(%ebp)
 8049218:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804921c:	75 36                	jne    8049254 <memchr+0x4e>
 804921e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049222:	74 30                	je     8049254 <memchr+0x4e>
 8049224:	83 ec 0c             	sub    $0xc,%esp
 8049227:	68 1b a4 04 08       	push   $0x804a41b
 804922c:	68 99 a3 04 08       	push   $0x804a399
 8049231:	68 ac a4 04 08       	push   $0x804a4ac
 8049236:	6a 63                	push   $0x63
 8049238:	68 b0 a3 04 08       	push   $0x804a3b0
 804923d:	e8 c3 09 00 00       	call   8049c05 <debug_panic>
 8049242:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049245:	8a 00                	mov    (%eax),%al
 8049247:	3a 45 f3             	cmp    -0xd(%ebp),%al
 804924a:	75 05                	jne    8049251 <memchr+0x4b>
 804924c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804924f:	eb 15                	jmp    8049266 <memchr+0x60>
 8049251:	ff 45 f4             	incl   -0xc(%ebp)
 8049254:	8b 45 10             	mov    0x10(%ebp),%eax
 8049257:	8d 50 ff             	lea    -0x1(%eax),%edx
 804925a:	89 55 10             	mov    %edx,0x10(%ebp)
 804925d:	85 c0                	test   %eax,%eax
 804925f:	75 e1                	jne    8049242 <memchr+0x3c>
 8049261:	b8 00 00 00 00       	mov    $0x0,%eax
 8049266:	c9                   	leave  
 8049267:	c3                   	ret    

08049268 <strchr>:
 8049268:	55                   	push   %ebp
 8049269:	89 e5                	mov    %esp,%ebp
 804926b:	83 ec 18             	sub    $0x18,%esp
 804926e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049271:	88 45 f7             	mov    %al,-0x9(%ebp)
 8049274:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049278:	75 1e                	jne    8049298 <strchr+0x30>
 804927a:	83 ec 0c             	sub    $0xc,%esp
 804927d:	68 36 a4 04 08       	push   $0x804a436
 8049282:	68 99 a3 04 08       	push   $0x804a399
 8049287:	68 b4 a4 04 08       	push   $0x804a4b4
 804928c:	6a 75                	push   $0x75
 804928e:	68 b0 a3 04 08       	push   $0x804a3b0
 8049293:	e8 6d 09 00 00       	call   8049c05 <debug_panic>
 8049298:	8b 45 08             	mov    0x8(%ebp),%eax
 804929b:	8a 00                	mov    (%eax),%al
 804929d:	3a 45 f7             	cmp    -0x9(%ebp),%al
 80492a0:	75 05                	jne    80492a7 <strchr+0x3f>
 80492a2:	8b 45 08             	mov    0x8(%ebp),%eax
 80492a5:	eb 15                	jmp    80492bc <strchr+0x54>
 80492a7:	8b 45 08             	mov    0x8(%ebp),%eax
 80492aa:	8a 00                	mov    (%eax),%al
 80492ac:	84 c0                	test   %al,%al
 80492ae:	75 07                	jne    80492b7 <strchr+0x4f>
 80492b0:	b8 00 00 00 00       	mov    $0x0,%eax
 80492b5:	eb 05                	jmp    80492bc <strchr+0x54>
 80492b7:	ff 45 08             	incl   0x8(%ebp)
 80492ba:	eb dc                	jmp    8049298 <strchr+0x30>
 80492bc:	c9                   	leave  
 80492bd:	c3                   	ret    

080492be <strcspn>:
 80492be:	55                   	push   %ebp
 80492bf:	89 e5                	mov    %esp,%ebp
 80492c1:	83 ec 18             	sub    $0x18,%esp
 80492c4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80492cb:	eb 23                	jmp    80492f0 <strcspn+0x32>
 80492cd:	8b 55 08             	mov    0x8(%ebp),%edx
 80492d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80492d3:	01 d0                	add    %edx,%eax
 80492d5:	8a 00                	mov    (%eax),%al
 80492d7:	0f be c0             	movsbl %al,%eax
 80492da:	83 ec 08             	sub    $0x8,%esp
 80492dd:	50                   	push   %eax
 80492de:	ff 75 0c             	push   0xc(%ebp)
 80492e1:	e8 82 ff ff ff       	call   8049268 <strchr>
 80492e6:	83 c4 10             	add    $0x10,%esp
 80492e9:	85 c0                	test   %eax,%eax
 80492eb:	75 13                	jne    8049300 <strcspn+0x42>
 80492ed:	ff 45 f4             	incl   -0xc(%ebp)
 80492f0:	8b 55 08             	mov    0x8(%ebp),%edx
 80492f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80492f6:	01 d0                	add    %edx,%eax
 80492f8:	8a 00                	mov    (%eax),%al
 80492fa:	84 c0                	test   %al,%al
 80492fc:	75 cf                	jne    80492cd <strcspn+0xf>
 80492fe:	eb 01                	jmp    8049301 <strcspn+0x43>
 8049300:	90                   	nop
 8049301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049304:	c9                   	leave  
 8049305:	c3                   	ret    

08049306 <strpbrk>:
 8049306:	55                   	push   %ebp
 8049307:	89 e5                	mov    %esp,%ebp
 8049309:	83 ec 08             	sub    $0x8,%esp
 804930c:	eb 23                	jmp    8049331 <strpbrk+0x2b>
 804930e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049311:	8a 00                	mov    (%eax),%al
 8049313:	0f be c0             	movsbl %al,%eax
 8049316:	83 ec 08             	sub    $0x8,%esp
 8049319:	50                   	push   %eax
 804931a:	ff 75 0c             	push   0xc(%ebp)
 804931d:	e8 46 ff ff ff       	call   8049268 <strchr>
 8049322:	83 c4 10             	add    $0x10,%esp
 8049325:	85 c0                	test   %eax,%eax
 8049327:	74 05                	je     804932e <strpbrk+0x28>
 8049329:	8b 45 08             	mov    0x8(%ebp),%eax
 804932c:	eb 11                	jmp    804933f <strpbrk+0x39>
 804932e:	ff 45 08             	incl   0x8(%ebp)
 8049331:	8b 45 08             	mov    0x8(%ebp),%eax
 8049334:	8a 00                	mov    (%eax),%al
 8049336:	84 c0                	test   %al,%al
 8049338:	75 d4                	jne    804930e <strpbrk+0x8>
 804933a:	b8 00 00 00 00       	mov    $0x0,%eax
 804933f:	c9                   	leave  
 8049340:	c3                   	ret    

08049341 <strrchr>:
 8049341:	55                   	push   %ebp
 8049342:	89 e5                	mov    %esp,%ebp
 8049344:	83 ec 10             	sub    $0x10,%esp
 8049347:	8b 45 0c             	mov    0xc(%ebp),%eax
 804934a:	88 45 fb             	mov    %al,-0x5(%ebp)
 804934d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049354:	eb 13                	jmp    8049369 <strrchr+0x28>
 8049356:	8b 45 08             	mov    0x8(%ebp),%eax
 8049359:	8a 00                	mov    (%eax),%al
 804935b:	3a 45 fb             	cmp    -0x5(%ebp),%al
 804935e:	75 06                	jne    8049366 <strrchr+0x25>
 8049360:	8b 45 08             	mov    0x8(%ebp),%eax
 8049363:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049366:	ff 45 08             	incl   0x8(%ebp)
 8049369:	8b 45 08             	mov    0x8(%ebp),%eax
 804936c:	8a 00                	mov    (%eax),%al
 804936e:	84 c0                	test   %al,%al
 8049370:	75 e4                	jne    8049356 <strrchr+0x15>
 8049372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049375:	c9                   	leave  
 8049376:	c3                   	ret    

08049377 <strspn>:
 8049377:	55                   	push   %ebp
 8049378:	89 e5                	mov    %esp,%ebp
 804937a:	83 ec 18             	sub    $0x18,%esp
 804937d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049384:	eb 23                	jmp    80493a9 <strspn+0x32>
 8049386:	8b 55 08             	mov    0x8(%ebp),%edx
 8049389:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804938c:	01 d0                	add    %edx,%eax
 804938e:	8a 00                	mov    (%eax),%al
 8049390:	0f be c0             	movsbl %al,%eax
 8049393:	83 ec 08             	sub    $0x8,%esp
 8049396:	50                   	push   %eax
 8049397:	ff 75 0c             	push   0xc(%ebp)
 804939a:	e8 c9 fe ff ff       	call   8049268 <strchr>
 804939f:	83 c4 10             	add    $0x10,%esp
 80493a2:	85 c0                	test   %eax,%eax
 80493a4:	74 13                	je     80493b9 <strspn+0x42>
 80493a6:	ff 45 f4             	incl   -0xc(%ebp)
 80493a9:	8b 55 08             	mov    0x8(%ebp),%edx
 80493ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80493af:	01 d0                	add    %edx,%eax
 80493b1:	8a 00                	mov    (%eax),%al
 80493b3:	84 c0                	test   %al,%al
 80493b5:	75 cf                	jne    8049386 <strspn+0xf>
 80493b7:	eb 01                	jmp    80493ba <strspn+0x43>
 80493b9:	90                   	nop
 80493ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80493bd:	c9                   	leave  
 80493be:	c3                   	ret    

080493bf <strstr>:
 80493bf:	55                   	push   %ebp
 80493c0:	89 e5                	mov    %esp,%ebp
 80493c2:	83 ec 18             	sub    $0x18,%esp
 80493c5:	83 ec 0c             	sub    $0xc,%esp
 80493c8:	ff 75 08             	push   0x8(%ebp)
 80493cb:	e8 cc 01 00 00       	call   804959c <strlen>
 80493d0:	83 c4 10             	add    $0x10,%esp
 80493d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80493d6:	83 ec 0c             	sub    $0xc,%esp
 80493d9:	ff 75 0c             	push   0xc(%ebp)
 80493dc:	e8 bb 01 00 00       	call   804959c <strlen>
 80493e1:	83 c4 10             	add    $0x10,%esp
 80493e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80493e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80493ea:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 80493ed:	72 3f                	jb     804942e <strstr+0x6f>
 80493ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80493f6:	eb 2b                	jmp    8049423 <strstr+0x64>
 80493f8:	8b 55 08             	mov    0x8(%ebp),%edx
 80493fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80493fe:	01 d0                	add    %edx,%eax
 8049400:	83 ec 04             	sub    $0x4,%esp
 8049403:	ff 75 ec             	push   -0x14(%ebp)
 8049406:	ff 75 0c             	push   0xc(%ebp)
 8049409:	50                   	push   %eax
 804940a:	e8 ad fc ff ff       	call   80490bc <memcmp>
 804940f:	83 c4 10             	add    $0x10,%esp
 8049412:	85 c0                	test   %eax,%eax
 8049414:	75 0a                	jne    8049420 <strstr+0x61>
 8049416:	8b 55 08             	mov    0x8(%ebp),%edx
 8049419:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804941c:	01 d0                	add    %edx,%eax
 804941e:	eb 13                	jmp    8049433 <strstr+0x74>
 8049420:	ff 45 f4             	incl   -0xc(%ebp)
 8049423:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049426:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8049429:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804942c:	73 ca                	jae    80493f8 <strstr+0x39>
 804942e:	b8 00 00 00 00       	mov    $0x0,%eax
 8049433:	c9                   	leave  
 8049434:	c3                   	ret    

08049435 <strtok_r>:
 8049435:	55                   	push   %ebp
 8049436:	89 e5                	mov    %esp,%ebp
 8049438:	83 ec 18             	sub    $0x18,%esp
 804943b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 804943f:	75 21                	jne    8049462 <strtok_r+0x2d>
 8049441:	83 ec 0c             	sub    $0xc,%esp
 8049444:	68 45 a4 04 08       	push   $0x804a445
 8049449:	68 99 a3 04 08       	push   $0x804a399
 804944e:	68 bc a4 04 08       	push   $0x804a4bc
 8049453:	68 ee 00 00 00       	push   $0xee
 8049458:	68 b0 a3 04 08       	push   $0x804a3b0
 804945d:	e8 a3 07 00 00       	call   8049c05 <debug_panic>
 8049462:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049466:	75 21                	jne    8049489 <strtok_r+0x54>
 8049468:	83 ec 0c             	sub    $0xc,%esp
 804946b:	68 58 a4 04 08       	push   $0x804a458
 8049470:	68 99 a3 04 08       	push   $0x804a399
 8049475:	68 bc a4 04 08       	push   $0x804a4bc
 804947a:	68 ef 00 00 00       	push   $0xef
 804947f:	68 b0 a3 04 08       	push   $0x804a3b0
 8049484:	e8 7c 07 00 00       	call   8049c05 <debug_panic>
 8049489:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804948d:	75 08                	jne    8049497 <strtok_r+0x62>
 804948f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049492:	8b 00                	mov    (%eax),%eax
 8049494:	89 45 08             	mov    %eax,0x8(%ebp)
 8049497:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804949b:	75 3c                	jne    80494d9 <strtok_r+0xa4>
 804949d:	83 ec 0c             	sub    $0xc,%esp
 80494a0:	68 69 a4 04 08       	push   $0x804a469
 80494a5:	68 99 a3 04 08       	push   $0x804a399
 80494aa:	68 bc a4 04 08       	push   $0x804a4bc
 80494af:	68 f5 00 00 00       	push   $0xf5
 80494b4:	68 b0 a3 04 08       	push   $0x804a3b0
 80494b9:	e8 47 07 00 00       	call   8049c05 <debug_panic>
 80494be:	8b 45 08             	mov    0x8(%ebp),%eax
 80494c1:	8a 00                	mov    (%eax),%al
 80494c3:	84 c0                	test   %al,%al
 80494c5:	75 0f                	jne    80494d6 <strtok_r+0xa1>
 80494c7:	8b 45 10             	mov    0x10(%ebp),%eax
 80494ca:	8b 55 08             	mov    0x8(%ebp),%edx
 80494cd:	89 10                	mov    %edx,(%eax)
 80494cf:	b8 00 00 00 00       	mov    $0x0,%eax
 80494d4:	eb 6b                	jmp    8049541 <strtok_r+0x10c>
 80494d6:	ff 45 08             	incl   0x8(%ebp)
 80494d9:	8b 45 08             	mov    0x8(%ebp),%eax
 80494dc:	8a 00                	mov    (%eax),%al
 80494de:	0f be c0             	movsbl %al,%eax
 80494e1:	83 ec 08             	sub    $0x8,%esp
 80494e4:	50                   	push   %eax
 80494e5:	ff 75 0c             	push   0xc(%ebp)
 80494e8:	e8 7b fd ff ff       	call   8049268 <strchr>
 80494ed:	83 c4 10             	add    $0x10,%esp
 80494f0:	85 c0                	test   %eax,%eax
 80494f2:	75 ca                	jne    80494be <strtok_r+0x89>
 80494f4:	8b 45 08             	mov    0x8(%ebp),%eax
 80494f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80494fa:	eb 03                	jmp    80494ff <strtok_r+0xca>
 80494fc:	ff 45 08             	incl   0x8(%ebp)
 80494ff:	8b 45 08             	mov    0x8(%ebp),%eax
 8049502:	8a 00                	mov    (%eax),%al
 8049504:	0f be c0             	movsbl %al,%eax
 8049507:	83 ec 08             	sub    $0x8,%esp
 804950a:	50                   	push   %eax
 804950b:	ff 75 0c             	push   0xc(%ebp)
 804950e:	e8 55 fd ff ff       	call   8049268 <strchr>
 8049513:	83 c4 10             	add    $0x10,%esp
 8049516:	85 c0                	test   %eax,%eax
 8049518:	74 e2                	je     80494fc <strtok_r+0xc7>
 804951a:	8b 45 08             	mov    0x8(%ebp),%eax
 804951d:	8a 00                	mov    (%eax),%al
 804951f:	84 c0                	test   %al,%al
 8049521:	74 13                	je     8049536 <strtok_r+0x101>
 8049523:	8b 45 08             	mov    0x8(%ebp),%eax
 8049526:	c6 00 00             	movb   $0x0,(%eax)
 8049529:	8b 45 08             	mov    0x8(%ebp),%eax
 804952c:	8d 50 01             	lea    0x1(%eax),%edx
 804952f:	8b 45 10             	mov    0x10(%ebp),%eax
 8049532:	89 10                	mov    %edx,(%eax)
 8049534:	eb 08                	jmp    804953e <strtok_r+0x109>
 8049536:	8b 45 10             	mov    0x10(%ebp),%eax
 8049539:	8b 55 08             	mov    0x8(%ebp),%edx
 804953c:	89 10                	mov    %edx,(%eax)
 804953e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049541:	c9                   	leave  
 8049542:	c3                   	ret    

08049543 <memset>:
 8049543:	55                   	push   %ebp
 8049544:	89 e5                	mov    %esp,%ebp
 8049546:	83 ec 18             	sub    $0x18,%esp
 8049549:	8b 45 08             	mov    0x8(%ebp),%eax
 804954c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804954f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049553:	75 35                	jne    804958a <memset+0x47>
 8049555:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049559:	74 2f                	je     804958a <memset+0x47>
 804955b:	83 ec 0c             	sub    $0xc,%esp
 804955e:	68 80 a3 04 08       	push   $0x804a380
 8049563:	68 99 a3 04 08       	push   $0x804a399
 8049568:	68 c8 a4 04 08       	push   $0x804a4c8
 804956d:	68 1a 01 00 00       	push   $0x11a
 8049572:	68 b0 a3 04 08       	push   $0x804a3b0
 8049577:	e8 89 06 00 00       	call   8049c05 <debug_panic>
 804957c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804957f:	8d 50 01             	lea    0x1(%eax),%edx
 8049582:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8049585:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049588:	88 10                	mov    %dl,(%eax)
 804958a:	8b 45 10             	mov    0x10(%ebp),%eax
 804958d:	8d 50 ff             	lea    -0x1(%eax),%edx
 8049590:	89 55 10             	mov    %edx,0x10(%ebp)
 8049593:	85 c0                	test   %eax,%eax
 8049595:	75 e5                	jne    804957c <memset+0x39>
 8049597:	8b 45 08             	mov    0x8(%ebp),%eax
 804959a:	c9                   	leave  
 804959b:	c3                   	ret    

0804959c <strlen>:
 804959c:	55                   	push   %ebp
 804959d:	89 e5                	mov    %esp,%ebp
 804959f:	83 ec 18             	sub    $0x18,%esp
 80495a2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80495a6:	75 21                	jne    80495c9 <strlen+0x2d>
 80495a8:	83 ec 0c             	sub    $0xc,%esp
 80495ab:	68 36 a4 04 08       	push   $0x804a436
 80495b0:	68 99 a3 04 08       	push   $0x804a399
 80495b5:	68 d0 a4 04 08       	push   $0x804a4d0
 80495ba:	68 28 01 00 00       	push   $0x128
 80495bf:	68 b0 a3 04 08       	push   $0x804a3b0
 80495c4:	e8 3c 06 00 00       	call   8049c05 <debug_panic>
 80495c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80495cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80495cf:	eb 03                	jmp    80495d4 <strlen+0x38>
 80495d1:	ff 45 f4             	incl   -0xc(%ebp)
 80495d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80495d7:	8a 00                	mov    (%eax),%al
 80495d9:	84 c0                	test   %al,%al
 80495db:	75 f4                	jne    80495d1 <strlen+0x35>
 80495dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80495e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80495e3:	29 c2                	sub    %eax,%edx
 80495e5:	89 d0                	mov    %edx,%eax
 80495e7:	c9                   	leave  
 80495e8:	c3                   	ret    

080495e9 <strnlen>:
 80495e9:	55                   	push   %ebp
 80495ea:	89 e5                	mov    %esp,%ebp
 80495ec:	83 ec 10             	sub    $0x10,%esp
 80495ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80495f6:	eb 03                	jmp    80495fb <strnlen+0x12>
 80495f8:	ff 45 fc             	incl   -0x4(%ebp)
 80495fb:	8b 55 08             	mov    0x8(%ebp),%edx
 80495fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049601:	01 d0                	add    %edx,%eax
 8049603:	8a 00                	mov    (%eax),%al
 8049605:	84 c0                	test   %al,%al
 8049607:	74 08                	je     8049611 <strnlen+0x28>
 8049609:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804960c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 804960f:	72 e7                	jb     80495f8 <strnlen+0xf>
 8049611:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049614:	c9                   	leave  
 8049615:	c3                   	ret    

08049616 <strlcpy>:
 8049616:	55                   	push   %ebp
 8049617:	89 e5                	mov    %esp,%ebp
 8049619:	83 ec 18             	sub    $0x18,%esp
 804961c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049620:	75 21                	jne    8049643 <strlcpy+0x2d>
 8049622:	83 ec 0c             	sub    $0xc,%esp
 8049625:	68 73 a4 04 08       	push   $0x804a473
 804962a:	68 99 a3 04 08       	push   $0x804a399
 804962f:	68 d8 a4 04 08       	push   $0x804a4d8
 8049634:	68 49 01 00 00       	push   $0x149
 8049639:	68 b0 a3 04 08       	push   $0x804a3b0
 804963e:	e8 c2 05 00 00       	call   8049c05 <debug_panic>
 8049643:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 8049647:	75 21                	jne    804966a <strlcpy+0x54>
 8049649:	83 ec 0c             	sub    $0xc,%esp
 804964c:	68 7f a4 04 08       	push   $0x804a47f
 8049651:	68 99 a3 04 08       	push   $0x804a399
 8049656:	68 d8 a4 04 08       	push   $0x804a4d8
 804965b:	68 4a 01 00 00       	push   $0x14a
 8049660:	68 b0 a3 04 08       	push   $0x804a3b0
 8049665:	e8 9b 05 00 00       	call   8049c05 <debug_panic>
 804966a:	83 ec 0c             	sub    $0xc,%esp
 804966d:	ff 75 0c             	push   0xc(%ebp)
 8049670:	e8 27 ff ff ff       	call   804959c <strlen>
 8049675:	83 c4 10             	add    $0x10,%esp
 8049678:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804967b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 804967f:	74 34                	je     80496b5 <strlcpy+0x9f>
 8049681:	8b 45 10             	mov    0x10(%ebp),%eax
 8049684:	48                   	dec    %eax
 8049685:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049688:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804968b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804968e:	73 06                	jae    8049696 <strlcpy+0x80>
 8049690:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049693:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049696:	83 ec 04             	sub    $0x4,%esp
 8049699:	ff 75 f4             	push   -0xc(%ebp)
 804969c:	ff 75 0c             	push   0xc(%ebp)
 804969f:	ff 75 08             	push   0x8(%ebp)
 80496a2:	e8 c2 f8 ff ff       	call   8048f69 <memcpy>
 80496a7:	83 c4 10             	add    $0x10,%esp
 80496aa:	8b 55 08             	mov    0x8(%ebp),%edx
 80496ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80496b0:	01 d0                	add    %edx,%eax
 80496b2:	c6 00 00             	movb   $0x0,(%eax)
 80496b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80496b8:	c9                   	leave  
 80496b9:	c3                   	ret    

080496ba <strlcat>:
 80496ba:	55                   	push   %ebp
 80496bb:	89 e5                	mov    %esp,%ebp
 80496bd:	83 ec 18             	sub    $0x18,%esp
 80496c0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80496c4:	75 21                	jne    80496e7 <strlcat+0x2d>
 80496c6:	83 ec 0c             	sub    $0xc,%esp
 80496c9:	68 73 a4 04 08       	push   $0x804a473
 80496ce:	68 99 a3 04 08       	push   $0x804a399
 80496d3:	68 e0 a4 04 08       	push   $0x804a4e0
 80496d8:	68 67 01 00 00       	push   $0x167
 80496dd:	68 b0 a3 04 08       	push   $0x804a3b0
 80496e2:	e8 1e 05 00 00       	call   8049c05 <debug_panic>
 80496e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80496eb:	75 21                	jne    804970e <strlcat+0x54>
 80496ed:	83 ec 0c             	sub    $0xc,%esp
 80496f0:	68 7f a4 04 08       	push   $0x804a47f
 80496f5:	68 99 a3 04 08       	push   $0x804a399
 80496fa:	68 e0 a4 04 08       	push   $0x804a4e0
 80496ff:	68 68 01 00 00       	push   $0x168
 8049704:	68 b0 a3 04 08       	push   $0x804a3b0
 8049709:	e8 f7 04 00 00       	call   8049c05 <debug_panic>
 804970e:	83 ec 0c             	sub    $0xc,%esp
 8049711:	ff 75 0c             	push   0xc(%ebp)
 8049714:	e8 83 fe ff ff       	call   804959c <strlen>
 8049719:	83 c4 10             	add    $0x10,%esp
 804971c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804971f:	83 ec 0c             	sub    $0xc,%esp
 8049722:	ff 75 08             	push   0x8(%ebp)
 8049725:	e8 72 fe ff ff       	call   804959c <strlen>
 804972a:	83 c4 10             	add    $0x10,%esp
 804972d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049730:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 8049734:	74 4a                	je     8049780 <strlcat+0xc6>
 8049736:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049739:	3b 45 10             	cmp    0x10(%ebp),%eax
 804973c:	73 42                	jae    8049780 <strlcat+0xc6>
 804973e:	8b 45 10             	mov    0x10(%ebp),%eax
 8049741:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8049744:	48                   	dec    %eax
 8049745:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049748:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804974b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 804974e:	73 06                	jae    8049756 <strlcat+0x9c>
 8049750:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049753:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049756:	8b 55 08             	mov    0x8(%ebp),%edx
 8049759:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804975c:	01 d0                	add    %edx,%eax
 804975e:	83 ec 04             	sub    $0x4,%esp
 8049761:	ff 75 f4             	push   -0xc(%ebp)
 8049764:	ff 75 0c             	push   0xc(%ebp)
 8049767:	50                   	push   %eax
 8049768:	e8 fc f7 ff ff       	call   8048f69 <memcpy>
 804976d:	83 c4 10             	add    $0x10,%esp
 8049770:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049776:	01 c2                	add    %eax,%edx
 8049778:	8b 45 08             	mov    0x8(%ebp),%eax
 804977b:	01 d0                	add    %edx,%eax
 804977d:	c6 00 00             	movb   $0x0,(%eax)
 8049780:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8049783:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049786:	01 d0                	add    %edx,%eax
 8049788:	c9                   	leave  
 8049789:	c3                   	ret    

0804978a <divl>:
 804978a:	55                   	push   %ebp
 804978b:	89 e5                	mov    %esp,%ebp
 804978d:	83 ec 18             	sub    $0x18,%esp
 8049790:	8b 45 08             	mov    0x8(%ebp),%eax
 8049793:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049796:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049799:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804979c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804979f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 80497a2:	89 d0                	mov    %edx,%eax
 80497a4:	31 d2                	xor    %edx,%edx
 80497a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 80497a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80497ac:	89 45 f8             	mov    %eax,-0x8(%ebp)
 80497af:	8b 55 fc             	mov    -0x4(%ebp),%edx
 80497b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80497b5:	f7 75 10             	divl   0x10(%ebp)
 80497b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 80497bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80497be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80497c1:	c9                   	leave  
 80497c2:	c3                   	ret    

080497c3 <nlz>:
 80497c3:	55                   	push   %ebp
 80497c4:	89 e5                	mov    %esp,%ebp
 80497c6:	83 ec 10             	sub    $0x10,%esp
 80497c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 80497d0:	81 7d 08 ff ff 00 00 	cmpl   $0xffff,0x8(%ebp)
 80497d7:	77 08                	ja     80497e1 <nlz+0x1e>
 80497d9:	83 45 fc 10          	addl   $0x10,-0x4(%ebp)
 80497dd:	c1 65 08 10          	shll   $0x10,0x8(%ebp)
 80497e1:	81 7d 08 ff ff ff 00 	cmpl   $0xffffff,0x8(%ebp)
 80497e8:	77 08                	ja     80497f2 <nlz+0x2f>
 80497ea:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 80497ee:	c1 65 08 08          	shll   $0x8,0x8(%ebp)
 80497f2:	81 7d 08 ff ff ff 0f 	cmpl   $0xfffffff,0x8(%ebp)
 80497f9:	77 08                	ja     8049803 <nlz+0x40>
 80497fb:	83 45 fc 04          	addl   $0x4,-0x4(%ebp)
 80497ff:	c1 65 08 04          	shll   $0x4,0x8(%ebp)
 8049803:	81 7d 08 ff ff ff 3f 	cmpl   $0x3fffffff,0x8(%ebp)
 804980a:	77 08                	ja     8049814 <nlz+0x51>
 804980c:	83 45 fc 02          	addl   $0x2,-0x4(%ebp)
 8049810:	c1 65 08 02          	shll   $0x2,0x8(%ebp)
 8049814:	8b 45 08             	mov    0x8(%ebp),%eax
 8049817:	85 c0                	test   %eax,%eax
 8049819:	78 03                	js     804981e <nlz+0x5b>
 804981b:	ff 45 fc             	incl   -0x4(%ebp)
 804981e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049821:	c9                   	leave  
 8049822:	c3                   	ret    

08049823 <udiv64>:
 8049823:	55                   	push   %ebp
 8049824:	89 e5                	mov    %esp,%ebp
 8049826:	57                   	push   %edi
 8049827:	56                   	push   %esi
 8049828:	53                   	push   %ebx
 8049829:	83 ec 44             	sub    $0x44,%esp
 804982c:	8b 45 08             	mov    0x8(%ebp),%eax
 804982f:	89 45 b8             	mov    %eax,-0x48(%ebp)
 8049832:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049835:	89 45 bc             	mov    %eax,-0x44(%ebp)
 8049838:	8b 45 10             	mov    0x10(%ebp),%eax
 804983b:	89 45 b0             	mov    %eax,-0x50(%ebp)
 804983e:	8b 45 14             	mov    0x14(%ebp),%eax
 8049841:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 8049844:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049847:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 804984a:	89 d0                	mov    %edx,%eax
 804984c:	31 d2                	xor    %edx,%edx
 804984e:	89 c7                	mov    %eax,%edi
 8049850:	83 f7 00             	xor    $0x0,%edi
 8049853:	89 f9                	mov    %edi,%ecx
 8049855:	89 d0                	mov    %edx,%eax
 8049857:	80 f4 00             	xor    $0x0,%ah
 804985a:	89 c3                	mov    %eax,%ebx
 804985c:	89 d8                	mov    %ebx,%eax
 804985e:	09 c8                	or     %ecx,%eax
 8049860:	85 c0                	test   %eax,%eax
 8049862:	0f 85 a3 00 00 00    	jne    804990b <udiv64+0xe8>
 8049868:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804986f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 8049876:	8b 45 b8             	mov    -0x48(%ebp),%eax
 8049879:	8b 55 bc             	mov    -0x44(%ebp),%edx
 804987c:	89 d0                	mov    %edx,%eax
 804987e:	31 d2                	xor    %edx,%edx
 8049880:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 8049883:	8b 45 b8             	mov    -0x48(%ebp),%eax
 8049886:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049889:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804988c:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804988f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8049892:	ba 00 00 00 00       	mov    $0x0,%edx
 8049897:	f7 75 dc             	divl   -0x24(%ebp)
 804989a:	89 d0                	mov    %edx,%eax
 804989c:	ba 00 00 00 00       	mov    $0x0,%edx
 80498a1:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 80498a4:	89 cb                	mov    %ecx,%ebx
 80498a6:	0f af da             	imul   %edx,%ebx
 80498a9:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 80498ac:	0f af c8             	imul   %eax,%ecx
 80498af:	01 d9                	add    %ebx,%ecx
 80498b1:	f7 65 e8             	mull   -0x18(%ebp)
 80498b4:	01 d1                	add    %edx,%ecx
 80498b6:	89 ca                	mov    %ecx,%edx
 80498b8:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 80498bb:	bb 00 00 00 00       	mov    $0x0,%ebx
 80498c0:	01 c8                	add    %ecx,%eax
 80498c2:	11 da                	adc    %ebx,%edx
 80498c4:	83 ec 04             	sub    $0x4,%esp
 80498c7:	ff 75 dc             	push   -0x24(%ebp)
 80498ca:	52                   	push   %edx
 80498cb:	50                   	push   %eax
 80498cc:	e8 b9 fe ff ff       	call   804978a <divl>
 80498d1:	83 c4 10             	add    $0x10,%esp
 80498d4:	89 c1                	mov    %eax,%ecx
 80498d6:	bb 00 00 00 00       	mov    $0x0,%ebx
 80498db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80498de:	ba 00 00 00 00       	mov    $0x0,%edx
 80498e3:	f7 75 dc             	divl   -0x24(%ebp)
 80498e6:	ba 00 00 00 00       	mov    $0x0,%edx
 80498eb:	8b 75 e8             	mov    -0x18(%ebp),%esi
 80498ee:	89 f7                	mov    %esi,%edi
 80498f0:	0f af fa             	imul   %edx,%edi
 80498f3:	8b 75 ec             	mov    -0x14(%ebp),%esi
 80498f6:	0f af f0             	imul   %eax,%esi
 80498f9:	01 fe                	add    %edi,%esi
 80498fb:	f7 65 e8             	mull   -0x18(%ebp)
 80498fe:	01 d6                	add    %edx,%esi
 8049900:	89 f2                	mov    %esi,%edx
 8049902:	01 c8                	add    %ecx,%eax
 8049904:	11 da                	adc    %ebx,%edx
 8049906:	e9 e7 00 00 00       	jmp    80499f2 <udiv64+0x1cf>
 804990b:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804990e:	8b 55 bc             	mov    -0x44(%ebp),%edx
 8049911:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 8049914:	77 19                	ja     804992f <udiv64+0x10c>
 8049916:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 8049919:	72 05                	jb     8049920 <udiv64+0xfd>
 804991b:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804991e:	73 0f                	jae    804992f <udiv64+0x10c>
 8049920:	b8 00 00 00 00       	mov    $0x0,%eax
 8049925:	ba 00 00 00 00       	mov    $0x0,%edx
 804992a:	e9 c3 00 00 00       	jmp    80499f2 <udiv64+0x1cf>
 804992f:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049932:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 8049935:	89 d0                	mov    %edx,%eax
 8049937:	31 d2                	xor    %edx,%edx
 8049939:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804993c:	83 ec 04             	sub    $0x4,%esp
 804993f:	ff 75 d8             	push   -0x28(%ebp)
 8049942:	e8 7c fe ff ff       	call   80497c3 <nlz>
 8049947:	83 c4 08             	add    $0x8,%esp
 804994a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 804994d:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 8049950:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049953:	8b 55 b4             	mov    -0x4c(%ebp),%edx
 8049956:	0f a5 c2             	shld   %cl,%eax,%edx
 8049959:	d3 e0                	shl    %cl,%eax
 804995b:	f6 c1 20             	test   $0x20,%cl
 804995e:	74 04                	je     8049964 <udiv64+0x141>
 8049960:	89 c2                	mov    %eax,%edx
 8049962:	31 c0                	xor    %eax,%eax
 8049964:	89 d0                	mov    %edx,%eax
 8049966:	31 d2                	xor    %edx,%edx
 8049968:	89 c1                	mov    %eax,%ecx
 804996a:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804996d:	8b 55 bc             	mov    -0x44(%ebp),%edx
 8049970:	0f ac d0 01          	shrd   $0x1,%edx,%eax
 8049974:	d1 ea                	shr    %edx
 8049976:	83 ec 04             	sub    $0x4,%esp
 8049979:	51                   	push   %ecx
 804997a:	52                   	push   %edx
 804997b:	50                   	push   %eax
 804997c:	e8 09 fe ff ff       	call   804978a <divl>
 8049981:	83 c4 10             	add    $0x10,%esp
 8049984:	89 c2                	mov    %eax,%edx
 8049986:	b8 1f 00 00 00       	mov    $0x1f,%eax
 804998b:	2b 45 d4             	sub    -0x2c(%ebp),%eax
 804998e:	88 c1                	mov    %al,%cl
 8049990:	d3 ea                	shr    %cl,%edx
 8049992:	89 d0                	mov    %edx,%eax
 8049994:	89 45 c8             	mov    %eax,-0x38(%ebp)
 8049997:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
 804999e:	8b 45 c8             	mov    -0x38(%ebp),%eax
 80499a1:	8b 55 cc             	mov    -0x34(%ebp),%edx
 80499a4:	83 c0 ff             	add    $0xffffffff,%eax
 80499a7:	83 d2 ff             	adc    $0xffffffff,%edx
 80499aa:	8b 4d b0             	mov    -0x50(%ebp),%ecx
 80499ad:	89 cb                	mov    %ecx,%ebx
 80499af:	0f af da             	imul   %edx,%ebx
 80499b2:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
 80499b5:	0f af c8             	imul   %eax,%ecx
 80499b8:	01 d9                	add    %ebx,%ecx
 80499ba:	f7 65 b0             	mull   -0x50(%ebp)
 80499bd:	01 d1                	add    %edx,%ecx
 80499bf:	89 ca                	mov    %ecx,%edx
 80499c1:	8b 4d b8             	mov    -0x48(%ebp),%ecx
 80499c4:	8b 5d bc             	mov    -0x44(%ebp),%ebx
 80499c7:	29 c1                	sub    %eax,%ecx
 80499c9:	19 d3                	sbb    %edx,%ebx
 80499cb:	89 c8                	mov    %ecx,%eax
 80499cd:	89 da                	mov    %ebx,%edx
 80499cf:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 80499d2:	77 18                	ja     80499ec <udiv64+0x1c9>
 80499d4:	3b 55 b4             	cmp    -0x4c(%ebp),%edx
 80499d7:	72 05                	jb     80499de <udiv64+0x1bb>
 80499d9:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 80499dc:	73 0e                	jae    80499ec <udiv64+0x1c9>
 80499de:	8b 45 c8             	mov    -0x38(%ebp),%eax
 80499e1:	8b 55 cc             	mov    -0x34(%ebp),%edx
 80499e4:	83 c0 ff             	add    $0xffffffff,%eax
 80499e7:	83 d2 ff             	adc    $0xffffffff,%edx
 80499ea:	eb 06                	jmp    80499f2 <udiv64+0x1cf>
 80499ec:	8b 45 c8             	mov    -0x38(%ebp),%eax
 80499ef:	8b 55 cc             	mov    -0x34(%ebp),%edx
 80499f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 80499f5:	5b                   	pop    %ebx
 80499f6:	5e                   	pop    %esi
 80499f7:	5f                   	pop    %edi
 80499f8:	5d                   	pop    %ebp
 80499f9:	c3                   	ret    

080499fa <umod64>:
 80499fa:	55                   	push   %ebp
 80499fb:	89 e5                	mov    %esp,%ebp
 80499fd:	53                   	push   %ebx
 80499fe:	83 ec 14             	sub    $0x14,%esp
 8049a01:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a04:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a07:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049a0d:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a10:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049a13:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a16:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049a19:	8b 5d f0             	mov    -0x10(%ebp),%ebx
 8049a1c:	ff 75 ec             	push   -0x14(%ebp)
 8049a1f:	ff 75 e8             	push   -0x18(%ebp)
 8049a22:	ff 75 f4             	push   -0xc(%ebp)
 8049a25:	ff 75 f0             	push   -0x10(%ebp)
 8049a28:	e8 f6 fd ff ff       	call   8049823 <udiv64>
 8049a2d:	83 c4 10             	add    $0x10,%esp
 8049a30:	89 c2                	mov    %eax,%edx
 8049a32:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049a35:	0f af c2             	imul   %edx,%eax
 8049a38:	29 c3                	sub    %eax,%ebx
 8049a3a:	89 d8                	mov    %ebx,%eax
 8049a3c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8049a3f:	c9                   	leave  
 8049a40:	c3                   	ret    

08049a41 <sdiv64>:
 8049a41:	55                   	push   %ebp
 8049a42:	89 e5                	mov    %esp,%ebp
 8049a44:	83 ec 30             	sub    $0x30,%esp
 8049a47:	8b 45 08             	mov    0x8(%ebp),%eax
 8049a4a:	89 45 d8             	mov    %eax,-0x28(%ebp)
 8049a4d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a50:	89 45 dc             	mov    %eax,-0x24(%ebp)
 8049a53:	8b 45 10             	mov    0x10(%ebp),%eax
 8049a56:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8049a59:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a5c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 8049a5f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 8049a63:	79 0f                	jns    8049a74 <sdiv64+0x33>
 8049a65:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8049a68:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8049a6b:	f7 d8                	neg    %eax
 8049a6d:	83 d2 00             	adc    $0x0,%edx
 8049a70:	f7 da                	neg    %edx
 8049a72:	eb 06                	jmp    8049a7a <sdiv64+0x39>
 8049a74:	8b 45 d8             	mov    -0x28(%ebp),%eax
 8049a77:	8b 55 dc             	mov    -0x24(%ebp),%edx
 8049a7a:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049a7d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 8049a80:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 8049a84:	79 0f                	jns    8049a95 <sdiv64+0x54>
 8049a86:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8049a89:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8049a8c:	f7 d8                	neg    %eax
 8049a8e:	83 d2 00             	adc    $0x0,%edx
 8049a91:	f7 da                	neg    %edx
 8049a93:	eb 06                	jmp    8049a9b <sdiv64+0x5a>
 8049a95:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8049a98:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8049a9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a9e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8049aa1:	ff 75 f4             	push   -0xc(%ebp)
 8049aa4:	ff 75 f0             	push   -0x10(%ebp)
 8049aa7:	ff 75 fc             	push   -0x4(%ebp)
 8049aaa:	ff 75 f8             	push   -0x8(%ebp)
 8049aad:	e8 71 fd ff ff       	call   8049823 <udiv64>
 8049ab2:	83 c4 10             	add    $0x10,%esp
 8049ab5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049ab8:	89 55 ec             	mov    %edx,-0x14(%ebp)
 8049abb:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8049abe:	f7 d0                	not    %eax
 8049ac0:	c1 e8 1f             	shr    $0x1f,%eax
 8049ac3:	88 c2                	mov    %al,%dl
 8049ac5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 8049ac8:	c1 e8 1f             	shr    $0x1f,%eax
 8049acb:	31 d0                	xor    %edx,%eax
 8049acd:	84 c0                	test   %al,%al
 8049acf:	74 08                	je     8049ad9 <sdiv64+0x98>
 8049ad1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049ad4:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049ad7:	eb 0d                	jmp    8049ae6 <sdiv64+0xa5>
 8049ad9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049adc:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049adf:	f7 d8                	neg    %eax
 8049ae1:	83 d2 00             	adc    $0x0,%edx
 8049ae4:	f7 da                	neg    %edx
 8049ae6:	c9                   	leave  
 8049ae7:	c3                   	ret    

08049ae8 <smod64>:
 8049ae8:	55                   	push   %ebp
 8049ae9:	89 e5                	mov    %esp,%ebp
 8049aeb:	53                   	push   %ebx
 8049aec:	83 ec 14             	sub    $0x14,%esp
 8049aef:	8b 45 08             	mov    0x8(%ebp),%eax
 8049af2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049af5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049af8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049afb:	8b 45 10             	mov    0x10(%ebp),%eax
 8049afe:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049b01:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b04:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049b07:	8b 5d f0             	mov    -0x10(%ebp),%ebx
 8049b0a:	ff 75 ec             	push   -0x14(%ebp)
 8049b0d:	ff 75 e8             	push   -0x18(%ebp)
 8049b10:	ff 75 f4             	push   -0xc(%ebp)
 8049b13:	ff 75 f0             	push   -0x10(%ebp)
 8049b16:	e8 26 ff ff ff       	call   8049a41 <sdiv64>
 8049b1b:	83 c4 10             	add    $0x10,%esp
 8049b1e:	89 c2                	mov    %eax,%edx
 8049b20:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049b23:	0f af c2             	imul   %edx,%eax
 8049b26:	29 c3                	sub    %eax,%ebx
 8049b28:	89 d8                	mov    %ebx,%eax
 8049b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8049b2d:	c9                   	leave  
 8049b2e:	c3                   	ret    

08049b2f <__divdi3>:
 8049b2f:	55                   	push   %ebp
 8049b30:	89 e5                	mov    %esp,%ebp
 8049b32:	83 ec 10             	sub    $0x10,%esp
 8049b35:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b38:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049b3b:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049b41:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b44:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b47:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b4d:	ff 75 f4             	push   -0xc(%ebp)
 8049b50:	ff 75 f0             	push   -0x10(%ebp)
 8049b53:	ff 75 fc             	push   -0x4(%ebp)
 8049b56:	ff 75 f8             	push   -0x8(%ebp)
 8049b59:	e8 e3 fe ff ff       	call   8049a41 <sdiv64>
 8049b5e:	83 c4 10             	add    $0x10,%esp
 8049b61:	c9                   	leave  
 8049b62:	c3                   	ret    

08049b63 <__moddi3>:
 8049b63:	55                   	push   %ebp
 8049b64:	89 e5                	mov    %esp,%ebp
 8049b66:	83 ec 10             	sub    $0x10,%esp
 8049b69:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b6c:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049b6f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049b72:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049b75:	8b 45 10             	mov    0x10(%ebp),%eax
 8049b78:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049b7b:	8b 45 14             	mov    0x14(%ebp),%eax
 8049b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b81:	ff 75 f4             	push   -0xc(%ebp)
 8049b84:	ff 75 f0             	push   -0x10(%ebp)
 8049b87:	ff 75 fc             	push   -0x4(%ebp)
 8049b8a:	ff 75 f8             	push   -0x8(%ebp)
 8049b8d:	e8 56 ff ff ff       	call   8049ae8 <smod64>
 8049b92:	83 c4 10             	add    $0x10,%esp
 8049b95:	99                   	cltd   
 8049b96:	c9                   	leave  
 8049b97:	c3                   	ret    

08049b98 <__udivdi3>:
 8049b98:	55                   	push   %ebp
 8049b99:	89 e5                	mov    %esp,%ebp
 8049b9b:	83 ec 10             	sub    $0x10,%esp
 8049b9e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ba1:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049ba4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049ba7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049baa:	8b 45 10             	mov    0x10(%ebp),%eax
 8049bad:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049bb0:	8b 45 14             	mov    0x14(%ebp),%eax
 8049bb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049bb6:	ff 75 f4             	push   -0xc(%ebp)
 8049bb9:	ff 75 f0             	push   -0x10(%ebp)
 8049bbc:	ff 75 fc             	push   -0x4(%ebp)
 8049bbf:	ff 75 f8             	push   -0x8(%ebp)
 8049bc2:	e8 5c fc ff ff       	call   8049823 <udiv64>
 8049bc7:	83 c4 10             	add    $0x10,%esp
 8049bca:	c9                   	leave  
 8049bcb:	c3                   	ret    

08049bcc <__umoddi3>:
 8049bcc:	55                   	push   %ebp
 8049bcd:	89 e5                	mov    %esp,%ebp
 8049bcf:	83 ec 10             	sub    $0x10,%esp
 8049bd2:	8b 45 08             	mov    0x8(%ebp),%eax
 8049bd5:	89 45 f8             	mov    %eax,-0x8(%ebp)
 8049bd8:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049bdb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049bde:	8b 45 10             	mov    0x10(%ebp),%eax
 8049be1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049be4:	8b 45 14             	mov    0x14(%ebp),%eax
 8049be7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049bea:	ff 75 f4             	push   -0xc(%ebp)
 8049bed:	ff 75 f0             	push   -0x10(%ebp)
 8049bf0:	ff 75 fc             	push   -0x4(%ebp)
 8049bf3:	ff 75 f8             	push   -0x8(%ebp)
 8049bf6:	e8 ff fd ff ff       	call   80499fa <umod64>
 8049bfb:	83 c4 10             	add    $0x10,%esp
 8049bfe:	ba 00 00 00 00       	mov    $0x0,%edx
 8049c03:	c9                   	leave  
 8049c04:	c3                   	ret    

08049c05 <debug_panic>:
 8049c05:	55                   	push   %ebp
 8049c06:	89 e5                	mov    %esp,%ebp
 8049c08:	83 ec 18             	sub    $0x18,%esp
 8049c0b:	ff 75 10             	push   0x10(%ebp)
 8049c0e:	ff 75 0c             	push   0xc(%ebp)
 8049c11:	ff 75 08             	push   0x8(%ebp)
 8049c14:	68 e8 a4 04 08       	push   $0x804a4e8
 8049c19:	e8 9e e5 ff ff       	call   80481bc <printf>
 8049c1e:	83 c4 10             	add    $0x10,%esp
 8049c21:	8d 45 18             	lea    0x18(%ebp),%eax
 8049c24:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049c27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c2a:	83 ec 08             	sub    $0x8,%esp
 8049c2d:	50                   	push   %eax
 8049c2e:	ff 75 14             	push   0x14(%ebp)
 8049c31:	e8 5c 02 00 00       	call   8049e92 <vprintf>
 8049c36:	83 c4 10             	add    $0x10,%esp
 8049c39:	83 ec 0c             	sub    $0xc,%esp
 8049c3c:	6a 0a                	push   $0xa
 8049c3e:	e8 cc 02 00 00       	call   8049f0f <putchar>
 8049c43:	83 c4 10             	add    $0x10,%esp
 8049c46:	e8 c9 03 00 00       	call   804a014 <debug_backtrace>
 8049c4b:	83 ec 0c             	sub    $0xc,%esp
 8049c4e:	6a 01                	push   $0x1
 8049c50:	e8 26 00 00 00       	call   8049c7b <exit>

08049c55 <halt>:
 8049c55:	55                   	push   %ebp
 8049c56:	89 e5                	mov    %esp,%ebp
 8049c58:	83 ec 18             	sub    $0x18,%esp
 8049c5b:	6a 00                	push   $0x0
 8049c5d:	cd 30                	int    $0x30
 8049c5f:	83 c4 04             	add    $0x4,%esp
 8049c62:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049c65:	68 10 a5 04 08       	push   $0x804a510
 8049c6a:	68 48 a5 04 08       	push   $0x804a548
 8049c6f:	6a 44                	push   $0x44
 8049c71:	68 32 a5 04 08       	push   $0x804a532
 8049c76:	e8 8a ff ff ff       	call   8049c05 <debug_panic>

08049c7b <exit>:
 8049c7b:	55                   	push   %ebp
 8049c7c:	89 e5                	mov    %esp,%ebp
 8049c7e:	83 ec 18             	sub    $0x18,%esp
 8049c81:	ff 75 08             	push   0x8(%ebp)
 8049c84:	6a 01                	push   $0x1
 8049c86:	cd 30                	int    $0x30
 8049c88:	83 c4 08             	add    $0x8,%esp
 8049c8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049c8e:	68 10 a5 04 08       	push   $0x804a510
 8049c93:	68 50 a5 04 08       	push   $0x804a550
 8049c98:	6a 4b                	push   $0x4b
 8049c9a:	68 32 a5 04 08       	push   $0x804a532
 8049c9f:	e8 61 ff ff ff       	call   8049c05 <debug_panic>

08049ca4 <exec>:
 8049ca4:	55                   	push   %ebp
 8049ca5:	89 e5                	mov    %esp,%ebp
 8049ca7:	83 ec 10             	sub    $0x10,%esp
 8049caa:	ff 75 08             	push   0x8(%ebp)
 8049cad:	6a 02                	push   $0x2
 8049caf:	cd 30                	int    $0x30
 8049cb1:	83 c4 08             	add    $0x8,%esp
 8049cb4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049cb7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049cba:	c9                   	leave  
 8049cbb:	c3                   	ret    

08049cbc <wait>:
 8049cbc:	55                   	push   %ebp
 8049cbd:	89 e5                	mov    %esp,%ebp
 8049cbf:	83 ec 10             	sub    $0x10,%esp
 8049cc2:	ff 75 08             	push   0x8(%ebp)
 8049cc5:	6a 03                	push   $0x3
 8049cc7:	cd 30                	int    $0x30
 8049cc9:	83 c4 08             	add    $0x8,%esp
 8049ccc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049ccf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049cd2:	c9                   	leave  
 8049cd3:	c3                   	ret    

08049cd4 <create>:
 8049cd4:	55                   	push   %ebp
 8049cd5:	89 e5                	mov    %esp,%ebp
 8049cd7:	83 ec 10             	sub    $0x10,%esp
 8049cda:	8b 45 08             	mov    0x8(%ebp),%eax
 8049cdd:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049ce0:	52                   	push   %edx
 8049ce1:	50                   	push   %eax
 8049ce2:	6a 04                	push   $0x4
 8049ce4:	cd 30                	int    $0x30
 8049ce6:	83 c4 0c             	add    $0xc,%esp
 8049ce9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049cec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049cef:	85 c0                	test   %eax,%eax
 8049cf1:	0f 95 c0             	setne  %al
 8049cf4:	c9                   	leave  
 8049cf5:	c3                   	ret    

08049cf6 <remove>:
 8049cf6:	55                   	push   %ebp
 8049cf7:	89 e5                	mov    %esp,%ebp
 8049cf9:	83 ec 10             	sub    $0x10,%esp
 8049cfc:	ff 75 08             	push   0x8(%ebp)
 8049cff:	6a 05                	push   $0x5
 8049d01:	cd 30                	int    $0x30
 8049d03:	83 c4 08             	add    $0x8,%esp
 8049d06:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d09:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d0c:	85 c0                	test   %eax,%eax
 8049d0e:	0f 95 c0             	setne  %al
 8049d11:	c9                   	leave  
 8049d12:	c3                   	ret    

08049d13 <open>:
 8049d13:	55                   	push   %ebp
 8049d14:	89 e5                	mov    %esp,%ebp
 8049d16:	83 ec 10             	sub    $0x10,%esp
 8049d19:	ff 75 08             	push   0x8(%ebp)
 8049d1c:	6a 06                	push   $0x6
 8049d1e:	cd 30                	int    $0x30
 8049d20:	83 c4 08             	add    $0x8,%esp
 8049d23:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d29:	c9                   	leave  
 8049d2a:	c3                   	ret    

08049d2b <filesize>:
 8049d2b:	55                   	push   %ebp
 8049d2c:	89 e5                	mov    %esp,%ebp
 8049d2e:	83 ec 10             	sub    $0x10,%esp
 8049d31:	ff 75 08             	push   0x8(%ebp)
 8049d34:	6a 07                	push   $0x7
 8049d36:	cd 30                	int    $0x30
 8049d38:	83 c4 08             	add    $0x8,%esp
 8049d3b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d41:	c9                   	leave  
 8049d42:	c3                   	ret    

08049d43 <read>:
 8049d43:	55                   	push   %ebp
 8049d44:	89 e5                	mov    %esp,%ebp
 8049d46:	83 ec 10             	sub    $0x10,%esp
 8049d49:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d4c:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d4f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049d52:	51                   	push   %ecx
 8049d53:	52                   	push   %edx
 8049d54:	50                   	push   %eax
 8049d55:	6a 08                	push   $0x8
 8049d57:	cd 30                	int    $0x30
 8049d59:	83 c4 10             	add    $0x10,%esp
 8049d5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d62:	c9                   	leave  
 8049d63:	c3                   	ret    

08049d64 <write>:
 8049d64:	55                   	push   %ebp
 8049d65:	89 e5                	mov    %esp,%ebp
 8049d67:	83 ec 10             	sub    $0x10,%esp
 8049d6a:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d6d:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d70:	8b 4d 10             	mov    0x10(%ebp),%ecx
 8049d73:	51                   	push   %ecx
 8049d74:	52                   	push   %edx
 8049d75:	50                   	push   %eax
 8049d76:	6a 09                	push   $0x9
 8049d78:	cd 30                	int    $0x30
 8049d7a:	83 c4 10             	add    $0x10,%esp
 8049d7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d80:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049d83:	c9                   	leave  
 8049d84:	c3                   	ret    

08049d85 <seek>:
 8049d85:	55                   	push   %ebp
 8049d86:	89 e5                	mov    %esp,%ebp
 8049d88:	83 ec 10             	sub    $0x10,%esp
 8049d8b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d8e:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d91:	52                   	push   %edx
 8049d92:	50                   	push   %eax
 8049d93:	6a 0a                	push   $0xa
 8049d95:	cd 30                	int    $0x30
 8049d97:	83 c4 0c             	add    $0xc,%esp
 8049d9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049d9d:	90                   	nop
 8049d9e:	c9                   	leave  
 8049d9f:	c3                   	ret    

08049da0 <tell>:
 8049da0:	55                   	push   %ebp
 8049da1:	89 e5                	mov    %esp,%ebp
 8049da3:	83 ec 10             	sub    $0x10,%esp
 8049da6:	ff 75 08             	push   0x8(%ebp)
 8049da9:	6a 0b                	push   $0xb
 8049dab:	cd 30                	int    $0x30
 8049dad:	83 c4 08             	add    $0x8,%esp
 8049db0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049db3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049db6:	c9                   	leave  
 8049db7:	c3                   	ret    

08049db8 <close>:
 8049db8:	55                   	push   %ebp
 8049db9:	89 e5                	mov    %esp,%ebp
 8049dbb:	83 ec 10             	sub    $0x10,%esp
 8049dbe:	ff 75 08             	push   0x8(%ebp)
 8049dc1:	6a 0c                	push   $0xc
 8049dc3:	cd 30                	int    $0x30
 8049dc5:	83 c4 08             	add    $0x8,%esp
 8049dc8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049dcb:	90                   	nop
 8049dcc:	c9                   	leave  
 8049dcd:	c3                   	ret    

08049dce <mmap>:
 8049dce:	55                   	push   %ebp
 8049dcf:	89 e5                	mov    %esp,%ebp
 8049dd1:	83 ec 10             	sub    $0x10,%esp
 8049dd4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dd7:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049dda:	52                   	push   %edx
 8049ddb:	50                   	push   %eax
 8049ddc:	6a 0d                	push   $0xd
 8049dde:	cd 30                	int    $0x30
 8049de0:	83 c4 0c             	add    $0xc,%esp
 8049de3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049de6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049de9:	c9                   	leave  
 8049dea:	c3                   	ret    

08049deb <munmap>:
 8049deb:	55                   	push   %ebp
 8049dec:	89 e5                	mov    %esp,%ebp
 8049dee:	83 ec 10             	sub    $0x10,%esp
 8049df1:	ff 75 08             	push   0x8(%ebp)
 8049df4:	6a 0e                	push   $0xe
 8049df6:	cd 30                	int    $0x30
 8049df8:	83 c4 08             	add    $0x8,%esp
 8049dfb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049dfe:	90                   	nop
 8049dff:	c9                   	leave  
 8049e00:	c3                   	ret    

08049e01 <chdir>:
 8049e01:	55                   	push   %ebp
 8049e02:	89 e5                	mov    %esp,%ebp
 8049e04:	83 ec 10             	sub    $0x10,%esp
 8049e07:	ff 75 08             	push   0x8(%ebp)
 8049e0a:	6a 0f                	push   $0xf
 8049e0c:	cd 30                	int    $0x30
 8049e0e:	83 c4 08             	add    $0x8,%esp
 8049e11:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e17:	85 c0                	test   %eax,%eax
 8049e19:	0f 95 c0             	setne  %al
 8049e1c:	c9                   	leave  
 8049e1d:	c3                   	ret    

08049e1e <mkdir>:
 8049e1e:	55                   	push   %ebp
 8049e1f:	89 e5                	mov    %esp,%ebp
 8049e21:	83 ec 10             	sub    $0x10,%esp
 8049e24:	ff 75 08             	push   0x8(%ebp)
 8049e27:	6a 10                	push   $0x10
 8049e29:	cd 30                	int    $0x30
 8049e2b:	83 c4 08             	add    $0x8,%esp
 8049e2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e31:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e34:	85 c0                	test   %eax,%eax
 8049e36:	0f 95 c0             	setne  %al
 8049e39:	c9                   	leave  
 8049e3a:	c3                   	ret    

08049e3b <readdir>:
 8049e3b:	55                   	push   %ebp
 8049e3c:	89 e5                	mov    %esp,%ebp
 8049e3e:	83 ec 10             	sub    $0x10,%esp
 8049e41:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e44:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049e47:	52                   	push   %edx
 8049e48:	50                   	push   %eax
 8049e49:	6a 11                	push   $0x11
 8049e4b:	cd 30                	int    $0x30
 8049e4d:	83 c4 0c             	add    $0xc,%esp
 8049e50:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e56:	85 c0                	test   %eax,%eax
 8049e58:	0f 95 c0             	setne  %al
 8049e5b:	c9                   	leave  
 8049e5c:	c3                   	ret    

08049e5d <isdir>:
 8049e5d:	55                   	push   %ebp
 8049e5e:	89 e5                	mov    %esp,%ebp
 8049e60:	83 ec 10             	sub    $0x10,%esp
 8049e63:	ff 75 08             	push   0x8(%ebp)
 8049e66:	6a 12                	push   $0x12
 8049e68:	cd 30                	int    $0x30
 8049e6a:	83 c4 08             	add    $0x8,%esp
 8049e6d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e70:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e73:	85 c0                	test   %eax,%eax
 8049e75:	0f 95 c0             	setne  %al
 8049e78:	c9                   	leave  
 8049e79:	c3                   	ret    

08049e7a <inumber>:
 8049e7a:	55                   	push   %ebp
 8049e7b:	89 e5                	mov    %esp,%ebp
 8049e7d:	83 ec 10             	sub    $0x10,%esp
 8049e80:	ff 75 08             	push   0x8(%ebp)
 8049e83:	6a 13                	push   $0x13
 8049e85:	cd 30                	int    $0x30
 8049e87:	83 c4 08             	add    $0x8,%esp
 8049e8a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049e8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049e90:	c9                   	leave  
 8049e91:	c3                   	ret    

08049e92 <vprintf>:
 8049e92:	55                   	push   %ebp
 8049e93:	89 e5                	mov    %esp,%ebp
 8049e95:	83 ec 08             	sub    $0x8,%esp
 8049e98:	83 ec 04             	sub    $0x4,%esp
 8049e9b:	ff 75 0c             	push   0xc(%ebp)
 8049e9e:	ff 75 08             	push   0x8(%ebp)
 8049ea1:	6a 01                	push   $0x1
 8049ea3:	e8 8b 00 00 00       	call   8049f33 <vhprintf>
 8049ea8:	83 c4 10             	add    $0x10,%esp
 8049eab:	c9                   	leave  
 8049eac:	c3                   	ret    

08049ead <hprintf>:
 8049ead:	55                   	push   %ebp
 8049eae:	89 e5                	mov    %esp,%ebp
 8049eb0:	83 ec 18             	sub    $0x18,%esp
 8049eb3:	8d 45 10             	lea    0x10(%ebp),%eax
 8049eb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049eb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049ebc:	83 ec 04             	sub    $0x4,%esp
 8049ebf:	50                   	push   %eax
 8049ec0:	ff 75 0c             	push   0xc(%ebp)
 8049ec3:	ff 75 08             	push   0x8(%ebp)
 8049ec6:	e8 68 00 00 00       	call   8049f33 <vhprintf>
 8049ecb:	83 c4 10             	add    $0x10,%esp
 8049ece:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049ed1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049ed4:	c9                   	leave  
 8049ed5:	c3                   	ret    

08049ed6 <puts>:
 8049ed6:	55                   	push   %ebp
 8049ed7:	89 e5                	mov    %esp,%ebp
 8049ed9:	83 ec 08             	sub    $0x8,%esp
 8049edc:	83 ec 0c             	sub    $0xc,%esp
 8049edf:	ff 75 08             	push   0x8(%ebp)
 8049ee2:	e8 b5 f6 ff ff       	call   804959c <strlen>
 8049ee7:	83 c4 10             	add    $0x10,%esp
 8049eea:	83 ec 04             	sub    $0x4,%esp
 8049eed:	50                   	push   %eax
 8049eee:	ff 75 08             	push   0x8(%ebp)
 8049ef1:	6a 01                	push   $0x1
 8049ef3:	e8 6c fe ff ff       	call   8049d64 <write>
 8049ef8:	83 c4 10             	add    $0x10,%esp
 8049efb:	83 ec 0c             	sub    $0xc,%esp
 8049efe:	6a 0a                	push   $0xa
 8049f00:	e8 0a 00 00 00       	call   8049f0f <putchar>
 8049f05:	83 c4 10             	add    $0x10,%esp
 8049f08:	b8 00 00 00 00       	mov    $0x0,%eax
 8049f0d:	c9                   	leave  
 8049f0e:	c3                   	ret    

08049f0f <putchar>:
 8049f0f:	55                   	push   %ebp
 8049f10:	89 e5                	mov    %esp,%ebp
 8049f12:	83 ec 18             	sub    $0x18,%esp
 8049f15:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f18:	88 45 f7             	mov    %al,-0x9(%ebp)
 8049f1b:	83 ec 04             	sub    $0x4,%esp
 8049f1e:	6a 01                	push   $0x1
 8049f20:	8d 45 f7             	lea    -0x9(%ebp),%eax
 8049f23:	50                   	push   %eax
 8049f24:	6a 01                	push   $0x1
 8049f26:	e8 39 fe ff ff       	call   8049d64 <write>
 8049f2b:	83 c4 10             	add    $0x10,%esp
 8049f2e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f31:	c9                   	leave  
 8049f32:	c3                   	ret    

08049f33 <vhprintf>:
 8049f33:	55                   	push   %ebp
 8049f34:	89 e5                	mov    %esp,%ebp
 8049f36:	83 ec 58             	sub    $0x58,%esp
 8049f39:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049f3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8049f3f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049f46:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f49:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049f4c:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049f4f:	50                   	push   %eax
 8049f50:	68 77 9f 04 08       	push   $0x8049f77
 8049f55:	ff 75 10             	push   0x10(%ebp)
 8049f58:	ff 75 0c             	push   0xc(%ebp)
 8049f5b:	e8 82 e2 ff ff       	call   80481e2 <__vprintf>
 8049f60:	83 c4 10             	add    $0x10,%esp
 8049f63:	83 ec 0c             	sub    $0xc,%esp
 8049f66:	8d 45 ac             	lea    -0x54(%ebp),%eax
 8049f69:	50                   	push   %eax
 8049f6a:	e8 5e 00 00 00       	call   8049fcd <flush>
 8049f6f:	83 c4 10             	add    $0x10,%esp
 8049f72:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049f75:	c9                   	leave  
 8049f76:	c3                   	ret    

08049f77 <add_char>:
 8049f77:	55                   	push   %ebp
 8049f78:	89 e5                	mov    %esp,%ebp
 8049f7a:	83 ec 28             	sub    $0x28,%esp
 8049f7d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f80:	88 45 e4             	mov    %al,-0x1c(%ebp)
 8049f83:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049f86:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049f89:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049f8c:	8b 40 40             	mov    0x40(%eax),%eax
 8049f8f:	8d 48 01             	lea    0x1(%eax),%ecx
 8049f92:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049f95:	89 4a 40             	mov    %ecx,0x40(%edx)
 8049f98:	8a 55 e4             	mov    -0x1c(%ebp),%dl
 8049f9b:	88 10                	mov    %dl,(%eax)
 8049f9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049fa0:	8b 40 40             	mov    0x40(%eax),%eax
 8049fa3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049fa6:	83 c2 40             	add    $0x40,%edx
 8049fa9:	39 d0                	cmp    %edx,%eax
 8049fab:	72 0e                	jb     8049fbb <add_char+0x44>
 8049fad:	83 ec 0c             	sub    $0xc,%esp
 8049fb0:	ff 75 f4             	push   -0xc(%ebp)
 8049fb3:	e8 15 00 00 00       	call   8049fcd <flush>
 8049fb8:	83 c4 10             	add    $0x10,%esp
 8049fbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049fbe:	8b 40 44             	mov    0x44(%eax),%eax
 8049fc1:	8d 50 01             	lea    0x1(%eax),%edx
 8049fc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049fc7:	89 50 44             	mov    %edx,0x44(%eax)
 8049fca:	90                   	nop
 8049fcb:	c9                   	leave  
 8049fcc:	c3                   	ret    

08049fcd <flush>:
 8049fcd:	55                   	push   %ebp
 8049fce:	89 e5                	mov    %esp,%ebp
 8049fd0:	83 ec 08             	sub    $0x8,%esp
 8049fd3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fd6:	8b 50 40             	mov    0x40(%eax),%edx
 8049fd9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fdc:	39 c2                	cmp    %eax,%edx
 8049fde:	76 28                	jbe    804a008 <flush+0x3b>
 8049fe0:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fe3:	8b 40 40             	mov    0x40(%eax),%eax
 8049fe6:	89 c2                	mov    %eax,%edx
 8049fe8:	8b 45 08             	mov    0x8(%ebp),%eax
 8049feb:	29 c2                	sub    %eax,%edx
 8049fed:	89 d0                	mov    %edx,%eax
 8049fef:	89 c1                	mov    %eax,%ecx
 8049ff1:	8b 55 08             	mov    0x8(%ebp),%edx
 8049ff4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ff7:	8b 40 48             	mov    0x48(%eax),%eax
 8049ffa:	83 ec 04             	sub    $0x4,%esp
 8049ffd:	51                   	push   %ecx
 8049ffe:	52                   	push   %edx
 8049fff:	50                   	push   %eax
 804a000:	e8 5f fd ff ff       	call   8049d64 <write>
 804a005:	83 c4 10             	add    $0x10,%esp
 804a008:	8b 55 08             	mov    0x8(%ebp),%edx
 804a00b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a00e:	89 50 40             	mov    %edx,0x40(%eax)
 804a011:	90                   	nop
 804a012:	c9                   	leave  
 804a013:	c3                   	ret    

0804a014 <debug_backtrace>:
 804a014:	55                   	push   %ebp
 804a015:	89 e5                	mov    %esp,%ebp
 804a017:	83 ec 18             	sub    $0x18,%esp
 804a01a:	8b 45 04             	mov    0x4(%ebp),%eax
 804a01d:	83 ec 08             	sub    $0x8,%esp
 804a020:	50                   	push   %eax
 804a021:	68 58 a5 04 08       	push   $0x804a558
 804a026:	e8 91 e1 ff ff       	call   80481bc <printf>
 804a02b:	83 c4 10             	add    $0x10,%esp
 804a02e:	8b 45 00             	mov    0x0(%ebp),%eax
 804a031:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a034:	eb 21                	jmp    804a057 <debug_backtrace+0x43>
 804a036:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a039:	83 c0 04             	add    $0x4,%eax
 804a03c:	8b 00                	mov    (%eax),%eax
 804a03e:	83 ec 08             	sub    $0x8,%esp
 804a041:	50                   	push   %eax
 804a042:	68 67 a5 04 08       	push   $0x804a567
 804a047:	e8 70 e1 ff ff       	call   80481bc <printf>
 804a04c:	83 c4 10             	add    $0x10,%esp
 804a04f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a052:	8b 00                	mov    (%eax),%eax
 804a054:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a057:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a05a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 804a05f:	76 09                	jbe    804a06a <debug_backtrace+0x56>
 804a061:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a064:	8b 00                	mov    (%eax),%eax
 804a066:	85 c0                	test   %eax,%eax
 804a068:	75 cc                	jne    804a036 <debug_backtrace+0x22>
 804a06a:	83 ec 0c             	sub    $0xc,%esp
 804a06d:	68 6b a5 04 08       	push   $0x804a56b
 804a072:	e8 5f fe ff ff       	call   8049ed6 <puts>
 804a077:	83 c4 10             	add    $0x10,%esp
 804a07a:	a0 24 b6 04 08       	mov    0x804b624,%al
 804a07f:	83 f0 01             	xor    $0x1,%eax
 804a082:	84 c0                	test   %al,%al
 804a084:	74 17                	je     804a09d <debug_backtrace+0x89>
 804a086:	c6 05 24 b6 04 08 01 	movb   $0x1,0x804b624
 804a08d:	83 ec 0c             	sub    $0xc,%esp
 804a090:	68 70 a5 04 08       	push   $0x804a570
 804a095:	e8 3c fe ff ff       	call   8049ed6 <puts>
 804a09a:	83 c4 10             	add    $0x10,%esp
 804a09d:	90                   	nop
 804a09e:	c9                   	leave  
 804a09f:	c3                   	ret    
