//
//  main.m
//  乘法表
//
//  Created by qingyun on 16/3/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    //定义一个单位
    int x,y;
    //定义一个变量
    for (x=1; x<10; x++) {
        for (y=1; y<10; y++) {
            //条件   代码块
            if (y<=x)
                //是输出格式
                printf("%d*%d=%-4d",y,x,y*x);
            }
        printf("\n");
        
        }
}


