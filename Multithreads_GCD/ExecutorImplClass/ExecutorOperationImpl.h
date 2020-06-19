#import <Foundation/Foundation.h>
#import "Executor.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExecutorOperationImpl : NSObject<Executor>

@property (nonatomic,strong) NSOperationQueue *queue;

@end

NS_ASSUME_NONNULL_END
