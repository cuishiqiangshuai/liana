//
//  main.m
//  hgbjvjh
//
//  Created by qingyun on 16/3/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int chuck[6]={2,4,6,8,10,12};
        int i,j = 0,dipsea[6]={0};
        for (i=0; i<=5; i++)
            j=i++;
        dipsea[j]=chuck[i];
                printf("%d,",dipsea[j]);
            
        
    }
    return 0;
}
