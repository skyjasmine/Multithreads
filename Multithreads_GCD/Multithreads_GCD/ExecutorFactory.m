#import "ExecutorFactory.h"
#import "ExecutorGCdImpl.h"
#import "ExecutorOperationImpl.h"

@implementation ExecutorFactory

+(id<Executor>)gcdExecutor
{
    return [[ExecutorGCdImpl alloc]init];
}

+(id<Executor>)operatinExecutor
{
    return [[ExecutorOperationImpl alloc]init];
}

@end
