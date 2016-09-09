//
//  TestViewController.m
//  FocusImagesScrollView
//
//  Created by jimmy on 16/8/24.
//  Copyright © 2016年 jmxonline@sina.com. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    
    LOGCA(@"%@", [self valueForKey:@"_view"]);
    self.isStyleTable = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSLocalizedString(@"UI测试", nil);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark- test self.view
- (void)loadView
{
    /*
     loadViewIfRequired {
        ...
        loadView;
        ...
        viewDidLoad;
        ...
     }
     */
    LOGCA(@"%@", [self valueForKey:@"_view"]);//(null), self.view should not earlier than this point.
    [super loadView];
}

/*
 UIKit`-[UIViewController loadViewIfRequired]:
 0x107aaa4d6 <+0>:    pushq  %rbp
 0x107aaa4d7 <+1>:    movq   %rsp, %rbp
 0x107aaa4da <+4>:    pushq  %r15
 0x107aaa4dc <+6>:    pushq  %r14
 0x107aaa4de <+8>:    pushq  %r13
 0x107aaa4e0 <+10>:   pushq  %r12
 0x107aaa4e2 <+12>:   pushq  %rbx
 0x107aaa4e3 <+13>:   subq   $0x1f8, %rsp              ; imm = 0x1F8
 0x107aaa4ea <+20>:   movq   %rdi, %rbx
 0x107aaa4ed <+23>:   movq   0xbce574(%rip), %r14      ; (void *)0x0000000109935070: __stack_chk_guard
 0x107aaa4f4 <+30>:   movq   (%r14), %r14
 0x107aaa4f7 <+33>:   movq   %r14, -0x30(%rbp)
 0x107aaa4fb <+37>:   movq   0xb88ffe(%rip), %r13      ; UIViewController._view
 0x107aaa502 <+44>:   cmpq   $0x0, (%rbx,%r13)
 0x107aaa507 <+49>:   jne    0x107aaac9b               ; <+1989>
 0x107aaa50d <+55>:   movq   0xb51794(%rip), %rsi      ; "_isDeallocating"
 0x107aaa514 <+62>:   movq   %rbx, %rdi
 0x107aaa517 <+65>:   callq  *0xbcecc3(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa51d <+71>:   testb  %al, %al
 0x107aaa51f <+73>:   je     0x107aaa54c               ; <+118>
 0x107aaa521 <+75>:   movb   0xbc915b(%rip), %al       ; loadViewIfRequired.__warnOnce
 0x107aaa527 <+81>:   testb  %al, %al
 0x107aaa529 <+83>:   jne    0x107aaac9b               ; <+1989>
 0x107aaa52f <+89>:   leaq   0xc194ba(%rip), %rdi      ; @"Attempting to load the view of a view controller while it is deallocating is not allowed and may result in undefined behavior (%@)"
 0x107aaa536 <+96>:   xorl   %eax, %eax
 0x107aaa538 <+98>:   movq   %rbx, %rsi
 0x107aaa53b <+101>:  callq  0x1083e0e90               ; symbol stub for: NSLog
 0x107aaa540 <+106>:  movb   $0x1, 0xbc913b(%rip)      ; __disableNestedViewControllerSupport
 0x107aaa547 <+113>:  jmp    0x107aaac9b               ; <+1989>
 0x107aaa54c <+118>:  movq   0xb56905(%rip), %rsi      ; "loadView"
 0x107aaa553 <+125>:  movq   0xbcec86(%rip), %r15      ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa55a <+132>:  movq   %rbx, %rdi
 0x107aaa55d <+135>:  callq  *%r15
 0x107aaa560 <+138>:  movq   0xb56799(%rip), %rsi      ; "_installLayoutGuidesAndConstraintsIfNecessary"
 0x107aaa567 <+145>:  movq   %rbx, %rdi
 0x107aaa56a <+148>:  callq  *%r15
 0x107aaa56d <+151>:  movq   0xb4dbc4(%rip), %rsi      ; "_window"
 0x107aaa574 <+158>:  movq   %rbx, %rdi
 0x107aaa577 <+161>:  callq  *%r15
 0x107aaa57a <+164>:  movq   %rax, %rdi
 0x107aaa57d <+167>:  callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa582 <+172>:  movq   %rax, %r14
 0x107aaa585 <+175>:  movq   0xb4c44c(%rip), %rsi      ; "screen"
 0x107aaa58c <+182>:  movq   %r14, %rdi
 0x107aaa58f <+185>:  callq  *%r15
 0x107aaa592 <+188>:  movq   %rax, %rdi
 0x107aaa595 <+191>:  callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa59a <+196>:  movq   %rax, %r12
 0x107aaa59d <+199>:  movq   %r12, -0x1e8(%rbp)
 0x107aaa5a4 <+206>:  movq   %r14, %rdi
 0x107aaa5a7 <+209>:  callq  *0xbcec3b(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaa5ad <+215>:  testq  %r12, %r12
 0x107aaa5b0 <+218>:  je     0x107aaa60e               ; <+312>
 0x107aaa5b2 <+220>:  movq   0xb4c957(%rip), %rsi      ; "isViewLoaded"
 0x107aaa5b9 <+227>:  movq   %rbx, %rdi
 0x107aaa5bc <+230>:  callq  *0xbcec1e(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa5c2 <+236>:  testb  %al, %al
 0x107aaa5c4 <+238>:  je     0x107aaa60e               ; <+312>
 0x107aaa5c6 <+240>:  movq   0xb56543(%rip), %rsi      ; "contentScrollView"
 0x107aaa5cd <+247>:  movq   %rbx, %rdi
 0x107aaa5d0 <+250>:  callq  *%r15
 0x107aaa5d3 <+253>:  movq   %rax, %rdi
 0x107aaa5d6 <+256>:  callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa5db <+261>:  movq   %rax, %r14
 0x107aaa5de <+264>:  movq   0xb4b57b(%rip), %rsi      ; "_userInterfaceIdiom"
 0x107aaa5e5 <+271>:  movq   -0x1e8(%rbp), %r12
 0x107aaa5ec <+278>:  movq   %r12, %rdi
 0x107aaa5ef <+281>:  callq  *%r15
 0x107aaa5f2 <+284>:  movq   0xb514df(%rip), %rsi      ; "_willChangeToIdiom:onScreen:"
 0x107aaa5f9 <+291>:  movq   %r14, %rdi
 0x107aaa5fc <+294>:  movq   %rax, %rdx
 0x107aaa5ff <+297>:  movq   %r12, %rcx
 0x107aaa602 <+300>:  callq  *%r15
 0x107aaa605 <+303>:  movq   %r14, %rdi
 0x107aaa608 <+306>:  callq  *0xbcebda(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaa60e <+312>:  callq  0x1079031e8               ; _UIApplicationUsesLegacyUI
 0x107aaa613 <+317>:  testb  %al, %al
 0x107aaa615 <+319>:  je     0x107aaa6a1               ; <+459>
 0x107aaa61b <+325>:  movq   0xb4f71e(%rip), %rsi      ; "wantsFullScreenLayout"
 0x107aaa622 <+332>:  movq   %rbx, %rdi
 0x107aaa625 <+335>:  callq  *0xbcebb5(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa62b <+341>:  testb  %al, %al
 0x107aaa62d <+343>:  je     0x107aaa6a1               ; <+459>
 0x107aaa62f <+345>:  movq   (%rbx,%r13), %r14
 0x107aaa633 <+349>:  testq  %rbx, %rbx
 0x107aaa636 <+352>:  je     0x107aaa653               ; <+381>
 0x107aaa638 <+354>:  movq   0xb4f729(%rip), %rdx      ; "_defaultInitialViewFrame"
 0x107aaa63f <+361>:  leaq   -0x150(%rbp), %r12
 0x107aaa646 <+368>:  movq   %r12, %rdi
 0x107aaa649 <+371>:  movq   %rbx, %rsi
 0x107aaa64c <+374>:  callq  0x1083e1af6               ; symbol stub for: objc_msgSend_stret
 0x107aaa651 <+379>:  jmp    0x107aaa66b               ; <+405>
 0x107aaa653 <+381>:  leaq   -0x150(%rbp), %r12
 0x107aaa65a <+388>:  xorps  %xmm0, %xmm0
 0x107aaa65d <+391>:  movaps %xmm0, -0x140(%rbp)
 0x107aaa664 <+398>:  movaps %xmm0, -0x150(%rbp)
 0x107aaa66b <+405>:  movq   0xb4adc6(%rip), %rsi      ; "setFrame:"
 0x107aaa672 <+412>:  movq   0x18(%r12), %rax
 0x107aaa677 <+417>:  movq   %rax, 0x18(%rsp)
 0x107aaa67c <+422>:  movq   0x10(%r12), %rax
 0x107aaa681 <+427>:  movq   %rax, 0x10(%rsp)
 0x107aaa686 <+432>:  movq   (%r12), %rax
 0x107aaa68a <+436>:  movq   0x8(%r12), %rcx
 0x107aaa68f <+441>:  movq   %rcx, 0x8(%rsp)
 0x107aaa694 <+446>:  movq   %rax, (%rsp)
 0x107aaa698 <+450>:  movq   %r14, %rdi
 0x107aaa69b <+453>:  callq  *0xbceb3f(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa6a1 <+459>:  xorps  %xmm0, %xmm0
 0x107aaa6a4 <+462>:  movaps %xmm0, -0x160(%rbp)
 0x107aaa6ab <+469>:  movaps %xmm0, -0x170(%rbp)
 0x107aaa6b2 <+476>:  movaps %xmm0, -0x180(%rbp)
 0x107aaa6b9 <+483>:  movaps %xmm0, -0x190(%rbp)
 0x107aaa6c0 <+490>:  movq   0xb56821(%rip), %rsi      ; "storyboardSegueTemplates"
 0x107aaa6c7 <+497>:  movq   %rbx, %rdi
 0x107aaa6ca <+500>:  movq   %rbx, -0x1e0(%rbp)
 0x107aaa6d1 <+507>:  callq  *%r15
 0x107aaa6d4 <+510>:  movq   %rax, %rdi
 0x107aaa6d7 <+513>:  callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa6dc <+518>:  movq   %rax, -0x1d8(%rbp)
 0x107aaa6e3 <+525>:  movq   0xb4ab9e(%rip), %rsi      ; "countByEnumeratingWithState:objects:count:"
 0x107aaa6ea <+532>:  leaq   -0x190(%rbp), %rdx
 0x107aaa6f1 <+539>:  leaq   -0xb0(%rbp), %rcx
 0x107aaa6f8 <+546>:  movl   $0x10, %r8d
 0x107aaa6fe <+552>:  movq   %rax, %rdi
 0x107aaa701 <+555>:  callq  *%r15
 0x107aaa704 <+558>:  movq   %rax, %r14
 0x107aaa707 <+561>:  testq  %r14, %r14
 0x107aaa70a <+564>:  je     0x107aaa7bb               ; <+741>
 0x107aaa710 <+570>:  movq   -0x180(%rbp), %rax
 0x107aaa717 <+577>:  movq   (%rax), %r13
 0x107aaa71a <+580>:  movq   0xb567cf(%rip), %rbx      ; "performOnViewLoad"
 0x107aaa721 <+587>:  xorl   %r15d, %r15d
 0x107aaa724 <+590>:  movq   -0x180(%rbp), %rax
 0x107aaa72b <+597>:  cmpq   %r13, (%rax)
 0x107aaa72e <+600>:  je     0x107aaa73c               ; <+614>
 0x107aaa730 <+602>:  movq   -0x1d8(%rbp), %rdi
 0x107aaa737 <+609>:  callq  0x1083e1a96               ; symbol stub for: objc_enumerationMutation
 0x107aaa73c <+614>:  movq   -0x188(%rbp), %rax
 0x107aaa743 <+621>:  movq   (%rax,%r15,8), %r12
 0x107aaa747 <+625>:  movq   %r12, %rdi
 0x107aaa74a <+628>:  movq   %rbx, %rsi
 0x107aaa74d <+631>:  callq  *0xbcea8d(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa753 <+637>:  testb  %al, %al
 0x107aaa755 <+639>:  je     0x107aaa77f               ; <+681>
 0x107aaa757 <+641>:  movq   %r12, %rdi
 0x107aaa75a <+644>:  movq   0xb53ef7(%rip), %rsi      ; "perform:"
 0x107aaa761 <+651>:  movq   -0x1e0(%rbp), %rdx
 0x107aaa768 <+658>:  callq  *0xbcea72(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa76e <+664>:  movq   %rax, %rdi
 0x107aaa771 <+667>:  callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa776 <+672>:  movq   %rax, %rdi
 0x107aaa779 <+675>:  callq  *0xbcea69(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaa77f <+681>:  incq   %r15
 0x107aaa782 <+684>:  cmpq   %r14, %r15
 0x107aaa785 <+687>:  jb     0x107aaa724               ; <+590>
 0x107aaa787 <+689>:  movl   $0x10, %r8d
 0x107aaa78d <+695>:  movq   -0x1d8(%rbp), %rdi
 0x107aaa794 <+702>:  movq   0xb4aaed(%rip), %rsi      ; "countByEnumeratingWithState:objects:count:"
 0x107aaa79b <+709>:  leaq   -0x190(%rbp), %rdx
 0x107aaa7a2 <+716>:  leaq   -0xb0(%rbp), %rcx
 0x107aaa7a9 <+723>:  callq  *0xbcea31(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa7af <+729>:  movq   %rax, %r14
 0x107aaa7b2 <+732>:  testq  %r14, %r14
 0x107aaa7b5 <+735>:  jne    0x107aaa721               ; <+587>
 0x107aaa7bb <+741>:  movq   -0x1d8(%rbp), %rdi
 0x107aaa7c2 <+748>:  callq  *0xbcea20(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaa7c8 <+754>:  movq   0xb88de9(%rip), %rbx      ; UIViewController._storyboardPreviewingRegistrants
 0x107aaa7cf <+761>:  movq   -0x1e0(%rbp), %r15
 0x107aaa7d6 <+768>:  movq   (%r15,%rbx), %rdi
 0x107aaa7da <+772>:  movq   0xb4ab9f(%rip), %rsi      ; "count"
 0x107aaa7e1 <+779>:  callq  *0xbce9f9(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa7e7 <+785>:  testq  %rax, %rax
 0x107aaa7ea <+788>:  je     0x107aaa8c8               ; <+1010>
 0x107aaa7f0 <+794>:  xorps  %xmm0, %xmm0
 0x107aaa7f3 <+797>:  movaps %xmm0, -0x1a0(%rbp)
 0x107aaa7fa <+804>:  movaps %xmm0, -0x1b0(%rbp)
 0x107aaa801 <+811>:  movaps %xmm0, -0x1c0(%rbp)
 0x107aaa808 <+818>:  movaps %xmm0, -0x1d0(%rbp)
 0x107aaa80f <+825>:  movq   (%r15,%rbx), %rdi
 0x107aaa813 <+829>:  callq  *0xbce9d7(%rip)           ; (void *)0x0000000106bd5d00: objc_retain
 0x107aaa819 <+835>:  movq   %rax, %r14
 0x107aaa81c <+838>:  movq   0xb4aa65(%rip), %rsi      ; "countByEnumeratingWithState:objects:count:"
 0x107aaa823 <+845>:  leaq   -0x1d0(%rbp), %rdx
 0x107aaa82a <+852>:  leaq   -0x130(%rbp), %rcx
 0x107aaa831 <+859>:  movl   $0x10, %r8d
 0x107aaa837 <+865>:  movq   %r14, %rdi
 0x107aaa83a <+868>:  callq  *0xbce9a0(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa840 <+874>:  movq   %rax, %rbx
 0x107aaa843 <+877>:  testq  %rbx, %rbx
 0x107aaa846 <+880>:  je     0x107aaa8b8               ; <+994>
 0x107aaa848 <+882>:  movq   -0x1c0(%rbp), %rax
 0x107aaa84f <+889>:  movq   (%rax), %r12
 0x107aaa852 <+892>:  movq   0xb5669f(%rip), %r13      ; "registerForPreviewing"
 0x107aaa859 <+899>:  xorl   %r15d, %r15d
 0x107aaa85c <+902>:  movq   -0x1c0(%rbp), %rax
 0x107aaa863 <+909>:  cmpq   %r12, (%rax)
 0x107aaa866 <+912>:  je     0x107aaa870               ; <+922>
 0x107aaa868 <+914>:  movq   %r14, %rdi
 0x107aaa86b <+917>:  callq  0x1083e1a96               ; symbol stub for: objc_enumerationMutation
 0x107aaa870 <+922>:  movq   -0x1c8(%rbp), %rax
 0x107aaa877 <+929>:  movq   (%rax,%r15,8), %rdi
 0x107aaa87b <+933>:  movq   %r13, %rsi
 0x107aaa87e <+936>:  callq  *0xbce95c(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa884 <+942>:  incq   %r15
 0x107aaa887 <+945>:  cmpq   %rbx, %r15
 0x107aaa88a <+948>:  jb     0x107aaa85c               ; <+902>
 0x107aaa88c <+950>:  movl   $0x10, %r8d
 0x107aaa892 <+956>:  movq   %r14, %rdi
 0x107aaa895 <+959>:  movq   0xb4a9ec(%rip), %rsi      ; "countByEnumeratingWithState:objects:count:"
 0x107aaa89c <+966>:  leaq   -0x1d0(%rbp), %rdx
 0x107aaa8a3 <+973>:  leaq   -0x130(%rbp), %rcx
 0x107aaa8aa <+980>:  callq  *0xbce930(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa8b0 <+986>:  movq   %rax, %rbx
 0x107aaa8b3 <+989>:  testq  %rbx, %rbx
 0x107aaa8b6 <+992>:  jne    0x107aaa859               ; <+899>
 0x107aaa8b8 <+994>:  movq   %r14, %rdi
 0x107aaa8bb <+997>:  callq  *0xbce927(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaa8c1 <+1003>: movq   -0x1e0(%rbp), %r15
 0x107aaa8c8 <+1010>: movq   0xb88ce1(%rip), %rbx      ; UIViewController._storyboardCommitSegueTemplates
 0x107aaa8cf <+1017>: movq   (%r15,%rbx), %rdi
 0x107aaa8d3 <+1021>: movq   0xb4aaa6(%rip), %rsi      ; "count"
 0x107aaa8da <+1028>: callq  *0xbce900(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa8e0 <+1034>: testq  %rax, %rax
 0x107aaa8e3 <+1037>: je     0x107aaa917               ; <+1089>
 0x107aaa8e5 <+1039>: movq   0xb88cb4(%rip), %r14      ; UIViewController._storyboardSegueTemplates
 0x107aaa8ec <+1046>: movq   (%r15,%r14), %rdi
 0x107aaa8f0 <+1050>: movq   (%r15,%rbx), %rdx
 0x107aaa8f4 <+1054>: movq   0xb4b6a5(%rip), %rsi      ; "arrayByAddingObjectsFromArray:"
 0x107aaa8fb <+1061>: callq  *0xbce8df(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa901 <+1067>: movq   %rax, %rdi
 0x107aaa904 <+1070>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa909 <+1075>: movq   (%r15,%r14), %rdi
 0x107aaa90d <+1079>: movq   %rax, (%r15,%r14)
 0x107aaa911 <+1083>: callq  *0xbce8d1(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaa917 <+1089>: leaq   0xbcccd6(%rip), %rbx      ; _UIApplicationLinkedOnVersion
 0x107aaa91e <+1096>: movl   (%rbx), %eax
 0x107aaa920 <+1098>: testl  %eax, %eax
 0x107aaa922 <+1100>: je     0x107aaa92d               ; <+1111>
 0x107aaa924 <+1102>: cmpl   $0x80000, %eax            ; imm = 0x80000
 0x107aaa929 <+1107>: jb     0x107aaa974               ; <+1182>
 0x107aaa92b <+1109>: jmp    0x107aaa93b               ; <+1125>
 0x107aaa92d <+1111>: movl   $0x80000, %edi            ; imm = 0x80000
 0x107aaa932 <+1116>: callq  0x107911356               ; _UIApplicationLinkedOnOrAfter
 0x107aaa937 <+1121>: testb  %al, %al
 0x107aaa939 <+1123>: je     0x107aaa974               ; <+1182>
 0x107aaa93b <+1125>: movq   0xb88bbe(%rip), %rax      ; UIViewController._view
 0x107aaa942 <+1132>: movq   (%r15,%rax), %rdi
 0x107aaa946 <+1136>: movq   0xb4f42b(%rip), %rsi      ; "translatesAutoresizingMaskIntoConstraints"
 0x107aaa94d <+1143>: callq  *0xbce88d(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa953 <+1149>: testb  %al, %al
 0x107aaa955 <+1151>: je     0x107aaa974               ; <+1182>
 0x107aaa957 <+1153>: movq   0xb88ba2(%rip), %rax      ; UIViewController._view
 0x107aaa95e <+1160>: movq   (%r15,%rax), %rdi
 0x107aaa962 <+1164>: movq   0xb4fa17(%rip), %rsi      ; "_setHostsLayoutEngine:"
 0x107aaa969 <+1171>: movl   $0x1, %edx
 0x107aaa96e <+1176>: callq  *0xbce86c(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa974 <+1182>: movq   0xb563d5(%rip), %rsi      ; "_sendViewDidLoadWithAppearanceProxyObjectTaggingEnabled"
 0x107aaa97b <+1189>: movq   %r15, %rdi
 0x107aaa97e <+1192>: callq  *0xbce85c(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa984 <+1198>: movl   (%rbx), %eax
 0x107aaa986 <+1200>: testl  %eax, %eax
 0x107aaa988 <+1202>: je     0x107aaa997               ; <+1217>
 0x107aaa98a <+1204>: cmpl   $0x70000, %eax            ; imm = 0x70000
 0x107aaa98f <+1209>: jb     0x107aaac81               ; <+1963>
 0x107aaa995 <+1215>: jmp    0x107aaa9a9               ; <+1235>
 0x107aaa997 <+1217>: movl   $0x70000, %edi            ; imm = 0x70000
 0x107aaa99c <+1222>: callq  0x107911356               ; _UIApplicationLinkedOnOrAfter
 0x107aaa9a1 <+1227>: testb  %al, %al
 0x107aaa9a3 <+1229>: je     0x107aaac81               ; <+1963>
 0x107aaa9a9 <+1235>: movq   0xb4b168(%rip), %rsi      ; "searchDisplayController"
 0x107aaa9b0 <+1242>: movq   %r15, %rdi
 0x107aaa9b3 <+1245>: callq  *0xbce827(%rip)           ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa9b9 <+1251>: movq   %rax, %rdi
 0x107aaa9bc <+1254>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa9c1 <+1259>: movq   %rax, %r12
 0x107aaa9c4 <+1262>: testq  %r12, %r12
 0x107aaa9c7 <+1265>: je     0x107aaac81               ; <+1963>
 0x107aaa9cd <+1271>: movq   0xb4b144(%rip), %rsi      ; "searchDisplayController"
 0x107aaa9d4 <+1278>: movq   %r15, %rdi
 0x107aaa9d7 <+1281>: movq   0xbce802(%rip), %rbx      ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaa9de <+1288>: callq  *%rbx
 0x107aaa9e0 <+1290>: movq   %rax, %rdi
 0x107aaa9e3 <+1293>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaa9e8 <+1298>: movq   %rax, %r14
 0x107aaa9eb <+1301>: movq   0xb5650e(%rip), %rsi      ; "displaysSearchBarInNavigationBar"
 0x107aaa9f2 <+1308>: movq   %r14, %rdi
 0x107aaa9f5 <+1311>: callq  *%rbx
 0x107aaa9f7 <+1313>: testb  %al, %al
 0x107aaa9f9 <+1315>: je     0x107aaac70               ; <+1946>
 0x107aaa9ff <+1321>: movq   0xb54412(%rip), %rsi      ; "navigationController"
 0x107aaaa06 <+1328>: movq   %r15, %rdi
 0x107aaaa09 <+1331>: callq  *%rbx
 0x107aaaa0b <+1333>: movq   %rax, %rdi
 0x107aaaa0e <+1336>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaaa13 <+1341>: movq   %rax, -0x1d8(%rbp)
 0x107aaaa1a <+1348>: movq   0xb4b0cf(%rip), %rsi      ; "navigationBar"
 0x107aaaa21 <+1355>: movq   %rax, %rdi
 0x107aaaa24 <+1358>: callq  *%rbx
 0x107aaaa26 <+1360>: movq   %rax, %rdi
 0x107aaaa29 <+1363>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaaa2e <+1368>: movq   %rax, -0x1f0(%rbp)
 0x107aaaa35 <+1375>: movq   0xb51ddc(%rip), %rsi      ; "topItem"
 0x107aaaa3c <+1382>: movq   %rax, %rdi
 0x107aaaa3f <+1385>: callq  *%rbx
 0x107aaaa41 <+1387>: movq   %rax, %rdi
 0x107aaaa44 <+1390>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaaa49 <+1395>: movq   %rax, -0x200(%rbp)
 0x107aaaa50 <+1402>: movq   0xb4b0c1(%rip), %rsi      ; "searchDisplayController"
 0x107aaaa57 <+1409>: movq   %r15, %rdi
 0x107aaaa5a <+1412>: callq  *%rbx
 0x107aaaa5c <+1414>: movq   %rax, %rdi
 0x107aaaa5f <+1417>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaaa64 <+1422>: movq   %r14, -0x1f8(%rbp)
 0x107aaaa6b <+1429>: movq   %rax, %r14
 0x107aaaa6e <+1432>: movq   0xb4b0ab(%rip), %rsi      ; "navigationItem"
 0x107aaaa75 <+1439>: movq   %r14, %rdi
 0x107aaaa78 <+1442>: callq  *%rbx
 0x107aaaa7a <+1444>: movq   %rax, %rdi
 0x107aaaa7d <+1447>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaaa82 <+1452>: movq   %rax, %r13
 0x107aaaa85 <+1455>: movq   0xbce75c(%rip), %r15      ; (void *)0x0000000106bd5d70: objc_release
 0x107aaaa8c <+1462>: movq   %r13, %rdi
 0x107aaaa8f <+1465>: callq  *%r15
 0x107aaaa92 <+1468>: movq   %r14, %rdi
 0x107aaaa95 <+1471>: callq  *%r15
 0x107aaaa98 <+1474>: movq   -0x200(%rbp), %rbx
 0x107aaaa9f <+1481>: movq   %rbx, %rdi
 0x107aaaaa2 <+1484>: callq  *%r15
 0x107aaaaa5 <+1487>: movq   -0x1f0(%rbp), %rdi
 0x107aaaaac <+1494>: callq  *%r15
 0x107aaaaaf <+1497>: movq   -0x1d8(%rbp), %rdi
 0x107aaaab6 <+1504>: callq  *%r15
 0x107aaaab9 <+1507>: movq   -0x1f8(%rbp), %rdi
 0x107aaaac0 <+1514>: callq  *%r15
 0x107aaaac3 <+1517>: movq   %r12, %rdi
 0x107aaaac6 <+1520>: callq  *%r15
 0x107aaaac9 <+1523>: cmpq   %r13, %rbx
 0x107aaaacc <+1526>: movq   -0x1e0(%rbp), %r14
 0x107aaaad3 <+1533>: je     0x107aaac81               ; <+1963>
 0x107aaaad9 <+1539>: movq   0xb54338(%rip), %rsi      ; "navigationController"
 0x107aaaae0 <+1546>: movq   %r14, %rdi
 0x107aaaae3 <+1549>: movq   0xbce6f6(%rip), %r12      ; (void *)0x0000000106bd8800: objc_msgSend
 0x107aaaaea <+1556>: callq  *%r12
 0x107aaaaed <+1559>: movq   %rax, %rdi
 0x107aaaaf0 <+1562>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaaaf5 <+1567>: movq   %rax, %rbx
 0x107aaaaf8 <+1570>: movq   0xb4aff1(%rip), %rsi      ; "navigationBar"
 0x107aaaaff <+1577>: movq   %rbx, %rdi
 0x107aaab02 <+1580>: callq  *%r12
 0x107aaab05 <+1583>: movq   %rax, %rdi
 0x107aaab08 <+1586>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaab0d <+1591>: movq   %rax, %r13
 0x107aaab10 <+1594>: movq   %rbx, %rdi
 0x107aaab13 <+1597>: callq  *%r15
 0x107aaab16 <+1600>: movq   0xb524f3(%rip), %rsi      ; "items"
 0x107aaab1d <+1607>: movq   %r13, %rdi
 0x107aaab20 <+1610>: callq  *%r12
 0x107aaab23 <+1613>: movq   %rax, %rdi
 0x107aaab26 <+1616>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaab2b <+1621>: movq   %rax, %rbx
 0x107aaab2e <+1624>: movq   0xb88a5b(%rip), %rax      ; UIViewController._navigationItem
 0x107aaab35 <+1631>: movq   (%r14,%rax), %rdx
 0x107aaab39 <+1635>: movq   0xb4ab40(%rip), %rsi      ; "indexOfObject:"
 0x107aaab40 <+1642>: movq   %rbx, %rdi
 0x107aaab43 <+1645>: callq  *%r12
 0x107aaab46 <+1648>: movq   %rax, %r14
 0x107aaab49 <+1651>: movq   %rbx, %rdi
 0x107aaab4c <+1654>: callq  *%r15
 0x107aaab4f <+1657>: movq   %r13, %r15
 0x107aaab52 <+1660>: movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF
 0x107aaab5c <+1670>: cmpq   %rax, %r14
 0x107aaab5f <+1673>: je     0x107aaac65               ; <+1935>
 0x107aaab65 <+1679>: movq   0xb524dc(%rip), %rsi      ; "setLocked:"
 0x107aaab6c <+1686>: xorl   %edx, %edx
 0x107aaab6e <+1688>: movq   %r15, %rdi
 0x107aaab71 <+1691>: callq  *%r12
 0x107aaab74 <+1694>: movq   0xb52495(%rip), %rsi      ; "items"
 0x107aaab7b <+1701>: movq   %r15, %rdi
 0x107aaab7e <+1704>: callq  *%r12
 0x107aaab81 <+1707>: movq   %rax, %rdi
 0x107aaab84 <+1710>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaab89 <+1715>: movq   %rax, %r14
 0x107aaab8c <+1718>: movq   0xb4d9e5(%rip), %rsi      ; "mutableCopy"
 0x107aaab93 <+1725>: movq   %r14, %rdi
 0x107aaab96 <+1728>: callq  *%r12
 0x107aaab99 <+1731>: movq   %rax, %rbx
 0x107aaab9c <+1734>: movq   %r14, %rdi
 0x107aaab9f <+1737>: movq   0xbce642(%rip), %r14      ; (void *)0x0000000106bd5d70: objc_release
 0x107aaaba6 <+1744>: callq  *%r14
 0x107aaaba9 <+1747>: movq   -0x1e0(%rbp), %r13
 0x107aaabb0 <+1754>: movq   0xb889d9(%rip), %rax      ; UIViewController._navigationItem
 0x107aaabb7 <+1761>: movq   (%r13,%rax), %rdx
 0x107aaabbc <+1766>: movq   0xb4aabd(%rip), %rsi      ; "indexOfObject:"
 0x107aaabc3 <+1773>: movq   %rbx, %rdi
 0x107aaabc6 <+1776>: movq   %rbx, %r14
 0x107aaabc9 <+1779>: callq  *%r12
 0x107aaabcc <+1782>: movq   %rax, -0x1d8(%rbp)
 0x107aaabd3 <+1789>: movq   0xb4af3e(%rip), %rsi      ; "searchDisplayController"
 0x107aaabda <+1796>: movq   %r13, %rdi
 0x107aaabdd <+1799>: callq  *%r12
 0x107aaabe0 <+1802>: movq   %rax, %rdi
 0x107aaabe3 <+1805>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaabe8 <+1810>: movq   %rax, %r13
 0x107aaabeb <+1813>: movq   0xb4af2e(%rip), %rsi      ; "navigationItem"
 0x107aaabf2 <+1820>: movq   %r13, %rdi
 0x107aaabf5 <+1823>: callq  *%r12
 0x107aaabf8 <+1826>: movq   %rax, %rdi
 0x107aaabfb <+1829>: callq  0x1083e1b0e               ; symbol stub for: objc_retainAutoreleasedReturnValue
 0x107aaac00 <+1834>: movq   %rax, %rbx
 0x107aaac03 <+1837>: movq   0xb4e61e(%rip), %rsi      ; "replaceObjectAtIndex:withObject:"
 0x107aaac0a <+1844>: movq   %r14, %rdi
 0x107aaac0d <+1847>: movq   -0x1d8(%rbp), %rdx
 0x107aaac14 <+1854>: movq   %rbx, %rcx
 0x107aaac17 <+1857>: callq  *%r12
 0x107aaac1a <+1860>: movq   %rbx, %rdi
 0x107aaac1d <+1863>: movq   0xbce5c4(%rip), %rbx      ; (void *)0x0000000106bd5d70: objc_release
 0x107aaac24 <+1870>: callq  *%rbx
 0x107aaac26 <+1872>: movq   %r13, %rdi
 0x107aaac29 <+1875>: callq  *%rbx
 0x107aaac2b <+1877>: movq   %rbx, %r13
 0x107aaac2e <+1880>: movq   0xb523d3(%rip), %rsi      ; "setItems:animated:"
 0x107aaac35 <+1887>: xorl   %ecx, %ecx
 0x107aaac37 <+1889>: movq   %r15, %rdi
 0x107aaac3a <+1892>: movq   %r14, %rdx
 0x107aaac3d <+1895>: callq  *%r12
 0x107aaac40 <+1898>: movq   0xb52401(%rip), %rsi      ; "setLocked:"
 0x107aaac47 <+1905>: movl   $0x1, %edx
 0x107aaac4c <+1910>: movq   %r15, %rdi
 0x107aaac4f <+1913>: callq  *%r12
 0x107aaac52 <+1916>: movq   0xb4a4af(%rip), %rsi      ; "setNeedsDisplay"
 0x107aaac59 <+1923>: movq   %r15, %rdi
 0x107aaac5c <+1926>: callq  *%r12
 0x107aaac5f <+1929>: movq   %r14, %rdi
 0x107aaac62 <+1932>: callq  *%r13
 0x107aaac65 <+1935>: movq   %r15, %rdi
 0x107aaac68 <+1938>: callq  *0xbce57a(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaac6e <+1944>: jmp    0x107aaac81               ; <+1963>
 0x107aaac70 <+1946>: movq   0xbce571(%rip), %rbx      ; (void *)0x0000000106bd5d70: objc_release
 0x107aaac77 <+1953>: movq   %r14, %rdi
 0x107aaac7a <+1956>: callq  *%rbx
 0x107aaac7c <+1958>: movq   %r12, %rdi
 0x107aaac7f <+1961>: callq  *%rbx
 0x107aaac81 <+1963>: movq   -0x1e8(%rbp), %rdi
 0x107aaac88 <+1970>: callq  *0xbce55a(%rip)           ; (void *)0x0000000106bd5d70: objc_release
 0x107aaac8e <+1976>: movq   0xbcddd3(%rip), %rbx      ; (void *)0x0000000109935070: __stack_chk_guard
 0x107aaac95 <+1983>: movq   (%rbx), %rbx
 0x107aaac98 <+1986>: movq   %rbx, %r14
 0x107aaac9b <+1989>: cmpq   -0x30(%rbp), %r14
 0x107aaac9f <+1993>: jne    0x107aaacb3               ; <+2013>
 0x107aaaca1 <+1995>: addq   $0x1f8, %rsp              ; imm = 0x1F8
 0x107aaaca8 <+2002>: popq   %rbx
 0x107aaaca9 <+2003>: popq   %r12
 0x107aaacab <+2005>: popq   %r13
 0x107aaacad <+2007>: popq   %r14
 0x107aaacaf <+2009>: popq   %r15
 0x107aaacb1 <+2011>: popq   %rbp
 0x107aaacb2 <+2012>: retq
 0x107aaacb3 <+2013>: callq  0x1083e21f8               ; symbol stub for: __stack_chk_fail
 */

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kNormalCell];
    cell.textLabel.text = [NSString stringWithFormat:@"Cell-%zd", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController* viewController = [self viewControllerForIndexPath:indexPath];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (UIViewController*)viewControllerForIndexPath:(NSIndexPath *)indexPath
{
    NSArray* vcNames = @[@"XMMallHomePageViewController", @"XMMallHomePageViewController"];
    Class cls = NSClassFromString(vcNames[indexPath.row]);
    NSParameterAssert([cls isSubclassOfClass:[UIViewController class]]);
    UIViewController* viewController = [cls new];
    return viewController;
}

@end
