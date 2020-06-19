#import <Foundation/Foundation.h>
#import "Executor.h"

NS_ASSUME_NONNULL_BEGIN

@class ExecutorGCdImpl;
@class ExecutorOperationImpl;

@interface ExecutorFactory : NSObject

+(id<Executor>)gcdExecutor;
+(id<Executor>)operatinExecutor;

@end

NS_ASSUME_NONNULL_END
