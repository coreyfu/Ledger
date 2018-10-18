#import <Foundation/Foundation.h>
@interface Ledger : NSObject <NSCoding>
@property NSString *ledgerType;
@property NSNumber* balance;
@property NSString* inOrOut;
@property NSString *PS;
@property NSString *date;
@end
