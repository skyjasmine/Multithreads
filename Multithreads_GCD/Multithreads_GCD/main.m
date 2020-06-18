/*
   问题：封装Objective-C对象Executer和Task，Executer初始化时接受多个Task。
   为Executer提供execute方法，异步地执行所有Task。
   以及-onFinish:(Block)anBlock方法，在所有Task结束之后执行这个block。
*/

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ExecutorOperationImpl.h"
#import "ExecutorGCdImpl.h"
#import "ExecutorFactory.h"
#import "Task.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        Task *t1 = [[Task alloc]init];
        Task *t2 = [[Task alloc]init];
        Task *t3 = [[Task alloc]init];
        Task *t4 = [[Task alloc]init];
        Task *t5 = [[Task alloc]init];
        NSArray *array = @[t1,t2,t3,t4,t5];

        dispatch_block_t blk = ^{
            [NSThread sleepForTimeInterval:2];
            NSLog(@"在所有Task结束后执行该block");
        };
        
        //test NSOperation method
//        ExecutorOperationImpl *exe1 = [[ExecutorOperationImpl alloc]init];
//        [exe1 executeTasks:array onFinish:blk];
//
        
        //test GCD method
//        ExecutorGCdImpl *exe2 = [[ExecutorGCdImpl alloc]init];
//        [exe2 executeTasks:array onFinish:blk];
        
        id exe = [ExecutorFactory operatinExecutor];
        [exe executeTasks:array onFinish:blk];
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
