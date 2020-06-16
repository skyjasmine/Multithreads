/*
    问题：封装Objective-C对象Executer和Task，Executer初始化时接受多个Task。
    为Executer提供execute方法，异步地执行所有Task。
    以及-OnFinish:(Block)anBlock方法，在所有Task结束之后执行这个block。
 */

#import "Executer.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        Executer *exe = [[Executer alloc]init];
        [exe execute];
        blk_t blk = ^{NSLog(@"在所有Task结束后执行该block");};
        [exe OnFinish:blk];
    }
    return 0;
}

