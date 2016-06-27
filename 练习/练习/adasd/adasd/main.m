//
//  main.m
//  adasd
//
//  Created by qingyun on 16/3/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char a[20]={0};
        int c=0;
        printf("输入一行字符\n");
        gets(a);
        for (int i=0;i<strlen(a);i++) {
            if (a[i]==' ')
            {
                c++;
            }
        }
        printf("%d\n",c);
    }
    return 0;
}
