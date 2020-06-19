#import <Foundation/Foundation.h>
#import "Executable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Executor <NSObject>

-(void)executeTasks:(NSArray<id<Executable>> *)tasks onFinish:(dispatch_block_t)completion;

@end

NS_ASSUME_NONNULL_END
