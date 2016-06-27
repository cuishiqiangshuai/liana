//
//  main.m
//  练习
//
//  Created by qingyun on 16/3/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a[3][3];
        for (int a1=0;a1<3;a1++) {
            for (int a2=0; a2<3; a2++) {
                scanf("%d",&a[a1][a2]);
            }
        }
        for (int a1=0;a1<3;a1++) {
            for (int a2=0; a2<3; a2++){
                printf("%3d",a[a1][a2]);
            }
            printf("\n");
        }
        return 0;
}
}
