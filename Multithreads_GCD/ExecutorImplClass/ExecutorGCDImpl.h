#import <Foundation/Foundation.h>
#import "Executor.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExecutorGCDImpl : NSObject<Executor>

@property (nonatomic,strong) dispatch_queue_t queue;

@end

NS_ASSUME_NONNULL_END
