#import <Foundation/Foundation.h>
@class Barcode;
@class JuheClient;
@interface BarcodeSupplier : NSObject
+ (instancetype)sharedSupplier;
- (JuheClient *)serviceClient;
#pragma mark - 条码数据服务
- (void)registerBarcodeKey:(NSString *)keyString;
- (void)unregisterBarcodeKey:(NSString *)keyString;
- (NSString *)getLatestBarcodeKey;
- (Barcode *)getBarcodeService;
@end
