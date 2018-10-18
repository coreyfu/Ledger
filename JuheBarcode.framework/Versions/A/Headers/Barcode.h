#import <Foundation/Foundation.h>
@interface Barcode : NSObject
- (instancetype)initWithCodeURL:(NSString *)urlstring;
- (void)executeWorkWithAPI:(NSString *)api method:(NSString *)httpMethod parameters:(NSDictionary *)paras success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failre;
@end
