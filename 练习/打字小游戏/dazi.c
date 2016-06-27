/*
 *崔世强
 *打字小游戏
 *2016/03/12
 *功能
 *从键盘输入制定字符串，统计时间，计算时间
 */
#include<stdio.h>
#include<string.h>//c 的字符串的相关操作
#include<time.h>//c中用来计时的框架
#include<stdlib.h>//c中分配内存需要
int main()
{
    //定义需要从键盘上输入的内容
    char *array[]={"int","char","double","auto","float","short","const","if","else","switch","continue","typeder","long","while","break","void","struct","union","unsigned","do"};
    //显示
    for (int i=0; i<20; i++)
    {
        printf ("%s ",array[i]);
    }
    printf("\n");
    //定义指针数组存放输入字符串
    char *scanArr[20];
    printf("开始输入\n");
       int sucess1=0;//正确的数量
    int error1=0;// 错误的数量
    //计时用到的变量
    time_t start,end;
    //开始计时
    long startTime=time(&start);
    for (int i=0; i<20; i++) {
        char *tmpArr=malloc(30);//定义临时数组，保存单个字符串
        scanf("%s",tmpArr);
        //将输入的字符串保存到指针数组
        scanArr[i]=tmpArr;
        //用当前单词和系统单词比较
        if (strcmp(array[i],scanArr[i])==0) {
            //相等，证明输入正确
            sucess1++;
        }
        else{
            //输入有误
            error1++;
            // 显示错误
            printf("error:%s->%s(系统)",scanArr[i],array[i]);
        }
    }
    //验证：输入的数据
    for (int i=0; i<20; i++) {
        printf("%s ",scanArr[i]);
    }
    printf("\n");
    //停止计时
    long endTime=time(&end);
    //计算准确率
    float ave=(float)sucess1/20*100;
    printf("用了%ld秒，正确：%d个，错误：%d个！准确率：%.2f%%\n",endTime-startTime,sucess1,error1,ave);
    
    return 0;
}