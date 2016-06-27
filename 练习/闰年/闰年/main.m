//
//  main.m
//  闰年
//
//  Created by qingyun on 16/3/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    //定义i
    int i;
    //输入函数
    scanf("%d",&i);
    //&&是“而且”的意思 %是求余  /是除
    if (i%4==0 && i/100%4==0){
        //是输出格式
        printf("%d年是闰年\n",i);
       //else是否则则是平年
    }else{printf("%d年是平年\n",i);
    }
    
    
}
