/*etc  崔世强
 * 打字小游戏
 * 2016/3/24
 * ***程序伪代码
 * 1.定义字符串
 * 2.随机出现需要输入的字符串
 * 3.定义标记（正确和错误的个数，开始和结束的时间）
 * 4，开始输入， 开始计时
 * 5，判断正误，做好统计  ，给出提示
 * 6.输入完成，计时结束，显示正误个数和正确率
 * */
#include<stdio.h>//标准输入输出库
#include<string.h>//字符串的相关操作
#include<time.h>//计时相关操作
#include<stdlib.h>
int main(void)
{
    //定义指针数组
    char *array[]={"auto","int","void","float","double","char","long","short","bool","YES","true","false","while","for","do","switch","case","default","break","continue","unsigned","extern","static","typdef","define","struct","enum","union"};
    //定义需要输入的字符串
    char *scanArr[20]={"\0"};

    //预览
    for(int i=0;i<28;i++)
    {
        printf("")
    }
    return 0;
}
