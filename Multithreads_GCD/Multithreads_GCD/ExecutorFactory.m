#import "ExecutorFactory.h"
#import "ExecutorGCDImpl.h"
#import "ExecutorOperationImpl.h"

@implementation ExecutorFactory

+(id<Executor>)gcdExecutor
{
    return [[ExecutorGCdImpl alloc]init];
}

+(id<Executor>)operationExecutor
{
    return [[ExecutorOperationImpl alloc]init];
}

@end
