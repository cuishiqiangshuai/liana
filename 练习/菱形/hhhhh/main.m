//
//  main.m
//  hhhhh
//
//  Created by len on 15/9/16.
//  Copyright (c) 2015年 WangHao. All rights reserved.
//

#import <Foundation/Foundation.h>
void f1()
{
    int i,j,k;
    for(i=0;i<=3;i++)
    {
        for(j=0;j<=2-i;j++)
            printf(" ");
        for(k=0;k<=2*i;k++)
            printf("*");
        printf("\n");
    }
    for(i=0;i<=2;i++)
    {
        for(j=0;j<=i;j++)
            printf(" ");
        for(k=0;k<=4-2*i;k++)
            printf("*");
        printf("\n");
    }
}

void f2()
{
    int i,j,k;
    for(i=1;i<=4;i++)
    {
        for(j=1;j<=4-i;j++)
            printf(" ");
        for(k=1;k<=i;k++)
            printf(" *");
        printf("\n");
    }
    for(i=1;i<=3;i++)
    {
        for(j=1;j<=i;j++)
            printf(" ");
        for(k=1;k<=4-i;k++)
            printf(" *");
        printf("\n");
    }
}

void f3()
{
    int num,whCol = 0;
    printf("输入菱形的行数（基数）\n");
    scanf("%d",&num);
    if (num%2==0)
    {
        printf("数组必须是基数\n");
    }
    else
    {
        whCol=num/2+1;
    }
    for (int i=0; i<whCol; i++)
    {
        for (int k=0; k<whCol-1-i; k++)
        {
            printf(" ");
        }
        for (int j=0; j<=2*i; j++)
        {
            printf("*");
        }
        printf("\n");
    }
    for (int i=0; i<whCol-1; i++)
    {
        for (int j=0; j<=i; j++)
        {
            printf(" ");
        }
        for (int k=0; k<whCol-2*i; k++)
        {
            printf("*");
        }
        printf("\n");
    }
}
void f4()
{
    int num,whCol=0;
    printf("输入行数（基数）\n");
    scanf("%d",&num);
    if (num%2==0)
    {
        printf("必须是基数\n");
    }
    else
    {
        whCol=num/2;
        for (int i=-whCol; i<=whCol; i++)//行
        {
            for (int j=0; j<abs(i); j++)
            {
                printf(" ");
            }
            for (int k=num-abs(i); k>abs(i); k--)
            {
                printf("*");
            }
            printf("\n");
        }
    }
}
void f5()
{
    printf("输入行数\n");
    int num;
    scanf("%d",&num);
    if (num%2!=0)
    {
        for (int i=-num/2; i<=num/2; i++)//多少行
        {
            for (int j=0; j<num-abs(i); j++)//每一行内容
            {
                if (j<abs(i))
                {
                    printf(" ");
                }
                else
                {
                    printf("*");
                }
            }
            printf("\n");
        }
    }
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        f1();
//        f2();
//        f3();
//        f4();
        f5();
    }
    return 0;
}
